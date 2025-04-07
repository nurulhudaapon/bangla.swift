import Testing
import Foundation
@testable import BanglaKit


final class TransliterationTests {
    var testData: TestData
    var transliteration: Transliteration
    init() async throws {
         // Load test data from JSON file
        guard let testDataURL = Bundle.module.url(forResource: "test_data", withExtension: "json") else {
            throw TestError("Could not find test_data.json in test bundle")
        }
        
        let jsonData = try Data(contentsOf: testDataURL)
        let testData = try JSONDecoder().decode(TestData.self, from: jsonData)
        self.testData = testData
        self.transliteration = try Transliteration()
    }


    @Test func basic() async throws {
        // Test each avro test case
        for testCase in testData.samples {
            let result = try transliteration.transliterate(text: testCase.en, mode: .avro)
            #expect(result == testCase.bn)
        }
    }

    @Test func ligature() async throws {
      
        
        // Test each ligature
        for (key, value) in testData.ligature.ligatures {
            let result = try transliteration.transliterate(text: key, mode: .avro)
            #expect(result == value, "Failed for ligature: \(key)")
        }
    }

    @Test func performance() async throws {
        // This test should process large text quickly (under 4ms per thousand characters)
        let ALLOWED_MS_PER_THOUSAND_CHARS = 4.0
        let REPETITION_COUNT = 100 // Increased for better measurement
        let WARMUP_RUNS = 3 // Add warmup runs to stabilize performance
        
        let sampleText = testData.samples[0].en
        let largeText = String(repeating: sampleText, count: REPETITION_COUNT)
        
        // Warmup runs
        for _ in 0..<WARMUP_RUNS {
            _ = try transliteration.transliterate(text: sampleText, mode: .avro)
        }
        
        // Actual performance measurement
        let startTime = Date()
        let result = try transliteration.transliterate(text: largeText, mode: .avro)
        let endTime = Date()
        
        let executionTime = endTime.timeIntervalSince(startTime) * 1000 // Convert to milliseconds
        let executionTimePerThousandChars = (executionTime / Double(largeText.count)) * 1000
        
        print("Time taken per 1000 chars: \(executionTimePerThousandChars)ms")
        print("Total execution time: \(executionTime)ms for \(largeText.count) characters")
        
        // Check if performance meets the requirement
        #expect(executionTimePerThousandChars <= ALLOWED_MS_PER_THOUSAND_CHARS)
        
        // Verify the result is correct by checking first few characters
        let expectedStart = String(testData.samples[0].bn.prefix(testData.samples[0].bn.count))
        let resultStart = String(result.prefix(testData.samples[0].bn.count))
        #expect(resultStart == expectedStart)
    }
}

// Test data structure to match JSON
struct TestData: Codable {
    struct Avro: Codable {
        let en: String
        let bn: String
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
    
    let samples: [Avro]
    let ligature: Ligature
}

// Custom error for test failures
struct TestError: Error {
    let message: String
    
    init(_ message: String) {
        self.message = message
    }
}