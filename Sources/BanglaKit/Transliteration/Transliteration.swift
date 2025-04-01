import Foundation

public class Transliteration {
    public static func transliterate(text: String, mode: String = "avro") -> String {
        let patterns: [[String: Any]] = [
            ["find": "bhl", "replace": "ভ্ল"],
            ["find": "psh", "replace": "পশ"],
            ["find": "bdh", "replace": "ব্ধ"],
            ["find": "bj", "replace": "ব্জ"],
            ["find": "bd", "replace": "ব্দ"],
            ["find": "bb", "replace": "ব্ব"],
            ["find": "bl", "replace": "ব্ল"],
            ["find": "bh", "replace": "ভ"],
            ["find": "vl", "replace": "ভ্ল"],
            ["find": "b", "replace": "ব"],
            ["find": "v", "replace": "ভ"],
            ["find": "cNG", "replace": "চ্ঞ"],
            ["find": "cch", "replace": "চ্ছ"],
            ["find": "cc", "replace": "চ্চ"],
            ["find": "ch", "replace": "ছ"],
            ["find": "c", "replace": "চ"],
            ["find": "dhn", "replace": "ধ্ন"],
            ["find": "dhm", "replace": "ধ্ম"],
            ["find": "dgh", "replace": "দ্ঘ"],
            ["find": "ddh", "replace": "দ্ধ"],
            ["find": "dbh", "replace": "দ্ভ"],
            ["find": "dv", "replace": "দ্ভ"],
            ["find": "dm", "replace": "দ্ম"],
            ["find": "DD", "replace": "ড্ড"],
            ["find": "Dh", "replace": "ঢ"],
            ["find": "dh", "replace": "ধ"],
            ["find": "dg", "replace": "দ্গ"],
            ["find": "dd", "replace": "দ্দ"],
            ["find": "D", "replace": "ড"],
            ["find": "d", "replace": "দ"],
            ["find": "...", "replace": "..."],
            ["find": ".`", "replace": "."],
            ["find": "..", "replace": "।॥"],
            ["find": ".", "replace": "।"],
            ["find": "ghn", "replace": "ঘ্ন"],
            ["find": "Ghn", "replace": "ঘ্ন"],
            ["find": "gdh", "replace": "গ্ধ"],
            ["find": "Gdh", "replace": "গ্ধ"],
            ["find": "gN", "replace": "গ্ণ"],
            ["find": "GN", "replace": "গ্ণ"],
            ["find": "gn", "replace": "গ্ন"],
            ["find": "Gn", "replace": "গ্ন"],
            ["find": "gm", "replace": "গ্ম"],
            ["find": "Gm", "replace": "গ্ম"],
            ["find": "gl", "replace": "গ্ল"],
            ["find": "Gl", "replace": "গ্ল"],
            ["find": "gg", "replace": "জ্ঞ"],
            ["find": "GG", "replace": "জ্ঞ"],
            ["find": "Gg", "replace": "জ্ঞ"],
            ["find": "gG", "replace": "জ্ঞ"],
            ["find": "gh", "replace": "ঘ"],
            ["find": "Gh", "replace": "ঘ"],
            ["find": "g", "replace": "গ"],
            ["find": "G", "replace": "গ"],
            ["find": "hN", "replace": "হ্ণ"],
            ["find": "hn", "replace": "হ্ন"],
            ["find": "hm", "replace": "হ্ম"],
            ["find": "hl", "replace": "হ্ল"],
            ["find": "h", "replace": "হ"],
            ["find": "jjh", "replace": "জ্ঝ"],
            ["find": "jNG", "replace": "জ্ঞ"],
            ["find": "jh", "replace": "ঝ"],
            ["find": "jj", "replace": "জ্জ"],
            ["find": "j", "replace": "জ"],
            ["find": "J", "replace": "জ"],
            ["find": "kkhN", "replace": "ক্ষ্ণ"],
            ["find": "kShN", "replace": "ক্ষ্ণ"],
            ["find": "kkhm", "replace": "ক্ষ্ম"],
            ["find": "kShm", "replace": "ক্ষ্ম"],
            ["find": "kxN", "replace": "ক্ষ্ণ"],
            ["find": "kxm", "replace": "ক্ষ্ম"],
            ["find": "kkh", "replace": "ক্ষ"],
            ["find": "kSh", "replace": "ক্ষ"],
            ["find": "ksh", "replace": "কশ"],
            ["find": "kx", "replace": "ক্ষ"],
            ["find": "kk", "replace": "ক্ক"],
            ["find": "kT", "replace": "ক্ট"],
            ["find": "kt", "replace": "ক্ত"],
            ["find": "kl", "replace": "ক্ল"],
            ["find": "ks", "replace": "ক্স"],
            ["find": "kh", "replace": "খ"],
            ["find": "k", "replace": "ক"],
            ["find": "lbh", "replace": "ল্ভ"],
            ["find": "ldh", "replace": "ল্ধ"],
            ["find": "lkh", "replace": "লখ"],
            ["find": "lgh", "replace": "লঘ"],
            ["find": "lph", "replace": "লফ"],
            ["find": "lk", "replace": "ল্ক"],
            ["find": "lg", "replace": "ল্গ"],
            ["find": "lT", "replace": "ল্ট"],
            ["find": "lD", "replace": "ল্ড"],
            ["find": "lp", "replace": "ল্প"],
            ["find": "lv", "replace": "ল্ভ"],
            ["find": "lm", "replace": "ল্ম"],
            ["find": "ll", "replace": "ল্ল"],
            ["find": "lb", "replace": "ল্ব"],
            ["find": "l", "replace": "ল"],
            ["find": "mth", "replace": "ম্থ"],
            ["find": "mph", "replace": "ম্ফ"],
            ["find": "mbh", "replace": "ম্ভ"],
            ["find": "mpl", "replace": "মপ্ল"],
            ["find": "mn", "replace": "ম্ন"],
            ["find": "mp", "replace": "ম্প"],
            ["find": "mv", "replace": "ম্ভ"],
            ["find": "mm", "replace": "ম্ম"],
            ["find": "ml", "replace": "ম্ল"],
            ["find": "mb", "replace": "ম্ব"],
            ["find": "mf", "replace": "ম্ফ"],
            ["find": "m", "replace": "ম"],
            ["find": "0", "replace": "০"],
            ["find": "1", "replace": "১"],
            ["find": "2", "replace": "২"],
            ["find": "3", "replace": "৩"],
            ["find": "4", "replace": "৪"],
            ["find": "5", "replace": "৫"],
            ["find": "6", "replace": "৬"],
            ["find": "7", "replace": "৭"],
            ["find": "8", "replace": "৮"],
            ["find": "9", "replace": "৯"],
            ["find": "NgkSh", "replace": "ঙ্ক্ষ"],
            ["find": "Ngkkh", "replace": "ঙ্ক্ষ"],
            ["find": "NGch", "replace": "ঞ্ছ"],
            ["find": "Nggh", "replace": "ঙ্ঘ"],
            ["find": "Ngkh", "replace": "ঙ্খ"],
            ["find": "NGjh", "replace": "ঞ্ঝ"],
            ["find": "ngOU", "replace": "ঙ্গৌ"],
            ["find": "ngOI", "replace": "ঙ্গৈ"],
            ["find": "Ngkx", "replace": "ঙ্ক্ষ"],
            ["find": "NGc", "replace": "ঞ্চ"],
            ["find": "nch", "replace": "ঞ্ছ"],
            ["find": "njh", "replace": "ঞ্ঝ"],
            ["find": "ngh", "replace": "ঙ্ঘ"],
            ["find": "Ngk", "replace": "ঙ্ক"],
            ["find": "Ngx", "replace": "ঙ্ষ"],
            ["find": "Ngg", "replace": "ঙ্গ"],
            ["find": "Ngm", "replace": "ঙ্ম"],
            ["find": "NGj", "replace": "ঞ্জ"],
            ["find": "ndh", "replace": "ন্ধ"],
            ["find": "nTh", "replace": "ন্ঠ"],
            ["find": "NTh", "replace": "ণ্ঠ"],
            ["find": "nth", "replace": "ন্থ"],
            ["find": "nkh", "replace": "ঙ্খ"],
            ["find": "ngo", "replace": "ঙ্গ"],
            ["find": "nga", "replace": "ঙ্গা"],
            ["find": "ngi", "replace": "ঙ্গি"],
            ["find": "ngI", "replace": "ঙ্গী"],
            ["find": "ngu", "replace": "ঙ্গু"],
            ["find": "ngU", "replace": "ঙ্গূ"],
            ["find": "nge", "replace": "ঙ্গে"],
            ["find": "ngO", "replace": "ঙ্গো"],
            ["find": "NDh", "replace": "ণ্ঢ"],
            ["find": "nsh", "replace": "নশ"],
            ["find": "Ngr", "replace": "ঙর"],
            ["find": "NGr", "replace": "ঞর"],
            ["find": "ngr", "replace": "ংর"],
            ["find": "nj", "replace": "ঞ্জ"],
            ["find": "Ng", "replace": "ঙ"],
            ["find": "NG", "replace": "ঞ"],
            ["find": "nk", "replace": "ঙ্ক"],
            ["find": "ng", "replace": "ং"],
            ["find": "nn", "replace": "ন্ন"],
            ["find": "NN", "replace": "ণ্ণ"],
            ["find": "Nn", "replace": "ণ্ন"],
            ["find": "nm", "replace": "ন্ম"],
            ["find": "Nm", "replace": "ণ্ম"],
            ["find": "nd", "replace": "ন্দ"],
            ["find": "nT", "replace": "ন্ট"],
            ["find": "NT", "replace": "ণ্ট"],
            ["find": "nD", "replace": "ন্ড"],
            ["find": "ND", "replace": "ণ্ড"],
            ["find": "nt", "replace": "ন্ত"],
            ["find": "ns", "replace": "ন্স"],
            ["find": "nc", "replace": "ঞ্চ"],
            ["find": "n", "replace": "ন"],
            ["find": "N", "replace": "ণ"],
            ["find": "OI`", "replace": "ৈ"],
            ["find": "OU`", "replace": "ৌ"],
            ["find": "O`", "replace": "ো"],
            [
                "find": "OI", "replace": "ৈ",
                "rules": [
                    ["matches": [["type": "prefix", "scope": "!consonant"]], "replace": "ঐ"],
                    ["matches": [["type": "prefix", "scope": "punctuation"]], "replace": "ঐ"],
                ],
            ],
            [
                "find": "OU", "replace": "ৌ",
                "rules": [
                    ["matches": [["type": "prefix", "scope": "!consonant"]], "replace": "ঔ"],
                    ["matches": [["type": "prefix", "scope": "punctuation"]], "replace": "ঔ"],
                ],
            ],
            [
                "find": "O", "replace": "ো",
                "rules": [
                    ["matches": [["type": "prefix", "scope": "!consonant"]], "replace": "ও"],
                    ["matches": [["type": "prefix", "scope": "punctuation"]], "replace": "ও"],
                ],
            ],
            ["find": "phl", "replace": "ফ্ল"],
            ["find": "pT", "replace": "প্ট"],
            ["find": "pt", "replace": "প্ত"],
            ["find": "pn", "replace": "প্ন"],
            ["find": "pp", "replace": "প্প"],
            ["find": "pl", "replace": "প্ল"],
            ["find": "ps", "replace": "প্স"],
            ["find": "ph", "replace": "ফ"],
            ["find": "fl", "replace": "ফ্ল"],
            ["find": "f", "replace": "ফ"],
            ["find": "p", "replace": "প"],
            ["find": "rri`", "replace": "ৃ"],
            [
                "find": "rri", "replace": "ৃ",
                "rules": [
                    ["matches": [["type": "prefix", "scope": "!consonant"]], "replace": "ঋ"],
                    ["matches": [["type": "prefix", "scope": "punctuation"]], "replace": "ঋ"],
                ],
            ],
            ["find": "rrZ", "replace": "রর‍্য"],
            ["find": "rry", "replace": "রর‍্য"],
            [
                "find": "rZ", "replace": "র‍্য",
                "rules": [
                    [
                        "matches": [
                            ["type": "prefix", "scope": "consonant"],
                            ["type": "prefix", "scope": "!exact", "value": "r"],
                            ["type": "prefix", "scope": "!exact", "value": "y"],
                            ["type": "prefix", "scope": "!exact", "value": "w"],
                            ["type": "prefix", "scope": "!exact", "value": "x"],
                        ], "replace": "্র্য",
                    ]
                ],
            ],
            [
                "find": "ry", "replace": "র‍্য",
                "rules": [
                    [
                        "matches": [
                            ["type": "prefix", "scope": "consonant"],
                            ["type": "prefix", "scope": "!exact", "value": "r"],
                            ["type": "prefix", "scope": "!exact", "value": "y"],
                            ["type": "prefix", "scope": "!exact", "value": "w"],
                            ["type": "prefix", "scope": "!exact", "value": "x"],
                        ], "replace": "্র্য",
                    ]
                ],
            ],
            [
                "find": "rr", "replace": "রর",
                "rules": [
                    [
                        "matches": [
                            ["type": "prefix", "scope": "!consonant"],
                            ["type": "suffix", "scope": "!vowel"],
                            ["type": "suffix", "scope": "!exact", "value": "r"],
                            ["type": "suffix", "scope": "!punctuation"],
                        ], "replace": "র্",
                    ],
                    [
                        "matches": [
                            ["type": "prefix", "scope": "consonant"],
                            ["type": "prefix", "scope": "!exact", "value": "r"],
                        ], "replace": "্রর",
                    ],
                ],
            ],
            ["find": "Rg", "replace": "ড়্গ"],
            ["find": "Rh", "replace": "ঢ়"],
            ["find": "R", "replace": "ড়"],
            [
                "find": "r", "replace": "র",
                "rules": [
                    [
                        "matches": [
                            ["type": "prefix", "scope": "consonant"],
                            ["type": "prefix", "scope": "!exact", "value": "r"],
                            ["type": "prefix", "scope": "!exact", "value": "y"],
                            ["type": "prefix", "scope": "!exact", "value": "w"],
                            ["type": "prefix", "scope": "!exact", "value": "x"],
                            ["type": "prefix", "scope": "!exact", "value": "Z"],
                        ], "replace": "্র",
                    ]
                ],
            ],
            ["find": "shch", "replace": "শ্ছ"],
            ["find": "ShTh", "replace": "ষ্ঠ"],
            ["find": "Shph", "replace": "ষ্ফ"],
            ["find": "Sch", "replace": "শ্ছ"],
            ["find": "skl", "replace": "স্ক্ল"],
            ["find": "skh", "replace": "স্খ"],
            ["find": "sth", "replace": "স্থ"],
            ["find": "sph", "replace": "স্ফ"],
            ["find": "shc", "replace": "শ্চ"],
            ["find": "sht", "replace": "শ্ত"],
            ["find": "shn", "replace": "শ্ন"],
            ["find": "shm", "replace": "শ্ম"],
            ["find": "shl", "replace": "শ্ল"],
            ["find": "Shk", "replace": "ষ্ক"],
            ["find": "ShT", "replace": "ষ্ট"],
            ["find": "ShN", "replace": "ষ্ণ"],
            ["find": "Shp", "replace": "ষ্প"],
            ["find": "Shf", "replace": "ষ্ফ"],
            ["find": "Shm", "replace": "ষ্ম"],
            ["find": "spl", "replace": "স্প্ল"],
            ["find": "sk", "replace": "স্ক"],
            ["find": "Sc", "replace": "শ্চ"],
            ["find": "sT", "replace": "স্ট"],
            ["find": "st", "replace": "স্ত"],
            ["find": "sn", "replace": "স্ন"],
            ["find": "sp", "replace": "স্প"],
            ["find": "sf", "replace": "স্ফ"],
            ["find": "sm", "replace": "স্ম"],
            ["find": "sl", "replace": "স্ল"],
            ["find": "sh", "replace": "শ"],
            ["find": "Sc", "replace": "শ্চ"],
            ["find": "St", "replace": "শ্ত"],
            ["find": "Sn", "replace": "শ্ন"],
            ["find": "Sm", "replace": "শ্ম"],
            ["find": "Sl", "replace": "শ্ল"],
            ["find": "Sh", "replace": "ষ"],
            ["find": "s", "replace": "স"],
            ["find": "S", "replace": "শ"],
            ["find": "oo`", "replace": "ু"],
            [
                "find": "oo", "replace": "ু",
                "rules": [
                    [
                        "matches": [
                            ["type": "prefix", "scope": "!consonant"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "উ",
                    ],
                    [
                        "matches": [
                            ["type": "prefix", "scope": "punctuation"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "উ",
                    ],
                ],
            ],
            ["find": "o`", "replace": ""],
            ["find": "oZ", "replace": "অ্য"],
            [
                "find": "o", "replace": "",
                "rules": [
                    [
                        "matches": [
                            ["type": "prefix", "scope": "vowel"],
                            ["type": "prefix", "scope": "!exact", "value": "o"],
                        ], "replace": "ও",
                    ],
                    [
                        "matches": [
                            ["type": "prefix", "scope": "vowel"],
                            ["type": "prefix", "scope": "exact", "value": "o"],
                        ], "replace": "অ",
                    ], ["matches": [["type": "prefix", "scope": "punctuation"]], "replace": "অ"],
                ],
            ],
            ["find": "tth", "replace": "ত্থ"],
            ["find": "t``", "replace": "ৎ"],
            ["find": "TT", "replace": "ট্ট"],
            ["find": "Tm", "replace": "ট্ম"],
            ["find": "Th", "replace": "ঠ"],
            ["find": "tn", "replace": "ত্ন"],
            ["find": "tm", "replace": "ত্ম"],
            ["find": "th", "replace": "থ"],
            ["find": "tt", "replace": "ত্ত"],
            ["find": "T", "replace": "ট"],
            ["find": "t", "replace": "ত"],
            ["find": "aZ", "replace": "অ্যা"],
            ["find": "AZ", "replace": "অ্যা"],
            ["find": "a`", "replace": "া"],
            ["find": "A`", "replace": "া"],
            [
                "find": "a", "replace": "া",
                "rules": [
                    [
                        "matches": [
                            ["type": "prefix", "scope": "punctuation"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "আ",
                    ],
                    [
                        "matches": [
                            ["type": "prefix", "scope": "!consonant"],
                            ["type": "prefix", "scope": "!exact", "value": "a"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "য়া",
                    ],
                    [
                        "matches": [
                            ["type": "prefix", "scope": "exact", "value": "a"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "আ",
                    ],
                ],
            ],
            ["find": "i`", "replace": "ি"],
            [
                "find": "i", "replace": "ি",
                "rules": [
                    [
                        "matches": [
                            ["type": "prefix", "scope": "!consonant"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "ই",
                    ],
                    [
                        "matches": [
                            ["type": "prefix", "scope": "punctuation"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "ই",
                    ],
                ],
            ],
            ["find": "I`", "replace": "ী"],
            [
                "find": "I", "replace": "ী",
                "rules": [
                    [
                        "matches": [
                            ["type": "prefix", "scope": "!consonant"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "ঈ",
                    ],
                    [
                        "matches": [
                            ["type": "prefix", "scope": "punctuation"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "ঈ",
                    ],
                ],
            ],
            ["find": "u`", "replace": "ু"],
            [
                "find": "u", "replace": "ু",
                "rules": [
                    [
                        "matches": [
                            ["type": "prefix", "scope": "!consonant"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "উ",
                    ],
                    [
                        "matches": [
                            ["type": "prefix", "scope": "punctuation"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "উ",
                    ],
                ],
            ],
            ["find": "U`", "replace": "ূ"],
            [
                "find": "U", "replace": "ূ",
                "rules": [
                    [
                        "matches": [
                            ["type": "prefix", "scope": "!consonant"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "ঊ",
                    ],
                    [
                        "matches": [
                            ["type": "prefix", "scope": "punctuation"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "ঊ",
                    ],
                ],
            ],
            ["find": "ee`", "replace": "ী"],
            [
                "find": "ee", "replace": "ী",
                "rules": [
                    [
                        "matches": [
                            ["type": "prefix", "scope": "!consonant"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "ঈ",
                    ],
                    [
                        "matches": [
                            ["type": "prefix", "scope": "punctuation"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "ঈ",
                    ],
                ],
            ],
            ["find": "e`", "replace": "ে"],
            [
                "find": "e", "replace": "ে",
                "rules": [
                    [
                        "matches": [
                            ["type": "prefix", "scope": "!consonant"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "এ",
                    ],
                    [
                        "matches": [
                            ["type": "prefix", "scope": "punctuation"],
                            ["type": "suffix", "scope": "!exact", "value": "`"],
                        ], "replace": "এ",
                    ],
                ],
            ],
            ["find": "z", "replace": "য"],
            ["find": "Z", "replace": "্য"],
            [
                "find": "y", "replace": "্য",
                "rules": [
                    [
                        "matches": [
                            ["type": "prefix", "scope": "!consonant"],
                            ["type": "prefix", "scope": "!punctuation"],
                        ], "replace": "য়",
                    ], ["matches": [["type": "prefix", "scope": "punctuation"]], "replace": "ইয়"],
                ],
            ],
            ["find": "Y", "replace": "য়"],
            ["find": "q", "replace": "ক"],
            [
                "find": "w", "replace": "ও",
                "rules": [
                    [
                        "matches": [
                            ["type": "prefix", "scope": "punctuation"],
                            ["type": "suffix", "scope": "vowel"],
                        ], "replace": "ওয়",
                    ], ["matches": [["type": "prefix", "scope": "consonant"]], "replace": "্ব"],
                ],
            ],
            [
                "find": "x", "replace": "ক্স",
                "rules": [
                    ["matches": [["type": "prefix", "scope": "punctuation"]], "replace": "এক্স"]
                ],
            ],
            ["find": ":`", "replace": ":"],
            ["find": ":", "replace": "ঃ"],
            ["find": "^`", "replace": "^"],
            ["find": "^", "replace": "ঁ"],
            ["find": ",,", "replace": "্‌"],
            ["find": ",", "replace": ","],
            ["find": "$", "replace": "৳"],
            ["find": "`", "replace": ""],
        ]

        let vowel = "aeiou"
        let consonant = "bcdfghjklmnpqrstvwxyz"
        let casesensitive = "oiudgjnrstyz"

        func fixString(_ input: String) -> String {
            var fixed = ""
            for char in input {
                if casesensitive.contains(char.lowercased()) {
                    fixed.append(char)
                } else {
                    fixed.append(char.lowercased())
                }
            }
            return fixed
        }

        func isVowel(_ c: Character) -> Bool {
            return vowel.contains(c.lowercased())
        }

        func isConsonant(_ c: Character) -> Bool {
            return consonant.contains(c.lowercased())
        }

        func isPunctuation(_ c: Character) -> Bool {
            return !isVowel(c) && !isConsonant(c)
        }

        func isExact(needle: String, haystack: String, start: Int, end: Int, not: Bool) -> Bool {
            guard start >= 0, end <= haystack.count else { return not }
            let substring = String(
                haystack[
                    haystack.index(
                        haystack.startIndex, offsetBy: start)..<haystack.index(
                            haystack.startIndex, offsetBy: end)])
            return (substring == needle) != not
        }

        func avro(_ text: String) -> String {
            let fixed = fixString(text)
            var output = ""
            var cur = 0
            while cur < fixed.count {
                let start = cur
                var end = cur + 1
                let prev = start - 1
                var matched = false
                for pattern in patterns {
                    guard let find = pattern["find"] as? String,
                        let replace = pattern["replace"] as? String
                    else { continue }
                    end = cur + find.count
                    if end <= fixed.count
                        && String(
                            fixed[
                                fixed.index(
                                    fixed.startIndex, offsetBy: start)..<fixed.index(
                                        fixed.startIndex, offsetBy: end)]) == find
                    {
                        var ruleMatched = false
                        if let rules = pattern["rules"] as? [[String: Any]] {
                            for rawRule in rules {
                                guard let rule = rawRule as? [String: Any],
                                    let replaceRule = rule["replace"] as? String,
                                    let matches = rule["matches"] as? [[String: Any]]
                                else { continue }
                                var replaceBool = true
                                for match in matches {
                                    guard let type = match["type"] as? String,
                                        var scope = match["scope"] as? String
                                    else {
                                        replaceBool = false
                                        break
                                    }
                                    var negative = false
                                    if scope.first == "!" {
                                        negative = true
                                        scope = String(scope.dropFirst())
                                    }
                                    let value = match["value"] as? String ?? ""
                                    var chk = 0
                                    if type == "suffix" {
                                        chk = end
                                    } else {
                                        chk = prev
                                    }
                                    if scope == "punctuation" {
                                        if !((chk < 0 && type == "prefix"
                                            || chk >= fixed.count && type == "suffix"
                                            || isPunctuation(
                                                fixed[fixed.index(fixed.startIndex, offsetBy: chk)]))
                                            != negative)
                                        {
                                            replaceBool = false
                                            break
                                        }
                                    } else if scope == "vowel" {
                                        if !((chk >= 0 && type == "prefix"
                                            || chk < fixed.count && type == "suffix")
                                            && isVowel(
                                                fixed[fixed.index(fixed.startIndex, offsetBy: chk)])
                                                != negative)
                                        {
                                            replaceBool = false
                                            break
                                        }
                                    } else if scope == "consonant" {
                                        if !((chk >= 0 && type == "prefix"
                                            || chk < fixed.count && type == "suffix")
                                            && isConsonant(
                                                fixed[fixed.index(fixed.startIndex, offsetBy: chk)])
                                                != negative)
                                        {
                                            replaceBool = false
                                            break
                                        }
                                    } else if scope == "exact" {
                                        let s: Int
                                        let e: Int
                                        if type == "suffix" {
                                            s = end
                                            e = end + value.count
                                        } else {
                                            s = start - value.count
                                            e = start
                                        }
                                        if !isExact(
                                            needle: value, haystack: fixed, start: s, end: e,
                                            not: negative)
                                        {
                                            replaceBool = false
                                            break
                                        }
                                    }
                                }
                                if replaceBool {
                                    output.append(replaceRule)
                                    cur = end - 1
                                    matched = true
                                    ruleMatched = true
                                    break
                                }
                            }
                        }
                        if ruleMatched { break }
                        output.append(replace)
                        cur = end - 1
                        matched = true
                        break
                    }
                }
                if !matched {
                    output.append(fixed[fixed.index(fixed.startIndex, offsetBy: cur)])
                }
                cur += 1
            }
            return output
        }

        func orva(_ text: String) -> String {
            let reversePatterns = patterns.compactMap { pattern -> [String: Any]? in
                guard let replace = pattern["replace"] as? String,
                    let find = pattern["find"] as? String, replace.count > 0, find.count > 0,
                    find != "o", replace != ""
                else { return nil }
                return ["find": replace, "replace": find, "rules": pattern["rules"] as Any]
            }.sorted { (a, b) in
                guard let findA = a["find"] as? String, let findB = b["find"] as? String else {
                    return false
                }
                return findA.count > findB.count
            }

            var output = ""
            var cur = 0
            var iterations = 0
            let maxIterations = text.count * 2
            while cur < text.count {
                iterations += 1
                if iterations > maxIterations {
                    print(
                        "Orva transliteration exceeded maximum iterations, breaking to prevent infinite loop"
                    )
                    break
                }
                let start = cur
                var matched = false
                for pattern in reversePatterns {
                    guard let find = pattern["find"] as? String,
                        let replace = pattern["replace"] as? String
                    else { continue }
                    let end = cur + find.count
                    if end > text.count { continue }
                    let segment = String(
                        text[
                            text.index(
                                text.startIndex, offsetBy: start)..<text.index(
                                    text.startIndex, offsetBy: end)])
                    if segment == find {
                        output.append(replace)
                        cur = end - 1
                        matched = true
                        break
                    }
                }
                if !matched {
                    output.append(text[text.index(text.startIndex, offsetBy: cur)])
                }
                cur += 1
            }
            return output.replacingOccurrences(of: "`", with: "").replacingOccurrences(
                of: "আ", with: "a"
            ).replacingOccurrences(of: "অ", with: "o").replacingOccurrences(of: "ই", with: "i")
                .replacingOccurrences(of: "ঈ", with: "e").replacingOccurrences(of: "উ", with: "u")
                .replacingOccurrences(of: "এ", with: "e").replacingOccurrences(of: "্", with: "")
                .replacingOccurrences(of: "়", with: "").replacingOccurrences(of: "উ", with: "u")
        }

        func banglish(_ text: String) -> String {
            print("Banglish transliteration is not implemented yet")
            return text
        }

        func lishbang(_ text: String) -> String {
            print("Lishbang transliteration is not implemented yet")
            return text
        }

        let modeFunctions: [String: (String) -> String] = [
            "avro": avro,
            "orva": orva,
            "banglish": banglish,
            "lishbang": lishbang,
        ]

        guard let fn = modeFunctions[mode] else {
            print("Invalid mode. Available modes are: 'avro', 'orva', 'banglish', 'lishbang'")
            return text
        }
        return fn(text)
    }
}
