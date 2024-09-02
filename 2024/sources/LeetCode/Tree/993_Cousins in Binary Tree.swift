//
//  993_Cousins in Binary Tree.swift
//  BakJoon
//
//  Created by 김성준 on 1/23/24.
//

import Foundation

func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
    guard let node = root else {
        return false
    }
    let depth = 0
    var queue = [(node,depth)]
    
    while !queue.isEmpty {
        _ = queue.removeFirst()
        
    }
    return false
}
