//
//  117_Populating Next Right Pointers in Each Node 2.swift
//  BakJoon
//
//  Created by 김성준 on 1/24/24.
//

import Foundation

func connect2(_ root: ConnecTreeNode?) -> ConnecTreeNode? {
    guard let node = root else {
        return nil
    }
    
    var queue = [node]
    var tempQueue: [ConnecTreeNode] = []
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        tempQueue += [node.left, node.right].compactMap{$0}
        
        node.next = queue.first
        
        if queue.isEmpty {
            queue = tempQueue
            tempQueue.removeAll()
        }
    }
    
    return node
}
