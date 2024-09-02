//
//  559_Maximum Depth of N-ary Tree.swift
//  BakJoon
//
//  Created by 김성준 on 1/16/24.
//

import Foundation

//public class Node {
//     public var val: Int
//     public var children: [Node]
//     public init(_ val: Int) {
//         self.val = val
//         self.children = []
//     }
//    
//    public init(_ items: [Int?]) {
//        var items = items
//        self.val = items.removeFirst() ?? 0
//        self.children = []
//        
//        if !items.isEmpty { items.removeFirst() }
//        
//        var splitedByNil = items.split(omittingEmptySubsequences: false, whereSeparator: { $0 == nil })
//        var queue = [self]
//        
//        while !queue.isEmpty {
//            let node = queue.removeFirst()
//            if splitedByNil.isEmpty { continue }
//            for item in splitedByNil.removeFirst() {
//                if let item = item {
//                    let newNode = Node(item)
//                    node.children.append(newNode)
//                    queue.append(newNode)
//                }
//            }
////            while splitedByNil.first != nil {
////                let item = splitedByNil.removeFirst()
////                if let item = item {
////                    let newNode = Node(item)
////                    node.children.append(newNode)
////                    queue.append(newNode)
////                }
////            }
//        }
//        print(self)
//    }
// }
//
//func maxDepth(_ root: Node?) -> Int {
//    guard let node = root else {
//        return 0
//    }
//    let depth = 1
//    var queue = node.children.map{ ($0,depth + 1) }
//    
//    var result = 0
//    while !queue.isEmpty {
//        let traverseNode = queue.removeFirst()
//        let child = traverseNode.0.children
//        let depth = traverseNode.1
//        result = max(result, depth)
//        queue += child.map{ ($0,depth + 1) }.compactMap{$0}
//        
//    }
//    return result
//}
