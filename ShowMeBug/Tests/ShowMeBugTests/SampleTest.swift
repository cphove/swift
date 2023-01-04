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

    func testCreateArray() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let expected: [Int] = [1, 2, 3, 4, 5]
        let initNum: Int = 1
        let n: Int = 5
        XCTAssertEqual(ShowMeBug().createArray(initNum, n), expected)
    }

    func testCreateTwoDArray() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let expected: [[Int]] = [
            [1, 2, 3, 4, 5],
            [6, 7, 8, 9, 0],
        ]
        let base: Int = 1
        let row: Int = 2
        let col: Int = 5
        XCTAssertEqual(ShowMeBug().createTwoDArray(row, col, base), expected)
    }

    func testOnlyElementEqual() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let expected: [Int] = [3, 1, 2, 4, 5]
        let a = 5
        let actual = ShowMeBug().onlyElementEqual(a)
        XCTAssertEqual(actual.sorted(), expected.sorted())
    }

    func testOnlyElementEqualString() throws {
        let expected: [String] = ["lcy", "zzy", "wjc", "cph"]
        let actual: [String] = ["zzy", "cph", "lcy", "wj"]
        XCTAssertEqual(actual.sorted(), expected.sorted())
    }

    func testOnlyElementEqualTDArray() throws {
        let expected: [[String]] = [
            ["3", "1", "2"],
            ["1", "4", "6"],
        ]
        let actual: [[String]] = [
            ["1", "6", "4"],
            ["3", "2", "2"],
        ]
        // 断言失败后，抛出错误信息
        // let failedMsg = "The element of (\"\(actual)\") is not equal to (\"\(expected)\")"
        // XCTAssertTrue(elementEqual(actual: actual, expected: expected), failedMsg)
        // XCTAssertEqual(elementEqual(actual: actual, expected: expected), true, failedMsg)
        // XCTAssert(elementEqual(actual: actual, expected: expected), failedMsg)
        assertElementEqual(actual, expected)
    }

    func elementEqual(actual: [[String]], expected: [[String]]) -> Bool {
        // 对二维数组中的一维数组进行排序后，判断数组元素是否相等
        let actualSet = Set(actual.map({$0.sorted()}))
        let expectedSet = Set(expected.map({$0.sorted()}))
        return actualSet == expectedSet
    }

    func assertElementEqual<Item: Hashable & Comparable>(_ actual: [[Item]], _ expected: [[Item]]) {
        let actualSet = Set(actual.map({$0.sorted()}))
        let expectedSet = Set(expected.map({$0.sorted()}))
        let msgIfFailed = "The element of (\"\(actual)\") is not equal to (\"\(expected)\")"
        XCTAssert(actualSet == expectedSet, msgIfFailed)
    }
}
