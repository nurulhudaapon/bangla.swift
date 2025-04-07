# BanglaKit

A Swift package for Bangla language processing, providing various NLP functionalities.

## Features

- [ ] 🔍 Tokenization: Breaking down Bangla text into tokens
- [ ] 🌱 Stemming: Reducing Bangla words to their root form (upcoming)
- [ ] 🏷️ POS: Part of Speech tagging for Bangla text (upcoming)
- [ ] 🔖 NER: Named Entity Recognition for Bangla text (upcoming)
- [x] ↹ Transliteration: Converting between different Bangla scripts (upcoming)

## Requirements

- macOS 13.0+
- iOS 16.0+
- Swift 6.1+

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/nurulhudaapon/bangla.swift.git", from: "0.1.0")
]
```

### Xcode

1. In Xcode, go to File > Add Packages... (or use the keyboard shortcut ⌘⇧⌥A)
2. In the search bar at the top right, paste this URL:
   ```
   https://github.com/nurulhudaapon/bangla.swift.git
   ```
3. Click "Add Package"
4. Choose your desired version and target, then click "Add Package"

## Usage

```swift
import BanglaKit

print(Transliteration.transliterate(text: "ami tOmay valObashi.", mode: "avro")) // => আমি তোমায় ভালোবাসি।
```
