import Foundation

public class Transliteration {
    struct RuleMatch {
        let type: String
        let scope: String?
        let value: String?
    }

    struct Rule {
        let matches: [RuleMatch]
        let replace: String
    }

    struct Pattern {
        let find: String
        let replace: String
        let rules: [Rule]?
    }

    static let patterns: [Pattern] = [
        Pattern(find: "bhl", replace: "ভ্ল", rules: nil),
        Pattern(find: "psh", replace: "পশ", rules: nil),
        Pattern(find: "bdh", replace: "ব্ধ", rules: nil),
        Pattern(find: "bj", replace: "ব্জ", rules: nil),
        Pattern(find: "bd", replace: "ব্দ", rules: nil),
        Pattern(find: "bb", replace: "ব্ব", rules: nil),
        Pattern(find: "bl", replace: "ব্ল", rules: nil),
        Pattern(find: "bh", replace: "ভ", rules: nil),
        Pattern(find: "vl", replace: "ভ্ল", rules: nil),
        Pattern(find: "b", replace: "ব", rules: nil),
        Pattern(find: "v", replace: "ভ", rules: nil),
        Pattern(find: "cNG", replace: "চ্ঞ", rules: nil),
        Pattern(find: "cch", replace: "চ্ছ", rules: nil),
        Pattern(find: "cc", replace: "চ্চ", rules: nil),
        Pattern(find: "ch", replace: "ছ", rules: nil),
        Pattern(find: "c", replace: "চ", rules: nil),
        Pattern(find: "dhn", replace: "ধ্ন", rules: nil),
        Pattern(find: "dhm", replace: "ধ্ম", rules: nil),
        Pattern(find: "dgh", replace: "দ্ঘ", rules: nil),
        Pattern(find: "ddh", replace: "দ্ধ", rules: nil),
        Pattern(find: "dbh", replace: "দ্ভ", rules: nil),
        Pattern(find: "dv", replace: "দ্ভ", rules: nil),
        Pattern(find: "dm", replace: "দ্ম", rules: nil),
        Pattern(find: "DD", replace: "ড্ড", rules: nil),
        Pattern(find: "Dh", replace: "ঢ", rules: nil),
        Pattern(find: "dh", replace: "ধ", rules: nil),
        Pattern(find: "dg", replace: "দ্গ", rules: nil),
        Pattern(find: "dd", replace: "দ্দ", rules: nil),
        Pattern(find: "D", replace: "ড", rules: nil),
        Pattern(find: "d", replace: "দ", rules: nil),
        Pattern(find: "...", replace: "...", rules: nil),
        Pattern(find: ".`", replace: ".", rules: nil),
        Pattern(find: "..", replace: "।।", rules: nil),
        Pattern(find: ".", replace: "।", rules: nil),
        Pattern(find: "ghn", replace: "ঘ্ন", rules: nil),
        Pattern(find: "Ghn", replace: "ঘ্ন", rules: nil),
        Pattern(find: "gdh", replace: "গ্ধ", rules: nil),
        Pattern(find: "Gdh", replace: "গ্ধ", rules: nil),
        Pattern(find: "gN", replace: "গ্ণ", rules: nil),
        Pattern(find: "GN", replace: "গ্ণ", rules: nil),
        Pattern(find: "gn", replace: "গ্ন", rules: nil),
        Pattern(find: "Gn", replace: "গ্ন", rules: nil),
        Pattern(find: "gm", replace: "গ্ম", rules: nil),
        Pattern(find: "Gm", replace: "গ্ম", rules: nil),
        Pattern(find: "gl", replace: "গ্ল", rules: nil),
        Pattern(find: "Gl", replace: "গ্ল", rules: nil),
        Pattern(find: "gg", replace: "জ্ঞ", rules: nil),
        Pattern(find: "GG", replace: "জ্ঞ", rules: nil),
        Pattern(find: "Gg", replace: "জ্ঞ", rules: nil),
        Pattern(find: "gG", replace: "জ্ঞ", rules: nil),
        Pattern(find: "gh", replace: "ঘ", rules: nil),
        Pattern(find: "Gh", replace: "ঘ", rules: nil),
        Pattern(find: "g", replace: "গ", rules: nil),
        Pattern(find: "G", replace: "গ", rules: nil),
        Pattern(find: "hN", replace: "হ্ণ", rules: nil),
        Pattern(find: "hn", replace: "হ্ন", rules: nil),
        Pattern(find: "hm", replace: "হ্ম", rules: nil),
        Pattern(find: "hl", replace: "হ্ল", rules: nil),
        Pattern(find: "h", replace: "হ", rules: nil),
        Pattern(find: "jjh", replace: "জ্ঝ", rules: nil),
        Pattern(find: "jNG", replace: "জ্ঞ", rules: nil),
        Pattern(find: "jh", replace: "ঝ", rules: nil),
        Pattern(find: "jj", replace: "জ্জ", rules: nil),
        Pattern(find: "j", replace: "জ", rules: nil),
        Pattern(find: "J", replace: "জ", rules: nil),
        Pattern(find: "kkhN", replace: "ক্ষ্ণ", rules: nil),
        Pattern(find: "kShN", replace: "ক্ষ্ণ", rules: nil),
        Pattern(find: "kkhm", replace: "ক্ষ্ম", rules: nil),
        Pattern(find: "kShm", replace: "ক্ষ্ম", rules: nil),
        Pattern(find: "kxN", replace: "ক্ষ্ণ", rules: nil),
        Pattern(find: "kxm", replace: "ক্ষ্ম", rules: nil),
        Pattern(find: "kkh", replace: "ক্ষ", rules: nil),
        Pattern(find: "kSh", replace: "ক্ষ", rules: nil),
        Pattern(find: "ksh", replace: "কশ", rules: nil),
        Pattern(find: "kx", replace: "ক্ষ", rules: nil),
        Pattern(find: "kk", replace: "ক্ক", rules: nil),
        Pattern(find: "kT", replace: "ক্ট", rules: nil),
        Pattern(find: "kt", replace: "ক্ত", rules: nil),
        Pattern(find: "kl", replace: "ক্ল", rules: nil),
        Pattern(find: "ks", replace: "ক্স", rules: nil),
        Pattern(find: "kh", replace: "খ", rules: nil),
        Pattern(find: "k", replace: "ক", rules: nil),
        Pattern(find: "lbh", replace: "ল্ভ", rules: nil),
        Pattern(find: "ldh", replace: "ল্ধ", rules: nil),
        Pattern(find: "lkh", replace: "লখ", rules: nil),
        Pattern(find: "lgh", replace: "লঘ", rules: nil),
        Pattern(find: "lph", replace: "লফ", rules: nil),
        Pattern(find: "lk", replace: "ল্ক", rules: nil),
        Pattern(find: "lg", replace: "ল্গ", rules: nil),
        Pattern(find: "lT", replace: "ল্ট", rules: nil),
        Pattern(find: "lD", replace: "ল্ড", rules: nil),
        Pattern(find: "lp", replace: "ল্প", rules: nil),
        Pattern(find: "lv", replace: "ল্ভ", rules: nil),
        Pattern(find: "lm", replace: "ল্ম", rules: nil),
        Pattern(find: "ll", replace: "ল্ল", rules: nil),
        Pattern(find: "lb", replace: "ল্ব", rules: nil),
        Pattern(find: "l", replace: "ল", rules: nil),
        Pattern(find: "mth", replace: "ম্থ", rules: nil),
        Pattern(find: "mph", replace: "ম্ফ", rules: nil),
        Pattern(find: "mbh", replace: "ম্ভ", rules: nil),
        Pattern(find: "mpl", replace: "মপ্ল", rules: nil),
        Pattern(find: "mn", replace: "ম্ন", rules: nil),
        Pattern(find: "mp", replace: "ম্প", rules: nil),
        Pattern(find: "mv", replace: "ম্ভ", rules: nil),
        Pattern(find: "mm", replace: "ম্ম", rules: nil),
        Pattern(find: "ml", replace: "ম্ল", rules: nil),
        Pattern(find: "mb", replace: "ম্ব", rules: nil),
        Pattern(find: "mf", replace: "ম্ফ", rules: nil),
        Pattern(find: "m", replace: "ম", rules: nil),
        Pattern(find: "0", replace: "০", rules: nil),
        Pattern(find: "1", replace: "১", rules: nil),
        Pattern(find: "2", replace: "২", rules: nil),
        Pattern(find: "3", replace: "৩", rules: nil),
        Pattern(find: "4", replace: "৪", rules: nil),
        Pattern(find: "5", replace: "৫", rules: nil),
        Pattern(find: "6", replace: "৬", rules: nil),
        Pattern(find: "7", replace: "৭", rules: nil),
        Pattern(find: "8", replace: "৮", rules: nil),
        Pattern(find: "9", replace: "৯", rules: nil),
        Pattern(find: "NgkSh", replace: "ঙ্ক্ষ", rules: nil),
        Pattern(find: "Ngkkh", replace: "ঙ্ক্ষ", rules: nil),
        Pattern(find: "NGch", replace: "ঞ্ছ", rules: nil),
        Pattern(find: "Nggh", replace: "ঙ্ঘ", rules: nil),
        Pattern(find: "Ngkh", replace: "ঙ্খ", rules: nil),
        Pattern(find: "NGjh", replace: "ঞ্ঝ", rules: nil),
        Pattern(find: "ngOU", replace: "ঙ্গৌ", rules: nil),
        Pattern(find: "ngOI", replace: "ঙ্গৈ", rules: nil),
        Pattern(find: "Ngkx", replace: "ঙ্ক্ষ", rules: nil),
        Pattern(find: "NGc", replace: "ঞ্চ", rules: nil),
        Pattern(find: "nch", replace: "ঞ্ছ", rules: nil),
        Pattern(find: "njh", replace: "ঞ্ঝ", rules: nil),
        Pattern(find: "ngh", replace: "ঙ্ঘ", rules: nil),
        Pattern(find: "Ngk", replace: "ঙ্ক", rules: nil),
        Pattern(find: "Ngx", replace: "ঙ্ষ", rules: nil),
        Pattern(find: "Ngg", replace: "ঙ্গ", rules: nil),
        Pattern(find: "Ngm", replace: "ঙ্ম", rules: nil),
        Pattern(find: "NGj", replace: "ঞ্জ", rules: nil),
        Pattern(find: "ndh", replace: "ন্ধ", rules: nil),
        Pattern(find: "nTh", replace: "ন্ঠ", rules: nil),
        Pattern(find: "NTh", replace: "ণ্ঠ", rules: nil),
        Pattern(find: "nth", replace: "ন্থ", rules: nil),
        Pattern(find: "nkh", replace: "ঙ্খ", rules: nil),
        Pattern(find: "ngo", replace: "ঙ্গ", rules: nil),
        Pattern(find: "nga", replace: "ঙ্গা", rules: nil),
        Pattern(find: "ngi", replace: "ঙ্গি", rules: nil),
        Pattern(find: "ngI", replace: "ঙ্গী", rules: nil),
        Pattern(find: "ngu", replace: "ঙ্গু", rules: nil),
        Pattern(find: "ngU", replace: "ঙ্গূ", rules: nil),
        Pattern(find: "nge", replace: "ঙ্গে", rules: nil),
        Pattern(find: "ngO", replace: "ঙ্গো", rules: nil),
        Pattern(find: "NDh", replace: "ণ্ঢ", rules: nil),
        Pattern(find: "nsh", replace: "নশ", rules: nil),
        Pattern(find: "Ngr", replace: "ঙর", rules: nil),
        Pattern(find: "NGr", replace: "ঞর", rules: nil),
        Pattern(find: "ngr", replace: "ংর", rules: nil),
        Pattern(find: "nj", replace: "ঞ্জ", rules: nil),
        Pattern(find: "Ng", replace: "ঙ", rules: nil),
        Pattern(find: "NG", replace: "ঞ", rules: nil),
        Pattern(find: "nk", replace: "ঙ্ক", rules: nil),
        Pattern(find: "ng", replace: "ং", rules: nil),
        Pattern(find: "nn", replace: "ন্ন", rules: nil),
        Pattern(find: "NN", replace: "ণ্ণ", rules: nil),
        Pattern(find: "Nn", replace: "ণ্ন", rules: nil),
        Pattern(find: "nm", replace: "ন্ম", rules: nil),
        Pattern(find: "Nm", replace: "ণ্ম", rules: nil),
        Pattern(find: "nd", replace: "ন্দ", rules: nil),
        Pattern(find: "nT", replace: "ন্ট", rules: nil),
        Pattern(find: "NT", replace: "ণ্ট", rules: nil),
        Pattern(find: "nD", replace: "ন্ড", rules: nil),
        Pattern(find: "ND", replace: "ণ্ড", rules: nil),
        Pattern(find: "nt", replace: "ন্ত", rules: nil),
        Pattern(find: "ns", replace: "ন্স", rules: nil),
        Pattern(find: "nc", replace: "ঞ্চ", rules: nil),
        Pattern(find: "n", replace: "ন", rules: nil),
        Pattern(find: "N", replace: "ণ", rules: nil),
        Pattern(find: "OI`", replace: "ৈ", rules: nil),
        Pattern(find: "OU`", replace: "ৌ", rules: nil),
        Pattern(find: "O`", replace: "ো", rules: nil),
        Pattern(find: "OI", replace: "ৈ", rules: [
            Rule(matches: [RuleMatch(type: "prefix", scope: "!consonant", value: nil)], replace: "ঐ"),
            Rule(matches: [RuleMatch(type: "prefix", scope: "punctuation", value: nil)], replace: "ঐ")
        ]),
        Pattern(find: "OU", replace: "ৌ", rules: [
            Rule(matches: [RuleMatch(type: "prefix", scope: "!consonant", value: nil)], replace: "ঔ"),
            Rule(matches: [RuleMatch(type: "prefix", scope: "punctuation", value: nil)], replace: "ঔ")
        ]),
        Pattern(find: "O", replace: "ো", rules: [
            Rule(matches: [RuleMatch(type: "prefix", scope: "!consonant", value: nil)], replace: "ও"),
            Rule(matches: [RuleMatch(type: "prefix", scope: "punctuation", value: nil)], replace: "ও")
        ]),
        Pattern(find: "phl", replace: "ফ্ল", rules: nil),
        Pattern(find: "pT", replace: "প্ট", rules: nil),
        Pattern(find: "pt", replace: "প্ত", rules: nil),
        Pattern(find: "pn", replace: "প্ন", rules: nil),
        Pattern(find: "pp", replace: "প্প", rules: nil),
        Pattern(find: "pl", replace: "প্ল", rules: nil),
        Pattern(find: "ps", replace: "প্স", rules: nil),
        Pattern(find: "ph", replace: "ফ", rules: nil),
        Pattern(find: "fl", replace: "ফ্ল", rules: nil),
        Pattern(find: "f", replace: "ফ", rules: nil),
        Pattern(find: "p", replace: "প", rules: nil),
        Pattern(find: "rri`", replace: "ৃ", rules: nil),
        Pattern(find: "rri", replace: "ৃ", rules: [
            Rule(matches: [RuleMatch(type: "prefix", scope: "!consonant", value: nil)], replace: "ঋ"),
            Rule(matches: [RuleMatch(type: "prefix", scope: "punctuation", value: nil)], replace: "ঋ")
        ]),
        Pattern(find: "rrZ", replace: "রর‍্য", rules: nil),
        Pattern(find: "rry", replace: "রর‍্য", rules: nil),
        Pattern(find: "rZ", replace: "র‍্য", rules: [
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "consonant", value: nil),
                RuleMatch(type: "prefix", scope: "!exact", value: "r"),
                RuleMatch(type: "prefix", scope: "!exact", value: "y"),
                RuleMatch(type: "prefix", scope: "!exact", value: "w"),
                RuleMatch(type: "prefix", scope: "!exact", value: "x")
            ], replace: "্র্য")
        ]),
        Pattern(find: "ry", replace: "র‍্য", rules: [
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "consonant", value: nil),
                RuleMatch(type: "prefix", scope: "!exact", value: "r"),
                RuleMatch(type: "prefix", scope: "!exact", value: "y"),
                RuleMatch(type: "prefix", scope: "!exact", value: "w"),
                RuleMatch(type: "prefix", scope: "!exact", value: "x")
            ], replace: "্র্য")
        ]),
        Pattern(find: "rr", replace: "রর", rules: [
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "!consonant", value: nil),
                RuleMatch(type: "suffix", scope: "!vowel", value: nil),
                RuleMatch(type: "suffix", scope: "!exact", value: "r"),
                RuleMatch(type: "suffix", scope: "!punctuation", value: nil)
            ], replace: "র্"),
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "consonant", value: nil),
                RuleMatch(type: "prefix", scope: "!exact", value: "r")
            ], replace: "্রর")
        ]),
        Pattern(find: "Rg", replace: "ড়্গ", rules: nil),
        Pattern(find: "Rh", replace: "ঢ়", rules: nil),
        Pattern(find: "R", replace: "ড়", rules: nil),
        Pattern(find: "r", replace: "র", rules: [
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "consonant", value: nil),
                RuleMatch(type: "prefix", scope: "!exact", value: "r"),
                RuleMatch(type: "prefix", scope: "!exact", value: "y"),
                RuleMatch(type: "prefix", scope: "!exact", value: "w"),
                RuleMatch(type: "prefix", scope: "!exact", value: "x"),
                RuleMatch(type: "prefix", scope: "!exact", value: "Z")
            ], replace: "্র")
        ]),
        Pattern(find: "shch", replace: "শ্ছ", rules: nil),
        Pattern(find: "ShTh", replace: "ষ্ঠ", rules: nil),
        Pattern(find: "Shph", replace: "ষ্ফ", rules: nil),
        Pattern(find: "Sch", replace: "শ্ছ", rules: nil),
        Pattern(find: "skl", replace: "স্ক্ল", rules: nil),
        Pattern(find: "skh", replace: "স্খ", rules: nil),
        Pattern(find: "sth", replace: "স্থ", rules: nil),
        Pattern(find: "sph", replace: "স্ফ", rules: nil),
        Pattern(find: "shc", replace: "শ্চ", rules: nil),
        Pattern(find: "sht", replace: "শ্ত", rules: nil),
        Pattern(find: "shn", replace: "শ্ন", rules: nil),
        Pattern(find: "shm", replace: "শ্ম", rules: nil),
        Pattern(find: "shl", replace: "শ্ল", rules: nil),
        Pattern(find: "Shk", replace: "ষ্ক", rules: nil),
        Pattern(find: "ShT", replace: "ষ্ট", rules: nil),
        Pattern(find: "ShN", replace: "ষ্ণ", rules: nil),
        Pattern(find: "Shp", replace: "ষ্প", rules: nil),
        Pattern(find: "Shf", replace: "ষ্ফ", rules: nil),
        Pattern(find: "Shm", replace: "ষ্ম", rules: nil),
        Pattern(find: "spl", replace: "স্প্ল", rules: nil),
        Pattern(find: "sk", replace: "স্ক", rules: nil),
        Pattern(find: "Sc", replace: "শ্চ", rules: nil),
        Pattern(find: "sT", replace: "স্ট", rules: nil),
        Pattern(find: "st", replace: "স্ত", rules: nil),
        Pattern(find: "sn", replace: "স্ন", rules: nil),
        Pattern(find: "sp", replace: "স্প", rules: nil),
        Pattern(find: "sf", replace: "স্ফ", rules: nil),
        Pattern(find: "sm", replace: "স্ম", rules: nil),
        Pattern(find: "sl", replace: "স্ল", rules: nil),
        Pattern(find: "sh", replace: "শ", rules: nil),
        Pattern(find: "Sc", replace: "শ্চ", rules: nil),
        Pattern(find: "St", replace: "শ্ত", rules: nil),
        Pattern(find: "Sn", replace: "শ্ন", rules: nil),
        Pattern(find: "Sm", replace: "শ্ম", rules: nil),
        Pattern(find: "Sl", replace: "শ্ল", rules: nil),
        Pattern(find: "Sh", replace: "ষ", rules: nil),
        Pattern(find: "s", replace: "স", rules: nil),
        Pattern(find: "S", replace: "শ", rules: nil),
        Pattern(find: "oo`", replace: "ু", rules: nil),
        Pattern(find: "oo", replace: "ু", rules: [
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "!consonant", value: nil),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "উ"),
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "punctuation", value: nil),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "উ")
        ]),
        Pattern(find: "o`", replace: "", rules: nil),
        Pattern(find: "oZ", replace: "অ্য", rules: nil),
        Pattern(find: "o", replace: "", rules: [
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "vowel", value: nil),
                RuleMatch(type: "prefix", scope: "!exact", value: "o")
            ], replace: "ও"),
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "vowel", value: nil),
                RuleMatch(type: "prefix", scope: "exact", value: "o")
            ], replace: "অ"),
            Rule(matches: [RuleMatch(type: "prefix", scope: "punctuation", value: nil)], replace: "অ")
        ]),
        Pattern(find: "tth", replace: "ত্থ", rules: nil),
        Pattern(find: "t``", replace: "ৎ", rules: nil),
        Pattern(find: "TT", replace: "ট্ট", rules: nil),
        Pattern(find: "Tm", replace: "ট্ম", rules: nil),
        Pattern(find: "Th", replace: "ঠ", rules: nil),
        Pattern(find: "tn", replace: "ত্ন", rules: nil),
        Pattern(find: "tm", replace: "ত্ম", rules: nil),
        Pattern(find: "th", replace: "থ", rules: nil),
        Pattern(find: "tt", replace: "ত্ত", rules: nil),
        Pattern(find: "T", replace: "ট", rules: nil),
        Pattern(find: "t", replace: "ত", rules: nil),
        Pattern(find: "aZ", replace: "অ্যা", rules: nil),
        Pattern(find: "AZ", replace: "অ্যা", rules: nil),
        Pattern(find: "a`", replace: "া", rules: nil),
        Pattern(find: "A`", replace: "া", rules: nil),
        Pattern(find: "a", replace: "া", rules: [
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "punctuation", value: nil),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "আ"),
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "!consonant", value: nil),
                RuleMatch(type: "prefix", scope: "!exact", value: "a"),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "য়া"),
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "exact", value: "a"),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "আ")
        ]),
        Pattern(find: "i`", replace: "ি", rules: nil),
        Pattern(find: "i", replace: "ি", rules: [
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "!consonant", value: nil),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "ই"),
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "punctuation", value: nil),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "ই")
        ]),
        Pattern(find: "I`", replace: "ী", rules: nil),
        Pattern(find: "I", replace: "ী", rules: [
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "!consonant", value: nil),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "ঈ"),
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "punctuation", value: nil),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "ঈ")
        ]),
        Pattern(find: "u`", replace: "ু", rules: nil),
        Pattern(find: "u", replace: "ু", rules: [
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "!consonant", value: nil),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "উ"),
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "punctuation", value: nil),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "উ")
        ]),
        Pattern(find: "U`", replace: "ূ", rules: nil),
        Pattern(find: "U", replace: "ূ", rules: [
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "!consonant", value: nil),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "ঊ"),
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "punctuation", value: nil),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "ঊ")
        ]),
        Pattern(find: "ee`", replace: "ী", rules: nil),
        Pattern(find: "ee", replace: "ী", rules: [
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "!consonant", value: nil),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "ঈ"),
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "punctuation", value: nil),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "ঈ")
        ]),
        Pattern(find: "e`", replace: "ে", rules: nil),
        Pattern(find: "e", replace: "ে", rules: [
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "!consonant", value: nil),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "এ"),
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "punctuation", value: nil),
                RuleMatch(type: "suffix", scope: "!exact", value: "`")
            ], replace: "এ")
        ]),
        Pattern(find: "z", replace: "য", rules: nil),
        Pattern(find: "Z", replace: "্য", rules: nil),
        Pattern(find: "y", replace: "্য", rules: [
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "!consonant", value: nil),
                RuleMatch(type: "prefix", scope: "!punctuation", value: nil)
            ], replace: "য়"),
            Rule(matches: [RuleMatch(type: "prefix", scope: "punctuation", value: nil)], replace: "ইয়")
        ]),
        Pattern(find: "Y", replace: "য়", rules: nil),
        Pattern(find: "q", replace: "ক", rules: nil),
        Pattern(find: "w", replace: "ও", rules: [
            Rule(matches: [
                RuleMatch(type: "prefix", scope: "punctuation", value: nil),
                RuleMatch(type: "suffix", scope: "vowel", value: nil)
            ], replace: "ওয়"),
            Rule(matches: [RuleMatch(type: "prefix", scope: "consonant", value: nil)], replace: "্ব")
        ]),
        Pattern(find: "x", replace: "ক্স", rules: [Rule(matches: [RuleMatch(type: "prefix", scope: "punctuation", value: nil)], replace: "এক্স")]),
        Pattern(find: ":`", replace: ":", rules: nil),
        Pattern(find: ":", replace: "ঃ", rules: nil),
        Pattern(find: "^`", replace: "^", rules: nil),
        Pattern(find: "^", replace: "ঁ", rules: nil),
        Pattern(find: ",,", replace: "্‌", rules: nil),
        Pattern(find: ",", replace: ",", rules: nil),
        Pattern(find: "$", replace: "৳", rules: nil),
        Pattern(find: "`", replace: "", rules: nil)
    ]
    
    static let vowel = "aeiou"
    static let consonant = "bcdfghjklmnpqrstvwxyz"
    static let casesensitive = "oiudgjnrstyz"
    
    static func fixString(input: String) -> String {
        var fixed = ""
        for char in input {
            if isCaseSensitive(c: char) {
                fixed.append(char)
            } else {
                fixed.append(char.lowercased())
            }
        }
        return fixed
    }
    
    static func isVowel(c: Character) -> Bool {
        return vowel.contains(c.lowercased())
    }
    
    static func isConsonant(c: Character) -> Bool {
        return consonant.contains(c.lowercased())
    }
    
    static func isPunctuation(c: Character) -> Bool {
        return !isVowel(c: c) && !isConsonant(c: c)
    }
    
    static func isExact(needle: String, heystack: String, start: Int, end: Int, not: Bool) -> Bool {
        let substring = heystack[String.Index(utf16Offset: start, in: heystack)..<String.Index(utf16Offset: end, in: heystack)]
        return (start >= 0 && end <= heystack.count && substring == needle) != not
    }
    
    static func isCaseSensitive(c: Character) -> Bool {
        return casesensitive.contains(c.lowercased())
    }
    
    public static func transliterate(text: String, mode: String = "avro") -> String {
        switch mode {
        case "avro":
            return avro(text: text)
        case "orva":
            return orva(text: text)
        case "banglish":
            return banglish(text: text)
        case "lishbang":
            return lishbang(text: text)
        default:
            fatalError("Invalid mode. Available modes are: 'avro', 'orva', 'banglish', 'lishbang'")
        }
    }
    
    // Trie node for faster pattern matching
    @usableFromInline
    internal final class TrieNode: @unchecked Sendable {
        let children: [Character: TrieNode]
        let pattern: Pattern?
        let isEndOfPattern: Bool
        
        init(children: [Character: TrieNode] = [:], pattern: Pattern? = nil, isEndOfPattern: Bool = false) {
            self.children = children
            self.pattern = pattern
            self.isEndOfPattern = isEndOfPattern
        }
    }

    // Build trie from patterns - called once
    private static let patternTrie: TrieNode = {
        func buildNode(patterns: [(pattern: Pattern, index: Int)], depth: Int) -> TrieNode {
            var children: [Character: [(pattern: Pattern, index: Int)]] = [:]
            var nodePattern: Pattern? = nil
            var isEnd = false
            
            for (pattern, index) in patterns {
                if index >= pattern.find.count {
                    nodePattern = pattern
                    isEnd = true
                    continue
                }
                
                let char = Array(pattern.find)[index]
                children[char, default: []].append((pattern, index + 1))
            }
            
            let builtChildren = children.mapValues { childPatterns in
                buildNode(patterns: childPatterns, depth: depth + 1)
            }
            
            return TrieNode(
                children: builtChildren,
                pattern: nodePattern,
                isEndOfPattern: isEnd
            )
        }
        
        return buildNode(
            patterns: patterns.map { ($0, 0) },
            depth: 0
        )
    }()

    static func avro(text: String) -> String {
        let fixed = fixString(input: text)
        
        // Pre-allocate capacity for better performance
        var output = String()
        output.reserveCapacity(fixed.count * 2)
        
        // Convert to array for faster random access
        let chars = Array(fixed)
        let len = chars.count
        
        // Cache for faster lookups
        var cache = [String: (String, Int)]()
        cache.reserveCapacity(len / 4)
        
        var currentIndex = 0
        
        while currentIndex < len {
            // Try to find match in trie
            var node = patternTrie
            var matchLength = 0
            var matchPattern: Pattern?
            var i = currentIndex
            
            // Look ahead for matches
            while i < len {
                let char = chars[i]
                if let nextNode = node.children[char] {
                    if nextNode.isEndOfPattern {
                        matchLength = i - currentIndex + 1
                        matchPattern = nextNode.pattern
                    }
                    node = nextNode
                    i += 1
                } else {
                    break
                }
            }
            
            if let pattern = matchPattern {
                // Process the matched pattern
                let endIndex = currentIndex + matchLength
                let result = processPattern(
                    pattern: pattern,
                    chars: chars,
                    startIndex: currentIndex,
                    endIndex: endIndex
                )
                
                output.append(result.output)
                currentIndex = result.newIndex + 1
            } else {
                // No match found, append current character
                output.append(chars[currentIndex])
                currentIndex += 1
            }
        }
        
        return output
    }
    
    static func processPattern(
        pattern: Pattern,
        chars: [Character],
        startIndex: Int,
        endIndex: Int
    ) -> (output: String, newIndex: Int) {
        if pattern.rules == nil {
            return (pattern.replace, endIndex - 1)
        }
        
        let previousIndex = startIndex - 1
        for rule in pattern.rules! {
            var shouldReplace = true
            
            for match in rule.matches {
                let checkIndex = match.type == "suffix" ? endIndex : previousIndex
                let isNegative = match.scope?.first == "!"
                let scope = isNegative ? String(match.scope!.dropFirst()) : match.scope
                
                let isValid: Bool = {
                    switch scope {
                    case "punctuation":
                        if checkIndex < 0 || checkIndex >= chars.count {
                            return true
                        }
                        return isPunctuation(c: chars[checkIndex])
                        
                    case "vowel":
                        if checkIndex < 0 || checkIndex >= chars.count {
                            return false
                        }
                        return isVowel(c: chars[checkIndex])
                        
                    case "consonant":
                        if checkIndex < 0 || checkIndex >= chars.count {
                            return false
                        }
                        return isConsonant(c: chars[checkIndex])
                        
                    case "exact":
                        if let value = match.value {
                            let s = match.type == "suffix" ? endIndex : startIndex - value.count
                            let e = match.type == "suffix" ? endIndex + value.count : startIndex
                            
                            if s < 0 || e > chars.count {
                                return false
                            }
                            
                            let valueChars = Array(value)
                            for (i, c) in valueChars.enumerated() {
                                if chars[s + i] != c {
                                    return false
                                }
                            }
                            return true
                        }
                        return false
                        
                    default:
                        return false
                    }
                }()
                
                if isValid == isNegative {
                    shouldReplace = false
                    break
                }
            }
            
            if shouldReplace {
                return (rule.replace, endIndex - 1)
            }
        }
        
        return (pattern.replace, endIndex - 1)
    }

    static func orva(text: String) -> String {
        let reversePatterns = patterns.filter { pattern in
            return pattern.replace.count > 0 && pattern.find.count > 0 && pattern.find != "o" && pattern.replace != ""
        }.map { pattern -> Pattern in
            return Pattern(find: pattern.replace, replace: pattern.find, rules: pattern.rules)
        }.sorted { a, b in
            return b.find.count > a.find.count
        }
        var output = ""
        var maxIterations = text.count * 2
        var iterations = 0
        var cur = 0
        while cur < text.count {
            iterations += 1
            if iterations > maxIterations {
                print("Orva transliteration exceeded maximum iterations, breaking to prevent infinite loop")
                break
            }
            let start = cur
            var matched = false
            for pattern in reversePatterns {
                let end = cur + pattern.find.count
                if end > text.count {
                    continue
                }
                let segment = String(text[text.index(text.startIndex, offsetBy: start)..<text.index(text.startIndex, offsetBy: end)])
                if segment == pattern.find {
                    output += pattern.replace
                    cur = end - 1
                    matched = true
                    break
                }
            }
            if !matched {
                output += String(text[text.index(text.startIndex, offsetBy: cur)])
            }
            cur += 1
        }
        return output.replacingOccurrences(of: "`", with: "").replacingOccurrences(of: "আ", with: "a").replacingOccurrences(of: "অ", with: "o").replacingOccurrences(of: "ই", with: "i").replacingOccurrences(of: "ঈ", with: "e").replacingOccurrences(of: "উ", with: "u").replacingOccurrences(of: "এ", with: "e").replacingOccurrences(of: "্", with: "").replacingOccurrences(of: "়", with: "").replacingOccurrences(of: "উ", with: "u")
    }

    static func banglish(text: String) -> String {
        fatalError("Banglish transliteration is not implemented yet")
    }

    static func lishbang(text: String) -> String {
        fatalError("Lishbang transliteration is not implemented yet")
    }
}