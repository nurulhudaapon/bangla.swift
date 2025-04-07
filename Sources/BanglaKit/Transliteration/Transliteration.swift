import Foundation

/// Errors that can occur during the transliteration process
public enum TransliterationError: Error {
    /// Indicates that an invalid transliteration mode was specified
    case invalidMode(String)
    /// Indicates that the requested feature is not yet implemented
    case notImplemented(String)
    /// Indicates that there was an error loading or parsing the grammar rules
    case grammarLoadingError(Error)
}

/// A class that handles transliteration between Bangla and Latin scripts using various modes.
///
/// The transliteration system supports multiple modes to accommodate different typing preferences 
/// and use cases. Each mode is optimized for specific scenarios, from formal typing to casual communication.
///
/// Example usage:
/// ```swift
/// let transliterator = try Transliteration()
/// let banglaText = try transliterator.transliterate(text: "amar sonar bangla", mode: .avro)
/// print(banglaText) // Prints: আমার সোনার বাংলা
/// ```
public class Transliteration {
    /// Available transliteration modes for converting between Bangla and Latin scripts
    public enum Mode: String {
        /// Most popular phonetic typing system for Bangla
        ///
        /// Avro Phonetic is the most widely used phonetic typing method for Bangla text.
        /// It follows intuitive phonetic rules where you type words exactly as they sound.
        ///
        /// Example:
        /// ```swift
        /// try transliterate("amar sOnar bangla", mode: .avro) // → "আমার সোনার বাংলা"
        /// try transliterate("jIbon", mode: .avro) // → "জীবন"
        /// ```
        case avro
        
        /// Reverse transliteration from Bangla to Latin script
        ///
        /// Orva performs reverse transliteration from Bangla script to romanized text.
        /// It's particularly useful for converting Bangla text into a Latin alphabet representation.
        ///
        /// Example:
        /// ```swift
        /// try transliterate("আমার সোনার বাংলা", mode: .orva) // → "amar sOnar bangla"
        /// try transliterate("জীবন", mode: .orva) // → "jIbon"
        /// ```
        case orva
        
        /// Informal phonetic system matching common texting patterns
        ///
        /// Banglish is an informal phonetic typing system that matches common patterns
        /// used in digital communications when writing Bangla words with English characters.
        ///
        /// Example:
        /// ```swift
        /// try transliterate("amar shonar bangla", mode: .banglish) // → "আমার সোনার বাংলা"
        /// try transliterate("jibon", mode: .banglish) // → "জীবন"
        /// ```
        case banglish
        
        /// English-speaker friendly system with systematic mappings
        ///
        /// Lishbang is designed to be intuitive for English speakers while maintaining
        /// accurate Bangla pronunciation rules. It uses systematic Latin character mappings
        /// that closely match Bangla phonetics.
        ///
        /// Example:
        /// ```swift
        /// try transliterate("ইট ইজ নট গুড।", mode: .lishbang) // → "It is not good."
        /// try transliterate("মাই নেইম ইজ আপন।", mode: .lishbang) // → "My name is Apon."
        /// ```
        case lishbang
    }

    /// Node structure for the pattern matching trie
    /// 
    /// Used internally to efficiently store and match transliteration patterns
    class TrieNode {
        /// Child nodes mapped by their characters
        var children: [Character: TrieNode] = [:]
        /// The pattern associated with this node, if it represents the end of a pattern
        var pattern: Pattern?
        /// Whether this node represents the end of a valid pattern
        var isEndOfPattern: Bool = false
    }

    /// The loaded grammar rules for transliteration
    let rules: Grammar
    /// The patterns extracted from the grammar rules
    let patterns: [Pattern]
    /// The root node of the pattern matching trie
    let trie: TrieNode
    
    /// Initializes the transliteration engine by loading grammar rules from a JSON file
    /// 
    /// The initializer loads and parses the grammar rules from a bundled JSON file.
    /// These rules define the transliteration patterns and their replacements.
    ///
    /// - Throws: ``TransliterationError/grammarLoadingError(_:)`` if the rules file cannot be loaded or parsed
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

    /// Builds a trie data structure from the given patterns for efficient pattern matching
    /// 
    /// The trie structure allows for fast prefix-based pattern matching during transliteration.
    /// Patterns are sorted by length in descending order to ensure longer patterns are matched first.
    ///
    /// - Parameter patterns: Array of patterns to build the trie from
    /// - Returns: Root node of the constructed trie
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

    /// Transliterates the given text using the specified mode
    /// 
    /// This is the main entry point for transliteration. It converts text between Bangla and Latin scripts
    /// based on the specified mode.
    ///
    /// - Parameters:
    ///   - text: The input text to transliterate
    ///   - mode: The transliteration mode to use
    /// - Returns: The transliterated text
    /// - Throws: ``TransliterationError/notImplemented(_:)`` if the selected mode is not yet implemented
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

    /// Performs Avro Phonetic transliteration on the given text
    /// 
    /// Converts Latin script text to Bangla script using the Avro Phonetic rules.
    /// This is currently the most complete and well-tested transliteration mode.
    ///
    /// - Parameter text: The input text to transliterate
    /// - Returns: The transliterated text in Bangla script
    /// - Throws: TransliterationError if there's an error during transliteration
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

    /// Processes a pattern match according to its rules
    /// 
    /// Applies the appropriate replacement rules for a matched pattern, taking into account
    /// the surrounding context (prefixes and suffixes) as defined in the rules.
    ///
    /// - Parameters:
    ///   - pattern: The pattern to process
    ///   - chars: Array of characters from the input text
    ///   - startIndex: Starting index of the pattern match
    ///   - endIndex: Ending index of the pattern match
    /// - Returns: A tuple containing the output text and the new index position
    /// - Throws: TransliterationError if there's an error processing the pattern
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

    /// Fixes the input string by handling case sensitivity according to rules
    /// 
    /// Processes the input string to ensure proper case handling based on the grammar rules.
    /// Characters marked as case-sensitive in the rules retain their case, while others are converted to lowercase.
    ///
    /// - Parameter input: The input string to fix
    /// - Returns: The fixed string with appropriate case handling
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

    /// Checks if a character is a vowel according to the loaded grammar rules
    /// 
    /// - Parameter c: The character to check
    /// - Returns: true if the character is a vowel, false otherwise
    private func isVowel(_ c: Character) -> Bool {
        return self.rules.vowel.contains(Character(String(c).lowercased()))
    }

    /// Checks if a character is a consonant according to the loaded grammar rules
    /// 
    /// - Parameter c: The character to check
    /// - Returns: true if the character is a consonant, false otherwise
    private func isConsonant(_ c: Character) -> Bool {
        return self.rules.consonant.contains(Character(String(c).lowercased()))
    }

    /// Checks if a character is a punctuation mark
    /// 
    /// A character is considered punctuation if it's neither a vowel nor a consonant
    /// according to the loaded grammar rules.
    ///
    /// - Parameter c: The character to check
    /// - Returns: true if the character is neither a vowel nor a consonant
    private func isPunctuation(_ c: Character) -> Bool {
        let lowercased = Character(String(c).lowercased())
        return !self.rules.vowel.contains(lowercased) && !self.rules.consonant.contains(lowercased)
    }

    /// Checks if a character should be treated as case-sensitive
    /// 
    /// - Parameter c: The character to check
    /// - Returns: true if the character should be treated as case-sensitive according to the grammar rules
    private func isCaseSensitive(_ c: Character) -> Bool {
        return self.rules.casesensitive.contains(Character(String(c).lowercased()))
    }
}