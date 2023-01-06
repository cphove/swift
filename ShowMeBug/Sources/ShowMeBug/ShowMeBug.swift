// 可以引⼊的库和版本相关请参考 “环境说明”
// 请勿更改 `ShowMeBug` 类名以防执⾏失败

class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class ShowMeBug {
    /**
     * - Parameters:
     *   - head: 链表的头节点
     * - Returns: 链表的头节点
     */
    func reverseList(_ head: ListNode?) -> ListNode? {
        // 在这⾥写代码
        var current = head
        var prev: ListNode?
        var next: ListNode?
        while current != nil {
            next = current?.next
            current?.next = prev
            prev = current
            current = next?.next
        }
        return prev
    }
}