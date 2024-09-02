//
//  965_Unvalued Binary Tree.swift
//  BakJoon
//
//  Created by 김성준 on 1/18/24.
//

import Foundation

func isUnivalTree(_ root: TreeNode?) -> Bool {
    guard let node = root else {
        return false
    }
    
    var queue: [TreeNode?] = [node]
    var result: [Bool] = []
    while !queue.isEmpty {
        guard !result.contains(where: { $0 == false }) else {
            break
        }
        let node = queue.removeFirst()!
        let childNodes = [node.left, node.right].compactMap{ $0 }
        queue +=  childNodes
        
        result += childNodes.map { $0.val != node.val ? false : true }
        
    }
    
    return result.filter{ $0 == false }.isEmpty
    
}

