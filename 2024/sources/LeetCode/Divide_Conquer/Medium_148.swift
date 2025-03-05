//
//  Medium_148.swift
//  BakJoon
//
//  Created by 김성준 on 3/5/25.
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

class Medium_148 {
    func sortList(_ head: ListNode?) -> ListNode? {
        return mergeSort(head)
    }

    private func getMiddle(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }

        var slow: ListNode? = head
        var fast: ListNode? = head
        var prev: ListNode? = nil

        while fast != nil && fast?.next != nil  {
            prev = slow
            slow = slow?.next
            fast = fast?.next?.next
        }

        prev?.next = nil

        return slow
    }

    private func merge(_ left: ListNode?, _ right: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var tail: ListNode? = dummy
        var l = left
        var r = right
        
        while l != nil && r != nil {
            if l!.val < r!.val {
                tail?.next = l
                l = l?.next
            } else {
                tail?.next = r
                r = r?.next
            }
            tail = tail?.next
        }

          // 남은 노드 연결
        tail?.next = l ?? r

        return dummy.next
    }

    private func mergeSort(_ head: ListNode?) -> ListNode? {
        if head == nil || head?.next == nil {
            return head
        }
        
        let mid = getMiddle(head)

        let left = mergeSort(head)
        let right = mergeSort(mid)

        return merge(left, right)
    }
}
