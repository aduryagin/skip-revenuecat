import XCTest
import OSLog
import Foundation
@testable import SkipRevenueCatApp

let logger: Logger = Logger(subsystem: "SkipRevenueCatApp", category: "Tests")

@available(macOS 13, *)
final class SkipRevenueCatAppTests: XCTestCase {
    func testSkipRevenueCatApp() throws {
        logger.log("running testSkipRevenueCatApp")
        XCTAssertEqual(1 + 2, 3, "basic test")
        
        // load the TestData.json file from the Resources folder and decode it into a struct
        let resourceURL: URL = try XCTUnwrap(Bundle.module.url(forResource: "TestData", withExtension: "json"))
        let testData = try JSONDecoder().decode(TestData.self, from: Data(contentsOf: resourceURL))
        XCTAssertEqual("SkipRevenueCatApp", testData.testModuleName)
    }
}

struct TestData : Codable, Hashable {
    var testModuleName: String
}