import Foundation

public enum TransliterationError: Error {
    case invalidMode(String)
    case notImplemented(String)
    case grammarLoadingError(Error)
}

public class Transliteration {
    public enum Mode: String {
        case avro, orva, banglish, lishbang
    }

    class TrieNode {
        var children: [Character: TrieNode] = [:]
        var pattern: Pattern?
        var isEndOfPattern: Bool = false
    }

    let rules: Grammar
    let patterns: [Pattern]
    let trie: TrieNode
    
    init() throws {
        guard let rulesURL = Bundle.module.url(forResource: "rules", withExtension: "json") else {
            throw TransliterationError.grammarLoadingError(NSError(domain: "Transliteration", code: 1, userInfo: [NSLocalizedDescriptionKey: "rules.json not found"]))
        }

        do {
            let data = try Data(contentsOf: rulesURL)
            let decoder = JSONDecoder()
            let grammarFile = try decoder.decode(GrammarFile.self, from: data)
            guard let loadedGrammar = Grammar.fromJson(grammarFile) else {
                throw TransliterationError.grammarLoadingError(NSError(domain: "Transliteration", code: 2, userInfo: [NSLocalizedDescriptionKey: "Failed to parse grammar from JSON"]))
            }
            self.rules = loadedGrammar
            self.patterns = loadedGrammar.patterns
            self.trie = Transliteration.buildTrie(patterns: self.patterns)
        } catch {
            throw TransliterationError.grammarLoadingError(error)
        }
    }

    static func buildTrie(patterns: [Pattern]) -> TrieNode {
        let root = TrieNode()
        // Sort patterns by length in descending order to match longer patterns first
        let sortedPatterns = patterns.sorted { $0.find.count > $1.find.count }
        for pattern in sortedPatterns {
            var currentNode = root
            for char in pattern.find {
                if currentNode.children[char] == nil {
                    currentNode.children[char] = TrieNode()
                }
                currentNode = currentNode.children[char]!
            }
            currentNode.isEndOfPattern = true
            currentNode.pattern = pattern
        }
        return root
    }

    public func transliterate(text: String, mode: Mode) throws -> String {
        switch mode {
        case .avro:
            return try avro(text: text)
        case .orva:
            throw TransliterationError.notImplemented("Orva mode is not yet implemented")
        case .banglish:
            throw TransliterationError.notImplemented("Banglish mode is not yet implemented")
        case .lishbang:
            throw TransliterationError.notImplemented("Lishbang mode is not yet implemented")
        }
    }

    private func avro(text: String) throws -> String {
        let fixed = fixString(text)
        let chars = Array(fixed)
        var output = ""
        output.reserveCapacity(fixed.count * 2) // Pre-allocate capacity
        
        var currentIndex = 0
        let textLength = chars.count

        while currentIndex < textLength {
            var currentNode = trie
            var i = currentIndex
            var longestMatch = 0
            var longestPattern: Pattern?

            while i < textLength {
                let char = chars[i]
                guard let nextNode = currentNode.children[char] else {
                    break
                }
                if nextNode.isEndOfPattern {
                    longestMatch = i - currentIndex + 1
                    longestPattern = nextNode.pattern
                }
                currentNode = nextNode
                i += 1
            }

            if let pattern = longestPattern {
                let endIndex = currentIndex + longestMatch
                let result = try processPattern(pattern: pattern, chars: chars, startIndex: currentIndex, endIndex: endIndex)
                output += result.output
                currentIndex = result.newIndex + 1
            } else {
                output.append(chars[currentIndex])
                currentIndex += 1
            }
        }

        return output
    }

    private func processPattern(pattern: Pattern, chars: [Character], startIndex: Int, endIndex: Int) throws -> (output: String, newIndex: Int) {
        guard let rules = pattern.rules else {
            return (pattern.replace, endIndex - 1)
        }

        let previousIndex = startIndex - 1

        for rule in rules {
            var shouldReplace = true
            for match in rule.matches {
                let isSuffix = match.type == .suffix
                let checkIndex = isSuffix ? endIndex : previousIndex
                let isNegative = match.negative
                let scope = match.scope

                if let scope = scope {
                    switch scope {
                    case .punctuation:
                        let hasPunctuation =
                            (checkIndex < 0 && !isSuffix) ||
                            (checkIndex >= chars.count && isSuffix) ||
                            (checkIndex >= 0 && checkIndex < chars.count && isPunctuation(chars[checkIndex]))

                        if hasPunctuation == isNegative {
                            shouldReplace = false
                            break
                        }
                    case .vowel:
                        let isVowelMatch =
                            ((checkIndex >= 0 && !isSuffix) ||
                                (checkIndex < chars.count && isSuffix)) &&
                            (checkIndex >= 0 && checkIndex < chars.count && isVowel(chars[checkIndex]))

                        if isVowelMatch == isNegative {
                            shouldReplace = false
                            break
                        }
                    case .consonant:
                        let isConsonantMatch =
                            ((checkIndex >= 0 && !isSuffix) ||
                                (checkIndex < chars.count && isSuffix)) &&
                            (checkIndex >= 0 && checkIndex < chars.count && isConsonant(chars[checkIndex]))

                        if isConsonantMatch == isNegative {
                            shouldReplace = false
                            break
                        }
                    case .exact:
                        if let value = match.value {
                            let sIndex = isSuffix ? endIndex : max(0, startIndex - value.count)
                            let eIndex = isSuffix ? min(chars.count, endIndex + value.count) : startIndex

                            if sIndex >= 0 && eIndex <= chars.count && sIndex <= eIndex {
                                let substring = String(chars[sIndex..<eIndex])
                                let isExactMatch = (substring == value)
                                if isExactMatch == isNegative {
                                    shouldReplace = false
                                    break
                                }
                            } else {
                                if !isNegative {
                                    shouldReplace = false
                                    break
                                }
                            }
                        } else {
                            if !isNegative {
                                shouldReplace = false
                                break
                            }
                        }
                    }
                }
            }

            if shouldReplace {
                return (rule.replace, endIndex - 1)
            }
        }

        return (pattern.replace, endIndex - 1)
    }


    private func fixString(_ input: String) -> String {
        var output = ""
        output.reserveCapacity(input.count)
        for char in input {
            if isCaseSensitive(char) {
                output.append(char)
            } else {
                output.append(Character(String(char).lowercased()))
            }
        }
        return output
    }

    private func isVowel(_ c: Character) -> Bool {
        return self.rules.vowel.contains(Character(String(c).lowercased()))
    }

    private func isConsonant(_ c: Character) -> Bool {
        return self.rules.consonant.contains(Character(String(c).lowercased()))
    }

    private func isPunctuation(_ c: Character) -> Bool {
        let lowercased = Character(String(c).lowercased())
        return !self.rules.vowel.contains(lowercased) && !self.rules.consonant.contains(lowercased)
    }

    private func isCaseSensitive(_ c: Character) -> Bool {
        return self.rules.casesensitive.contains(Character(String(c).lowercased()))
    }
}