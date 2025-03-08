//
//  Medium_427.swift
//  BakJoon
//
//  Created by 김성준 on 3/7/25.
//

import Foundation




//class Medium_427 {
    /**
     * Definition for a QuadTree node.
     * public class Node {
     *     public var val: Bool
     *     public var isLeaf: Bool
     *     public var topLeft: Node?
     *     public var topRight: Node?
     *     public var bottomLeft: Node?
     *     public var bottomRight: Node?
     *     public init(_ val: Bool, _ isLeaf: Bool) {
     *         self.val = val
     *         self.isLeaf = isLeaf
     *         self.topLeft = nil
     *         self.topRight = nil
     *         self.bottomLeft = nil
     *         self.bottomRight = nil
     *     }
     * }
     */
//    func construct(_ grid: [[Int]]) -> Node? {
//        // let node = makeNode(grid, grid.count, 0, 0)
//        // nodeDebug(node)
//
//        return makeNode(grid, grid.count, 0, 0)
//    }

//    private func nodeDebug(_ node: Node?) {
//        guard let node = node else { return }
//        
//        if node.isLeaf {
//            print("1, \(node.val)")
//        } else {
//            print("0, \(node.val)")
//            nodeDebug(node.topLeft)
//            nodeDebug(node.topRight)
//            nodeDebug(node.bottomLeft)
//            nodeDebug(node.bottomRight)
//        }
//    }

//    private func makeNode(_ grid: [[Int]], _ size: Int, _ startX: Int, _ startY: Int) -> Node? {
//        guard size > 0 else { return nil }
//    
//        var prevVal = grid[startX][startY]
//        var node = Node(prevVal == 0 ? false : true, true)
//        var isBreak = false
//
//        for i in startX..<startX + size {
//            if isBreak { break }
//            for j in startY..<startY + size {
//                if grid[i][j] != prevVal {
//                    node.isLeaf = false
//                    isBreak = true
//                    break
//                }
//                if i == startX + size - 1 && j == startY + size - 1 { return node }
//            }
//        }
//        
//        let halfSize = size / 2
//        node.topLeft = makeNode(grid, halfSize, startX, startY)
//        node.topRight = makeNode(grid, halfSize, startX, startY + halfSize)
//        node.bottomLeft = makeNode(grid, halfSize, startX + halfSize, startY)
//        node.bottomRight = makeNode(grid, halfSize, startX + halfSize, startY + halfSize)
//
//        return node
//    }
//}
