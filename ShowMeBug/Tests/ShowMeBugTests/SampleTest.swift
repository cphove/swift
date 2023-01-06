// 将使⽤ XCTest 执⾏测试

import XCTest
@testable import ShowMeBug

final class SampleTest: XCTestCase {

    /*
    #start
    #name[测试用例1]
    #input[a = 1, b = 2]
    #expected[expected = 3]
    #end
     */
    func testSolution1() throws {
        let expected: Int = 3
        let a: Int = 1
        let b: Int = 2
        XCTAssertEqual(ShowMeBug().solution(a, b), expected)
    }
}