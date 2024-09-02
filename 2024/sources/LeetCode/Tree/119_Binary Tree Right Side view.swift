//
//  119_Binary Tree Right Side view.swift
//  BakJoon
//
//  Created by 김성준 on 1/24/24.
//

import Foundation

func rightSideView(_ root: TreeNode?) -> [Int] {
    guard let node = root else {
        return []
    }
    
    var result = [node.val]
    var queue = [node]
    var tempQueue: [TreeNode] = []
    
    while !queue.isEmpty {
        var node = queue.removeFirst()
        tempQueue += [node.left, node.right].compactMap{$0}
        
        if queue.isEmpty {
            if let lastNode = tempQueue.last{
                result.append(lastNode.val)
            }
            queue = tempQueue
            tempQueue.removeAll()
        }
    }
    
    return result
}
