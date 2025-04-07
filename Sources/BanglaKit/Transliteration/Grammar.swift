import Foundation

struct GrammarFile: Decodable {
    let vowel: String
    let consonant: String
    let casesensitive: String
    let patterns: [JsonPattern]

    struct JsonPattern: Decodable {
        let find: String
        let replace: String
        let rules: [JsonRule]?

        struct JsonRule: Decodable {
            let matches: [JsonRuleMatch]
            let replace: String
        }

        struct JsonRuleMatch: Decodable {
            let type: String
            let scope: String?
            let value: String?
        }
    }
}

struct RuleMatch {
    enum MatchType: String {
        case suffix, prefix
    }

    enum Scope: String {
        case vowel, consonant, exact, punctuation

        static func fromString(_ str: String) -> Scope? {
            let isNegative = str.hasPrefix("!")
            let scopeStr = isNegative ? String(str.dropFirst()) : str
            return Scope(rawValue: scopeStr)
        }

        static func isNegative(_ str: String) -> Bool {
            return str.hasPrefix("!")
        }
    }

    let type: MatchType
    let scope: Scope?
    let negative: Bool
    let value: String?

    static func fromJson(_ jsonRuleMatch: GrammarFile.JsonPattern.JsonRuleMatch) -> RuleMatch? {
        guard let type = MatchType(rawValue: jsonRuleMatch.type) else {
            print("Error: Invalid Rule Match Type: \(jsonRuleMatch.type)")
            return nil
        }
        let scope = jsonRuleMatch.scope.flatMap(Scope.fromString)
        let negative = jsonRuleMatch.scope.map(Scope.isNegative) ?? false
        return RuleMatch(type: type, scope: scope, negative: negative, value: jsonRuleMatch.value)
    }
}

struct Grammar {
    struct Rule {
        let matches: [RuleMatch]
        let replace: String

        static func fromJson(_ pattern: GrammarFile.JsonPattern) -> [Rule]? {
            guard let jsonRules = pattern.rules, !jsonRules.isEmpty else {
                return nil
            }

            return jsonRules.compactMap { jsonRule in
                let matches = jsonRule.matches.compactMap(RuleMatch.fromJson)
                return Rule(matches: matches, replace: jsonRule.replace)
            }
        }
    }

    let vowel: Set<Character>
    let consonant: Set<Character>
    let casesensitive: Set<Character>
    let patterns: [Pattern]

    static func fromJson(_ jsonGrammar: GrammarFile) -> Grammar? {
        let patterns = jsonGrammar.patterns.compactMap { jsonPattern in
            Pattern(
                find: jsonPattern.find,
                replace: jsonPattern.replace,
                rules: Rule.fromJson(jsonPattern)
            )
        }

        return Grammar(
            vowel: Set(jsonGrammar.vowel),
            consonant: Set(jsonGrammar.consonant),
            casesensitive: Set(jsonGrammar.casesensitive),
            patterns: patterns
        )
    }
}

struct Pattern {
    let find: String
    let replace: String
    let rules: [Grammar.Rule]?
}