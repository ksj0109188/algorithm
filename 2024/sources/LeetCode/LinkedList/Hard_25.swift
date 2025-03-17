//
//  Hard_25.swift
//  BakJoon
//
//  Created by 김성준 on 3/17/25.
//

import Foundation

class Hard_25 {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var count = 1
        var dummy = head
        var start = head

        while dummy != nil {
            if count == k {
//                reverse(start, dummy!)
//                start = dummy.next
            }

            dummy = dummy?.next
        }

        return dnummy

    }

    private func reverse(_ prevStart: ListNode, _ k: Int) -> ListNode {
        var start = prevStart.next
        var then = start?.next

        for _ in 0..<k {
            start?.next = then?.next
            then?.next =
            prevStart = then
            then = start?.next
        }
    }
}
