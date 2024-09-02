//
//  TreeNode.swift
//  BakJoon
//
//  Created by 김성준 on 1/18/24.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
    
    public init(_ items: [Int?]) {
        var items = items
        guard let node = items.removeFirst() else {
            self.val = 0
            return
        }
        
        self.val = node
        var queue = [self]
        
        while !items.isEmpty {
            let node = queue.removeFirst()
            
            if node.left == nil, let val = items.removeFirst() {
                let leftNode = TreeNode(val)
                node.left = leftNode
                queue.append(leftNode)
            }
            if node.right == nil, let val = items.removeFirst() {
                let rightNode = TreeNode(val)
                node.right = rightNode
                queue.append(rightNode)
            }
        }
    }
}
