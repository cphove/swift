import XCTest
@testable import ShowMeBug

final class HiddenTest: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ShowMeBug().solution(1, 2), 3)
    }
}
