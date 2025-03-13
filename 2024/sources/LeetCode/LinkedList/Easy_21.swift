//
//  Easy_21.swift
//  BakJoon
//
//  Created by 김성준 on 3/13/25.
//

import Foundation
class Easy_21 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var list1Pointer = list1
        var list2Pointer = list2
        var node = ListNode(0)
        var dummy: ListNode? = node
        
        while list1Pointer != nil && list2Pointer != nil {
            let list1Val = list1Pointer?.val ?? 0
            let list2Val = list2Pointer?.val ?? 0
            
            if list1Val < list2Val {
                dummy?.next = ListNode(list1Val)
                list1Pointer = list1Pointer?.next
            } else {
                dummy?.next = ListNode(list2Val)
                list2Pointer = list2Pointer?.next
            }
            
            dummy = dummy?.next
        }
        
        if list1Pointer != nil {
            dummy?.next = list1Pointer
        } else if list2Pointer != nil {
            dummy?.next = list2Pointer
        }
        
        return node.next
    }
}
