//
//  1967.swift
//  BakJoon
//
//  Created by 김성준 on 12/1/24.
//

import Foundation

class 트리의지름_1967 {
    func solution() {
        let n = Int(readLine()!)!
        var graph: [Int: [(child: Int, weight:Int)]] = [:]
        var answer: Int = 0
        
        for _ in 0..<n - 1{
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let parent = input[0]
            let child = input[1]
            let weight = input[2]
            
            graph[parent, default: []].append((child: child, weight: weight))
        }
        
        dfs(parent: 1)

        print(answer)
        
        func dfs(parent: Int) -> Int {
            guard let nextNodes = graph[parent] else { return 0 }
            
            var weights: [Int] = []
            
            for next in nextNodes {
                // 모든 자식들을 더하는 게 아닌 가장 긴 것과 그 다음 큰것을 비교
                weights += [dfs(parent: next.child) + next.weight]
            }
            
            answer = max(weights.reduce(0) { $0 + $1 }, answer) // 자식들 노드의 누적된 경로를 비교
            
            return weights.max() ?? 0 // 누적된 자식들중 가장 큰값과 현재 경로의 가중치를 더해 return
        }
    }
}

class 트리의지름2_1967 {
    func solution() {
        let n = Int(readLine()!)!
        var graph: [Int: [(child: Int, weight:Int)]] = [:]
        var maxDiameter = 0
        
        for _ in 0..<n - 1{
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let parent = input[0]
            let child = input[1]
            let weight = input[2]
            
            graph[parent, default: []].append((child: child, weight: weight))
        }
        
        func dfs(parent: Int) -> Int {
            guard let nextNodes = graph[parent] else { return 0 }
            
            var maxPath1 = 0
            var maxPath2 = 0
            
            for next in nextNodes {
                let childPath = dfs(parent: next.child) + next.weight
                
                if childPath > maxPath1 {
                    maxPath2 = maxPath1
                    maxPath1 = childPath
                } else if childPath > maxPath2 {
                    maxPath2 = childPath
                }
            }
            
            // 현재 노드를 거치는 지름 계산
            maxDiameter = max(maxDiameter, maxPath1 + maxPath2)
            
            // 가장 긴 경로 반환
            return maxPath1
        }
        
        _ = dfs(parent: 1)
        print(maxDiameter)
    }
}
