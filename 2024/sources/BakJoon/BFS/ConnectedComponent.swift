//
//  ConnectedComponent.swift
//  BakJoon
//
//  Created by 김성준 on 9/16/24.
//

import Foundation

struct ConnectedComponent {
    func solution() {
        let input = readLine()!.split(separator: " ")
        let n = Int(input[0])!
        let m = Int(input[1])!
        
        var graph: [Int: [Int]] = [:]
        
        for _ in 0..<m {
            let input = readLine()!.split(separator: " ")
            let source = Int(input[0])!
            let target = Int(input[1])!
            
            graph[source, default: []].append(target)
            graph[target, default: []].append(source)
        }
        
        guard !graph.isEmpty else {
            print(0)
            return
        }
        
        var isVisisted: [Bool] = [Bool](repeating: false, count: n + 1)
        var result = 0
        
        for node in 1...n {
            if isVisisted[node] { continue }
            var queue = [node]
            result += 1
            isVisisted[node] = true
            
            while !queue.isEmpty {
                let target = queue.removeFirst()
                
                for edge in graph[target, default: []] {
                    if isVisisted[edge] == false {
                        isVisisted[edge] = true
                        queue.append(edge)
                    }
                }
            }
        }
        
        print(result)
    }
}
