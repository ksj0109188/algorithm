//
//  Medium_138.swift
//  BakJoon
//
//  Created by 김성준 on 3/13/25.
//

import Foundation

//class Medium_138 {
//    func copyRandomList(_ head: Node?) -> Node? {
//        // key: originNode, value: copiedNode
//        var mappedTable: [Node:Node?] = [:]
//
//        var pointer = head
//        var node = Node(0)
//        var dummy: Node? = node
//
//        while pointer != nil {
//            dummy?.next = Node(pointer!.val)
//            dummy?.next?.random = pointer?.random
//
//            mappedTable[pointer!, default: nil] = dummy?.next
//            dummy = dummy?.next
//            pointer = pointer?.next
//        }
//
//        dummy = node.next
//
//        while dummy != nil {
//            if let random = dummy?.random {
//                dummy?.random = mappedTable[random] ?? nil
//            }
//          
//            dummy = dummy?.next
//        }
//
//        return node.next
//    }
//}
