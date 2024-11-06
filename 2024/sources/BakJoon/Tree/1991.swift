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
        
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ")
        }
    }
}

final class BinaryTree_1991<T> where T: Equatable {
    final class Node {
        let val: T
        var leftChild: Node?
        var rightChild: Node?
        var parent: Node?
        
        init(val: T) {
            self.val = val
        }
    }
    
    let rootNode: Node
        
    init(root : Node) {
        self.rootNode = root
    }
    
    func makeBinaryTree(parent: Node, left : Node?, right: Node?) {
        
    }
    
    private func findRoot(node: Node) {
        
    }
    
    func preorderSearch() {
        
    }
    
    func inorderSearch() {
        
    }
    
    func postorderSearch() {
        
    }
}
