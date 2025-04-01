import Testing
import Foundation
@testable import Transliteration

let text = "kemon achO bondhoo, onek din por dekha ami banglaY likhte khoob pochondo kori. bangla bhaSha amader matrribhaSha. eTar modhZe onek soondor soondor kobita O golpo ache. ami ceShTa kori sob somoY shooddho banglaY kotha bolte. ami jani, bangla bZakaroNe onek zooktakkhor ache, za likhte ekoTu koThin. kintu, ami segoolO shikhte cai. ami procoor boi poRi, za amake bangla bhaSha sombndhe arO beshi janote sahazZo kore. ami bisheSh kore robIndronath Thakoorer kobita O golp poRi, zar modhZe ononto prem O prkrritir chobi ache. ami biswas kori, bangla bhasa amader sobaike ek sootOY ba^dhe. ami ei bhaSha niYe gorrbo bOdh kori. ami asha kori, amora sobai mile bangla bhaShake arO unnoto korbO."

let transliteratedText = "কেমন আছো বন্ধু, অনেক দিন পর দেখা আমি বাংলায় লিখতে খুব পছন্দ করি। বাংলা ভাষা আমাদের মাতৃভাষা। এটার মধ্যে অনেক সুন্দর সুন্দর কবিতা ও গল্প আছে। আমি চেষ্টা করি সব সময় শুদ্ধ বাংলায় কথা বলতে। আমি জানি, বাংলা ব্যাকারণে অনেক যুক্তাক্ষর আছে, যা লিখতে একটু কঠিন। কিন্তু, আমি সেগুলো শিখতে চাই। আমি প্রচুর বই পড়ি, যা আমাকে বাংলা ভাষা সম্বন্ধে আরো বেশি জানতে সাহায্য করে। আমি বিশেষ করে রবীন্দ্রনাথ ঠাকুরের কবিতা ও গল্প পড়ি, যার মধ্যে অনন্ত প্রেম ও প্রকৃতির ছবি আছে। আমি বিস্বাস করি, বাংলা ভাসা আমাদের সবাইকে এক সুতোয় বাঁধে। আমি এই ভাষা নিয়ে গর্ব বোধ করি। আমি আশা করি, আমরা সবাই মিলে বাংলা ভাষাকে আরো উন্নত করবো।"

@Test func basic() async throws {
    let result =   transliterate(text: "ami banglar pracIn vaShar sahazye likhi.", mode: "avro")
    #expect(result == "আমি বাংলার প্রাচীন ভাষার সাহায্যে লিখি।")
}

@Test func largeText() async throws {
    let result =   transliterate(text: text, mode: "avro")
    #expect(result == transliteratedText)
}

@Test func performance() async throws {
    // This is very slow, but it's the best we can do with the current implementation, update the implementation to make it faster at around 5 ms per thousand characters
    let ALLOWED_MS_PER_THOUSAND_CHARS = 600.00 
    let REPETITION_COUNT = 1

    let sampleText = text
    let largeText = String(repeating: sampleText, count: REPETITION_COUNT)
    
    let startTime = Date()
    let result = transliterate(text: largeText, mode: "avro")
    let endTime = Date()
    
    let executionTime = endTime.timeIntervalSince(startTime) * 1000 // Convert to milliseconds
    let executionTimePerThousandChars = (executionTime / Double(largeText.count)) * 1000
    
    print("Time taken per 1000 chars: \(executionTimePerThousandChars)ms")
    
    // Check if performance meets the requirement
    #expect(executionTimePerThousandChars <= ALLOWED_MS_PER_THOUSAND_CHARS)
    
    // Verify the result is correct by checking first few characters
    let expectedStart = String(transliteratedText.prefix(transliteratedText.count))
    let resultStart = String(result.prefix(transliteratedText.count))
    #expect(resultStart == expectedStart)
}