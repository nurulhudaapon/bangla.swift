import Testing
import Foundation
@testable import BanglaKit

final class TransliterationTests {
    var testData: TestData
    init() async throws {
         // Load test data from JSON file
        guard let testDataURL = Bundle.module.url(forResource: "test_data", withExtension: "json") else {
            throw TestError("Could not find test_data.json in test bundle")
        }
        
        let jsonData = try Data(contentsOf: testDataURL)
        let testData = try JSONDecoder().decode(TestData.self, from: jsonData)
        self.testData = testData
    }


    @Test func basic() async throws {
        // Test each avro test case
        for testCase in testData.avro {
            let result = Transliteration.transliterate(text: testCase.orva, mode: "avro")
            #expect(result == testCase.avroed)
        }
    }

    @Test func ligature() async throws {
      
        
        // Test each ligature
        for (key, value) in testData.ligature.ligatures {
            let result = Transliteration.transliterate(text: key, mode: "avro")
            #expect(result == value, "Failed for ligature: \(key)")
        }
    }

    @Test func performance() async throws {
        // This test should process large text quickly (under 4ms per thousand characters)
        let ALLOWED_MS_PER_THOUSAND_CHARS = 4.0
        let REPETITION_COUNT = 1000 // Increased to match JS test

        let sampleText = testData.avro[0].orva
        let largeText = String(repeating: sampleText, count: REPETITION_COUNT)
        
        let startTime = Date()
        let result = Transliteration.transliterate(text: largeText, mode: "avro")
        let endTime = Date()
        
        let executionTime = endTime.timeIntervalSince(startTime) * 1000 // Convert to milliseconds
        let executionTimePerThousandChars = (executionTime / Double(largeText.count)) * 1000
        
        print("Time taken per 1000 chars: \(executionTimePerThousandChars)ms")
        
        // Check if performance meets the requirement
        #expect(executionTimePerThousandChars <= ALLOWED_MS_PER_THOUSAND_CHARS)
        
        // Verify the result is correct by checking first few characters
        let expectedStart = String(testData.avro[0].avroed.prefix(testData.avro[0].avroed.count))
        let resultStart = String(result.prefix(testData.avro[0].avroed.count))
        #expect(resultStart == expectedStart)
    }
}

// Test data structure to match JSON
struct TestData: Codable {
    struct Avro: Codable {
        let orva: String
        let avroed: String
    }
    
    struct Ligature: Codable {
        var ligatures: [String: String]
        
        init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            ligatures = try container.decode([String: String].self)
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.singleValueContainer()
            try container.encode(ligatures)
        }
    }
    
    let avro: [Avro]
    let ligature: Ligature
}

// Custom error for test failures
struct TestError: Error {
    let message: String
    
    init(_ message: String) {
        self.message = message
    }
}