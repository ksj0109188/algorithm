//
//  ACM_Craft.swift
//  BakJoon
//
//  Created by 김성준 on 1/26/25.
//

import Foundation

class ACMCraft {
    func solution() {
        let t = Int(readLine()!)!
        
        for _ in 0..<t {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let (n, k) = (input[0], input[1])
            var costs = readLine()!.split(separator: " ").map{ Int($0)! }
            costs.insert(0, at: 0)
            var graphs: [Int: [Int]] = [:]
            var inDegrees: [Int] = .init(repeating: 0, count: n + 1)
            var queue: [Int] = []
            var timeRequired = costs

            for _ in 0..<k {
                let input = readLine()!.split(separator: " ").map{ Int($0)! }
                let (from, to) = (input[0], input[1])
                
                graphs[from, default: []].append(to)
                inDegrees[to] += 1
            }
            
            let w = Int(readLine()!)!
            
            for (index, value) in inDegrees.enumerated() {
                if value == 0 {
                    queue.append(index)
                    timeRequired[index] = costs[index]
                }
            }
            
            while !queue.isEmpty {
                // 처음, indegree가 0, w가 완료시 -> 3케이스 각각 결과시간을 축적해야함.
                let from = queue.removeFirst()
                
                for to in graphs[from] ?? [] {
                    inDegrees[to] -= 1
                    timeRequired[to] = max(timeRequired[to], timeRequired[from] + costs[to])
                    
                    if inDegrees[to] <= 0 {
                        queue.append(to)
                    }
                }
            }
            
            print(timeRequired[w])
        }
    }
}

class Review_acmcraft {
    func exec() {
        let T = Int(readLine()!)!
        
        for _ in 0..<T {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let (n, k) = (input[0], input[1])
            
            let times = [0] + readLine()!.split(separator: " ").map{ Int($0)! }
            var graph: [Int: [Int]] = [:]
            var inDegress: [Int] = .init(repeating: 0, count: n + 1)
            var costs: [Int] = .init(repeating: 0, count: n + 1)
            //MARK: 규칙
            for _ in 0..<k {
                let input = readLine()!.split(separator: " ").map{ Int($0)! }
                let (from, to) = (input[0], input[1])
                
                graph[from, default: []].append(to)
                inDegress[to] += 1
            }
            
            let target = Int(readLine()!)!
            var queue: [Int] = []
            
            for (index, value) in inDegress.enumerated() {
                if value == 0 && index != 0 {
                    queue.append(index)
                    costs[index] = times[index]
                }
            }
            
            // 진입차수가 0인 것만 작업이 가능하다.
            while !queue.isEmpty {
                let current = queue.removeLast()
                
                for next in graph[current] ?? [] {
                    inDegress[next] -= 1
                    costs[next] = max(costs[next], costs[current] + times[next])
                    
                    if inDegress[next] <= 0 {
                        queue.append(next)
                    }
                }
            }
            
            print(costs[target])
        }
    }
    
    
}
