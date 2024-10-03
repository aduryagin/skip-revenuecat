import XCTest
import OSLog
import Foundation
@testable import SkipRevenueCat

let logger: Logger = Logger(subsystem: "SkipRevenueCat", category: "Tests")

@available(macOS 13, *)
final class SkipRevenueCatTests: XCTestCase {
    func testSkipRevenueCat() throws {
        logger.log("running testSkipRevenueCat")
        XCTAssertEqual(1 + 2, 3, "basic test")
        
        // load the TestData.json file from the Resources folder and decode it into a struct
        let resourceURL: URL = try XCTUnwrap(Bundle.module.url(forResource: "TestData", withExtension: "json"))
        let testData = try JSONDecoder().decode(TestData.self, from: Data(contentsOf: resourceURL))
        XCTAssertEqual("SkipRevenueCat", testData.testModuleName)
    }
}

struct TestData : Codable, Hashable {
    var testModuleName: String
}
