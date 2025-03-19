//
//  Medium_19.swift
//  BakJoon
//
//  Created by 김성준 on 3/19/25.
//

import Foundation

class Medium_19 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var head = head
        var dummy: ListNode? = ListNode(0)
        dummy?.next = head
        var count = 1
        var cacheTable: [Int: ListNode?] = [:]

        while dummy != nil {
            cacheTable[count, default: nil] = dummy?.next
            count += 1
            dummy = dummy?.next
        }

        if let prevTarget = cacheTable[(count - n) - 2] {
            let target = prevTarget?.next
            prevTarget?.next = target?.next
            target?.next = nil
        } else {
            head = head?.next
        }

        return head
    }
}
