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
        let target: String = "cphx"
        // XCTAssertTrue failed -
        // XCTAssertTrue(ShowMeBug().find(strs, target))
        // 推荐使用 XCTAssertEqual，XCTAssertEqual failed: ("false") is not equal to ("true")
        XCTAssertEqual(ShowMeBug().find(strs, target), true)
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
        // XCTAssertEqual(actual.sorted(), expected.sorted())
        assertOnlyArrayElementEqual(actual, expected)
    }

    func testOnlyElementEqualString() throws {
        let expected: [String] = ["lcy", "zzy", "wjc", "cph"]
        let actual: [String] = ["zzy", "cph", "lcy", "wjc"]
        XCTAssertEqual(actual.sorted(), expected.sorted())
    }

    func testOnlyElementEqualTDArray() throws {
        let expected: [[String]] = [
            ["3", "1", "2"],
            ["1", "4", "6"],
        ]
        let actual: [[String]] = [
            ["1", "6", "4"],
            ["3", "2", "1"],
        ]
        // suggest this
        // XCTAssertTrue failed - The element of ("[["1", "6", "4"], ["3", "2", "11"]]") is not equal to ("[["3", "1", "2"], ["1", "4", "6"]]")
        assertOnlyArrayElementEqual(actual, expected)

        // XCTAssertEqual failed: ("[["11", "2", "3"], ["1", "4", "6"]]") is not equal to ("[["1", "2", "3"], ["1", "4", "6"]]") - The element 
        // of ("[["1", "6", "4"], ["3", "2", "11"]]") is not equal to ("[["3", "1", "2"], ["1", "4", "6"]]")
        // assertOnlyElementEqual(actual, expected)
    }

    func testGetFloatArray() throws {
        let expected: [Float] = [1.1, 2.2, 3.3, 4.4]
        let n: Int = 5
        let start: Float = 1.1
        // 直接断言相等会失败
        // XCTAssertEqual failed: ("[1.1, 2.2, 3.3000002, 4.4, 5.5]") is not equal to ("[1.1, 2.2, 3.3, 4.4, 5.5]")
        // XCTAssertEqual(ShowMeBug().getFloatArray(n, start), expected)
        
        // 正确做法 （ [Double]类型类似 ）
        // let accuracy: Float = 0.001
        // let actual = ShowMeBug().getFloatArray(n, start)
        // let equalOrNot = zip(actual, expected).allSatisfy({abs($0 - $1) <= accuracy})
        // let msgIfFailed = "(\"\(actual)\") is not equal to (\"\(expected)\")"
        // XCTAssert(equalOrNot, msgIfFailed)

        // 推荐封装成一个方法，如
        assertFloatArrayEqual(ShowMeBug().getFloatArray(n, start), expected, accuracy: 0.001)
    }

    func testTwoDemDoubleArrayEqual() throws {
        let expected: [[Double]] = [
            [1.0, 2.0, 3.0],
            [4.0, 5.0, 6.0],
        ]
        let actual: [[Double]] = [
            [1.000001, 2.0, 3.0],
            [4.0, 5.0, 6.000002]
        ]
        assertDoubleArrayEqual(actual, expected, accuracy: 0.001)
    }

    func elementEqual(actual: [[String]], expected: [[String]]) -> Bool {
        // 对二维数组中的一维数组进行排序后，判断数组元素是否相等
        let actualSet = Set(actual.map({$0.sorted()}))
        let expectedSet = Set(expected.map({$0.sorted()}))
        return actualSet == expectedSet
    }

    // 仅断言两个一维数组中的元素是否相同
    func assertOnlyArrayElementEqual<Item: Hashable & Comparable>(_ actual: [Item], _ expected: [Item]) {
        let msgIfFailed = "The element of (\"\(actual)\") is not equal to (\"\(expected)\")"
        XCTAssert(actual.count == expected.count, msgIfFailed)
        XCTAssert(actual.sorted() == expected.sorted(), msgIfFailed)
    }

    // 仅断言两个二维数组中的一维数组的元素是否相同
    func assertOnlyArrayElementEqual<Item: Hashable & Comparable>(_ actual: [[Item]], _ expected: [[Item]]) {
        let msgIfFailed = "The element of (\"\(actual)\") is not equal to (\"\(expected)\")"
        XCTAssert(actual.count == expected.count, msgIfFailed)
        let actualSet = Set(actual.map({$0.sorted()}))
        let expectedSet = Set(expected.map({$0.sorted()}))
        XCTAssert(actualSet == expectedSet, msgIfFailed)
    }

    // 仅断言两个二维数组中的一维数组的元素是否相同
    func assertOnlyElementEqual<Item: Hashable & Comparable>(_ actual: [[Item]], _ expected: [[Item]]) {
        let actualSet = Set(actual.map({$0.sorted()}))
        let expectedSet = Set(expected.map({$0.sorted()}))
        let msgIfFailed = "The element of (\"\(actual)\") is not equal to (\"\(expected)\")"
        // 断言失败信息会输出 Set 不相等的信息和自定义的失败信息
        // 推荐使用 XCTAssert 或 XCTAssertTrue，断言失败时会输出 Set 不相等的信息
        XCTAssertEqual(actualSet, expectedSet, msgIfFailed)
    }

    // 断言两个 Float 类型数组每个元素是否在一定精度下相等
    func assertFloatArrayEqual(_ actual: [Float], _ expected: [Float], accuracy: Float) {
        let msgIfFailed = "(\"\(actual)\") is not equal to (\"\(expected)\")"
        XCTAssert(actual.count == expected.count, msgIfFailed)
        let equalOrNot = zip(actual, expected).allSatisfy({abs($0 - $1) <= accuracy})
        XCTAssert(equalOrNot, msgIfFailed)
    }

    // 断言两个 Double 类型数组每个元素是否在一定精度下相等
    func assertDoubleArrayEqual(_ actual: [Double], _ expected: [Double], accuracy: Double) {
        let msgIfFailed = "(\"\(actual)\") is not equal to (\"\(expected)\")"
        XCTAssert(actual.count == expected.count, msgIfFailed)
        let equalOrNot = zip(actual, expected).allSatisfy({abs($0 - $1) <= accuracy})
        XCTAssert(equalOrNot, msgIfFailed)
    }

    func assertDoubleArrayEqual(_ actual: [[Double]], _ expected: [[Double]], accuracy: Double) {
        let msgIfFailed = "(\"\(actual)\") is not equal to (\"\(expected)\")"
        XCTAssert(actual.count == expected.count, msgIfFailed)
        for i in 0..<expected.count {
            XCTAssert(actual[i].count == expected[i].count, msgIfFailed)
            let equalOrNot = zip(actual[i], expected[i]).allSatisfy({abs($0 - $1) <= accuracy})
            XCTAssert(equalOrNot, msgIfFailed)
        }  
    }
}
