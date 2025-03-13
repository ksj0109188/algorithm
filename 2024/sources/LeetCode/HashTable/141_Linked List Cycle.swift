//
//  141_Linked List Cycle.swift
//  BakJoon
//
//  Created by 김성준 on 2/2/24.
//

import Foundation

public class ListNode {
    public var val: Int = 0
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
 

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head?.next
        
        while fast != nil && fast?.next != nil {
            if slow === fast {
                return true
            }
            slow = slow?.next
            fast = fast?.next?.next
        }
        return false
    }
}


func findDuplicate(_ nums: [Int]) -> Int {
     // 사이클 찾기
     var tortoise = nums[0]
     var hare = nums[0]
     repeat {
         tortoise = nums[tortoise]
         hare = nums[nums[hare]]
     } while tortoise != hare
     
     // 사이클의 시작점 찾기
     tortoise = nums[0]
     while tortoise != hare {
         tortoise = nums[tortoise]
         hare = nums[hare]
     }
     
     return hare
 }

