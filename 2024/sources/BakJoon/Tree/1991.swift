//
//  1991.swift
//  BakJoon
//
//  Created by 김성준 on 11/6/24.
//

import Foundation

final class 트리순회_1991 {
    func solution() {
        let n = Int(readLine()!)!
        let tree = BinaryTree_1991<String>()
        
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map{ String($0) }
            let parentVal = input[0]
            let leftChildVal = input[1]
            let rightChildVal = input[2]
            
            if leftChildVal == "." && rightChildVal == "." {
                tree.makeBinaryTree(parent: .init(val: parentVal), leftChild: nil, rightChild: nil)
            } else if leftChildVal == "." {
                tree.makeBinaryTree(parent: .init(val: parentVal), leftChild: nil, rightChild: .init(val: rightChildVal))
            } else if rightChildVal == "." {
                tree.makeBinaryTree(parent: .init(val: parentVal), leftChild: .init(val: leftChildVal), rightChild: nil)
            } else {
                tree.makeBinaryTree(parent: .init(val: parentVal), leftChild: .init(val: leftChildVal), rightChild: .init(val: rightChildVal))
            }
        }
        
        print(tree.preorderSearch(node: .init(val: "A")))
        print(tree.preorderSearch(node: .init(val: "A")))
        print(tree.preorderSearch(node: .init(val: "A")))
    }
}

final class BinaryTree_1991<T> where T: Equatable {
    final class Node {
        let val: T
        var leftChild: Node?
        var rightChild: Node?
        
        init(val: T) {
            self.val = val
        }
    }
    
    var nodes: [Node] = []
    
    func makeBinaryTree(parent: Node, leftChild : Node?, rightChild: Node?) {
        if let parentIndex = nodes.firstIndex(where: {$0.val == parent.val}) {
            nodes[parentIndex].leftChild = leftChild
            nodes[parentIndex].rightChild = rightChild
        } else {
            parent.leftChild = leftChild
            parent.rightChild = rightChild
            nodes.append(parent)
        }
    }
    
    //    ABDCEFG
    func preorderSearch(node: Node) -> [T] {
        var answer: [T] = [node.val]
        
        if let root = nodes.first(where: {$0.val == node.val}) {
            if let leftChild = root.leftChild {
                answer += preorderSearch(node: leftChild)
            }
            if let rightChild = root.rightChild {
                answer += preorderSearch(node: rightChild)
            }
        }
        
        return answer
    }
    
    //    DBAECFG
    func inorderSearch(node: Node) -> [T] {
//        if let root = nodes.first(where: {$0.val == node.val}) {
//            if let leftChild = root.leftChild {
//                answer += preorderSearch(node: leftChild)
//            }
//            if let rightChild = root.rightChild {
//                answer += preorderSearch(node: rightChild)
//            }
//        }
    }
    
    //    DBEGFCA
    func postorderSearch(node: Node) -> [T] {
        
    }
}
