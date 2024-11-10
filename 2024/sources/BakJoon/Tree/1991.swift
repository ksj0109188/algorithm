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
            let parent = BinaryTree_1991<String>.Node(val: input[0])
            var leftChild: BinaryTree_1991<String>.Node?
            var rightChild: BinaryTree_1991<String>.Node?
            let leftChildVal = input[1]
            let rightChildVal = input[2]
            
            if leftChildVal != "." {
                leftChild = .init(val: leftChildVal)
            }
            if rightChildVal != "." {
                rightChild = .init(val: rightChildVal)
            }
            
            tree.makeBinaryTree(parent: parent, leftChild: leftChild, rightChild: rightChild)
        }
        
        print(tree.preorderSearch(node: .init(val: "A")).joined())
        print(tree.inorderSearch(node: .init(val: "A")).joined())
        print(tree.postorderSearch(node: .init(val: "A")).joined())
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
    
    // Set으로 관리하는 게 내 알고리즘에서 최적화 방법인듯
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
        var answer: [T] = []
        
        if let root = nodes.first(where: {$0.val == node.val}) {
            if let leftChild = root.leftChild {
                answer += inorderSearch(node: leftChild)
            }
            
            answer.append(node.val)
            
            if let rightChild = root.rightChild {
                answer += inorderSearch(node: rightChild)
            }
        }
        
        return answer
    }
    
    //    DBEGFCA
    func postorderSearch(node: Node) -> [T] {
        var answer: [T] = []
        
        if let root = nodes.first(where: {$0.val == node.val}) {
            if let leftChild = root.leftChild {
                answer += postorderSearch(node: leftChild)
            }
            
            if let rightChild = root.rightChild {
                answer += postorderSearch(node: rightChild)
            }
            
            answer.append(node.val)
        }
        
        return answer
    }
}
