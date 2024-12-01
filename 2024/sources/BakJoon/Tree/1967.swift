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
        
        dfs(parent: 1, currentWeight: 0)

        print(answer)
        
        func dfs(parent: Int, currentWeight: Int) -> Int {
            guard let nextNodes = graph[parent] else { return currentWeight }
            
            var weights: [Int] = []
            
            for next in nextNodes {
                weights += [dfs(parent: next.child, currentWeight: next.weight)]
            }
            
            answer = max(weights.reduce(0) { $0 + $1 }, answer) // 자식들 노드의 누적된 경로를 비교
            
            return (weights.max() ?? 0) + currentWeight // 누적된 자식들중 가장 큰값과 현재 경로의 가중치를 더해 return
        }
    }
}
