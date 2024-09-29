//
//  숨바꼭질.swift
//  BakJoon
//
//  Created by 김성준 on 9/28/24.
//

import Foundation

struct 숨바꼭질 {
    struct Edge {
        let node: Int
        let val: Int
    }
    
    func solution() -> Int {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let n = input[0]
        let k = input[1]
        
        var queue = [Edge(node: n, val: 0)]
        var isVisited: [Bool] = [Bool](repeating: false, count: max(n, k) + 1)
        isVisited[n] = true
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            let curNode = current.node
            let curVal = current.val
            
            if curNode == k {
                return curVal
            }
            
            let nextPaths = [curNode + 1, curNode - 1, curNode * 2]
            
            for nextPath in nextPaths {
                if nextPath >= 0 && nextPath <= max(n, k) && !isVisited[nextPath] {
                    isVisited[nextPath] = true
                    queue.append(.init(node: nextPath, val: curVal + 1))
                }
            }
        }
        
        return -1
    }
}
