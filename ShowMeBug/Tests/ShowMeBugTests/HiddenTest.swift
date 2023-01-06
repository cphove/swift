// 将使⽤ XCTest 执⾏测试

import XCTest
@testable import ShowMeBug

final class HiddenTest: XCTestCase {

    // 通过数组构建链表（无头节点）
    func buildList(_ arr: [Int]) -> ListNode? {
        if arr.isEmpty { return nil }
        var nxt: ListNode?
        for e in arr.reversed() {
            nxt = ListNode(e, nxt)
        }
        return nxt
    }

    // 将链表转换成对应的数组，方便断言和报错
    func listToArray(_ head: ListNode?) -> [Int] {
        var current = head
        var arr: [Int] = []
        while current != nil {
            arr.append(current!.val)
            current = current?.next
        }
        return arr
    }

    func testSolution1() throws {
        let expected: [Int] = [1, 2, 3, 1]
        let actual: ListNode? = buildList([1, 2, 3, 1])
        XCTAssertEqual(listToArray(actual), expected)
    }
}