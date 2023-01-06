// 注：未提供参考答案，该参考答案仅用于检验测试用例

// 不能重复定义 ListNode
class ShowMeBugAnswer {
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