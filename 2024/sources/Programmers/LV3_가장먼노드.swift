//
//  LV3_가장먼노드.swift
//  BakJoon
//
//  Created by 김성준 on 6/19/24.
//

import Foundation

class LV3_가장먼노드 {
    func solution(_ n:Int, _ edge:[[Int]]) -> Int {
        var graph: [Int : [Int]] = [:]
        var visited: [Bool] = [Bool](repeating: false, count: n + 1)
        var result = [Int](repeating: 0, count: n + 1)
        
        for vertex in edge {
            graph[vertex[0] , default: []].append(vertex[1])
            graph[vertex[1] , default: []].append(vertex[0])
        }
        
        print(graph)
        
        var queue: [(Int, Int)] = [(1, 0)]
        visited[1] = true
        
        while !queue.isEmpty {
            let item = queue.removeFirst()
            let currentVertex = item.0
            let currentValue = item.1
            result[currentValue] += 1
            
            for nextVertex in graph[currentVertex]! {
                if !visited[nextVertex] {
                    queue.append((nextVertex, currentValue + 1))
                    visited[nextVertex] = true
                }
            }
        }
        
        return result[result.lastIndex(where: {$0 != 0})!]
    }
}
