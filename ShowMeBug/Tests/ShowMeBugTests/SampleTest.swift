import XCTest
@testable import ShowMeBug

final class SampleTest: XCTestCase {
    func testSolution() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ShowMeBug().solution(1, 2), 3)
    }

    func testSearch() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let nums: [Int] = [5, 1, 4, 2, 8, 7]
        let target: Int = 3
        XCTAssertEqual(ShowMeBug().search(nums, target), -1)
    }

    func testFind() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let strs: [String] = ["lcy", "zzy", "wjc", "cph", "sby"]
        let target: String = "cph"
        XCTAssertTrue(ShowMeBug().find(strs, target))
    }

    func testSubsrting() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let origin = "helloWorld"
        let start = 2
        let len = 4
        XCTAssertEqual(ShowMeBug().substring(origin, start, len), "ello")
    }

    func testAdd() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let expected: Double = 1.4
        let a: Double = 2.7
        let b: Double = -1.3
        XCTAssertEqual(ShowMeBug().add(a, b), expected, accuracy: 0.01)
    }

    func testSub() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let expected: Float = 1.4
        let a: Float = 2.7
        let b: Float = 1.3
        XCTAssertEqual(ShowMeBug().sub(a, b), expected, accuracy: 0.01)
    }
}
