//
//  116_Populating_Next_Right.swift
//  BakJoon
//
//  Created by 김성준 on 1/23/24.
//

import Foundation

func connect(_ root: ConnecTreeNode?) -> ConnecTreeNode? {
    guard let node = root else {
        return nil
    }
    
    var queue = [node.left, node.right]
    var tempQueue: [ConnecTreeNode] = []
    
    while !queue.isEmpty {
        let leftNode = queue.removeFirst()
        let rightNode = queue.removeFirst()
        
        leftNode?.next = rightNode
        
        if !queue.isEmpty {
            rightNode?.next = queue[0]
        } else {
            rightNode?.next = nil
        }
        
        tempQueue += [leftNode?.left, leftNode?.right].compactMap{$0}
        tempQueue += [rightNode?.left, rightNode?.right].compactMap{$0}
        
        print([leftNode?.left, leftNode?.right].compactMap{$0})
//
//        tempQueue += [leftNode, rightNode].flatMap { [$0?.left, $0?.right] }.compactMap { $0 }
//        tempQueue += [rightNode, rightNode].flatMap{[$0?.left, $0?.right]}.compactMap{$0}
//        print([leftNode, rightNode].flatMap { [$0?.left, $0?.right] })
        if queue.isEmpty {
            queue = tempQueue
            tempQueue.removeAll()
        }
    }
    
    return node
}



