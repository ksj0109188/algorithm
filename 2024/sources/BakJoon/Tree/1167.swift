//
//  1167.swift
//  BakJoon
//
//  Created by 김성준 on 12/15/24.
//

import Foundation

final class 트리의지름_1167_오답 {
    var result = 0
    
    func solution() {
        let v = Int(readLine()!)!
        var graph: [Int: [(to: Int, weight: Int)]] = [:]
        
        for _ in 0..<v {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            
            guard input.count > 2 else { continue }
            
            let from = input[0]
            var index = 1
            var to = -1
            var weight = -1
            
            while true {
                guard input[index] != -1 else { break }
                
                if index % 2 == 0 {
                    weight = input[index]
                    graph[from, default: []].append((to: to, weight: weight))
                    index += 1
                } else {
                    to = input[index]
                    index += 1
                }
            }
        }
        
        var isVisisted = [Bool](repeating: false, count: v + 1)
        isVisisted[1] = true
        _ = dfs(tree: graph, start: 1, isVisited: &isVisisted)
        
        print(result)
    }
    
    private func dfs(tree: [Int: [(to: Int, weight: Int)]], start: Int, isVisited: inout [Bool]) -> Int {
        guard let nodes = tree[start] else { return 0 }
        
        var maxValue1 = 0
        var maxValue2 = 0
        
        for node in nodes {
            let nextNode = node.to
            let nextWeight = node.weight
            
            guard !isVisited[nextNode] else { continue }
            isVisited[nextNode] = true
            
            let childWeight = dfs(tree: tree, start: nextNode, isVisited: &isVisited) + nextWeight
            
            if maxValue1 < childWeight {
                maxValue2 = maxValue1
                maxValue1 = childWeight
            } else if maxValue2 < nextWeight {
                maxValue2 = childWeight
            }
        }
        
        result = max(result, maxValue1 + maxValue2)
        
        return maxValue1
    }
    
}


final class 트리의지름_1167 {
    func solution() {
        let v = Int(readLine()!)!
        var tree: [Int: [(to: Int, weight: Int)]] = [:]
        
        for _ in 0..<v {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            
            guard input.count > 2 else { continue }
            
            let from = input[0]
            var index = 1
            var to = -1
            var weight = -1
            
            while true {
                guard input[index] != -1 else { break }
                
                if index % 2 == 0 {
                    weight = input[index]
                    tree[from, default: []].append((to: to, weight: weight))
                    index += 1
                } else {
                    to = input[index]
                    index += 1
                }
            }
        }
        
        // 첫 번째 DFS로 가장 먼 노드 찾기
        var isVisited = [Bool](repeating: false, count: v + 1)
        isVisited[1] = true
        let (farthestNode, _) = dfs(tree: tree, start: 1, isVisited: &isVisited)
        
        // 두 번째 DFS로 트리의 지름 계산
        isVisited = [Bool](repeating: false, count: v + 1)
        isVisited[farthestNode] = true
        let (_, diameter) = dfs(tree: tree, start: farthestNode, isVisited: &isVisited)
        
        print(diameter)
    }
    
    private func dfs(tree: [Int: [(to: Int, weight: Int)]], start: Int, isVisited: inout [Bool]) -> (Int, Int) {
        guard let nodes = tree[start] else { return (start, 0) }
        
        var maxNode = start
        var maxLength = 0
        
        for node in nodes {
            let nextNode = node.to
            let nextWeight = node.weight
            
            guard !isVisited[nextNode] else { continue }
            isVisited[nextNode] = true
            
            let (subNode, subLength) = dfs(tree: tree, start: nextNode, isVisited: &isVisited)
            let currentLength = subLength + nextWeight
            
            if currentLength > maxLength {
                maxLength = currentLength
                maxNode = subNode
            }
        }
        
        return (maxNode, maxLength)
    }
}
