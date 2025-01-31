//
//  2252.swift
//  BakJoon
//
//  Created by 김성준 on 1/28/25.
//

import Foundation

class 줄세우기_2252 {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let n = input[0]
        let m = input[1]
        var result: [Int] = []
        var graph: [Int: [Int]] = [:]
        var inDegrees: [Int] = .init(repeating: 0, count: n + 1)
        
        for _ in 0..<m {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let from = input[0]
            let to = input[1]
            
            graph[from, default: []].append(to)
            inDegrees[to] += 1
        }
        
        var queue: [Int] = []
        
        for i in 1...n {
            if inDegrees[i] == 0 {
                queue.append(i)
            }
        }
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            result.append(current)
            
            for next in graph[current] ?? [] {
                inDegrees[next] -= 1
                
                if inDegrees[next] <= 0 { queue.append(next) }
            }
        }
        
        print(result.map{ String($0) }.joined(separator: " "))
    }
}

