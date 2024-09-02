//
//  baekjoon_10451.swift
//  BakJoon
//
//  Created by 김성준 on 3/21/24.
//

import Foundation

final class baekjun10451 {
    func solve() {
        var edges: [Int] = []
        let t = Int(readLine()!)!
        
        for _ in 0..<t {
            let n = Int(readLine()!)!
            edges = [0] + readLine()!.split(separator: " ").map{ Int($0)! }
            
            var visited = Array(repeating: false, count: edges.count)
            var result = 0
            for i in 1..<edges.count {
                if !visited[i] {
                    isCycle(i, edges, &visited)
                    result += 1
                }
            }
            print(result)
        }
    }
    
    func isCycle(_ index: Int, _ edges: [Int], _ visited: inout [Bool]) {
        var queue = [index]
        visited[index] = true
        
        while !queue.isEmpty {
            let edge = queue.removeFirst()
            let nextEdge = edges[edge]
            
            if !visited[nextEdge] {
                visited[nextEdge] = true
                queue.append(nextEdge)
            }
        }
    }
    
}
