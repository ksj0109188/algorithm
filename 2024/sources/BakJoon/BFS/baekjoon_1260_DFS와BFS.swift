//
//  baekjoon_1260_DFS와BFS.swift
//  BakJoon
//
//  Created by 김성준 on 9/9/24.
//

import Foundation

class baekjoon_1260_DFS와BFS {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let _ = input[0]
        let m = input[1]
        let v = input[2]
        
        
        var graph: [Int:[Int]] = [:]
        
        for _ in 0..<m {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let source = input[0]
            let target = input[1]
            
            graph[source, default: []].append(target)
            graph[target, default: []].append(source)
        }
        
        for (key, value) in graph {
            graph[key] = value.sorted(by: <)
        }
        

        var visisted = Set<Int>()
        
        print(dfs(v, graph, &visisted).map{String($0)}.joined(separator: " "))
        print(bfs(v, graph).map{String($0)}.joined(separator: " "))
    }
    
    func dfs(_ node: Int, _ graph: [Int:[Int]], _ visited: inout Set<Int>) -> [Int] {
        var result = [node]
        visited.insert(node)
        
        for next in graph[node, default: []] {
            if !visited.contains(next) {
                result += dfs(next, graph, &visited)
            }
        }
        
        return result
    }
    
    func bfs(_ start: Int, _ graph: [Int:[Int]]) -> [Int] {
        var queue = [start]
        var result: [Int] = []
        var visited = Set<Int>()
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if !visited.contains(node) {
                visited.insert(node)
                result.append(node)
                
                queue += graph[node, default: []]
            }
        }
        
        return result
    }
    
    
}
