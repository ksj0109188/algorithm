//
//  Hard_25.swift
//  BakJoon
//
//  Created by 김성준 on 3/17/25.
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
class Hard_25 {
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var count = 1
        var dummy: ListNode? = ListNode(0)
        dummy?.next = head
        var result = dummy
        var prev: ListNode? = dummy
        
        while dummy != nil {
            if count % k == 0 {
                prev = reverse(prev, k)
                dummy = prev?.next
            } else {
                dummy = dummy?.next
            }
            
            count += 1
        }
        
        return result?.next
    }
    
    private func reverse(_ prevStart: ListNode?, _ k: Int) -> ListNode? {
        var start = prevStart?.next
        var then = start?.next
        
        for _ in 1..<k {
            start?.next = then?.next
            then?.next = prevStart?.next
            prevStart?.next = then
            then = start?.next
        }
        
        return start
    }
}
