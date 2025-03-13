//
//  Medium_2.swift
//  BakJoon
//
//  Created by 김성준 on 3/13/25.
//

import Foundation

class Medium_2 {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        //First 각 왼쪽 노드들을 추출한다
        var l1Pointer = l1
        var l2Pointer = l2
        var resultNode = ListNode(0)
        var resultDummy: ListNode? = resultNode
        var carry = 0
        
        while l1Pointer != nil || l2Pointer != nil || carry > 0 {
            let l1Val = l1Pointer?.val ?? 0
            let l2Val = l2Pointer?.val ?? 0
            var sum = l1Val + l2Val + carry
            
            carry = sum / 10
            resultDummy?.next = ListNode(sum % 10)
            resultDummy = resultDummy?.next
            l1Pointer = l1Pointer?.next
            l2Pointer = l2Pointer?.next
        }
        
        return resultNode.next
    }
}
