//
//  BellmanFord.swift
//  BakJoon
//
//  Created by 김성준 on 4/15/24.
//

import Foundation

class Bellman_Ford_1865 {
    func solution() {
        let tc = Int(readLine()!)!
        
        for _ in 0..<tc {
            var graph: [(from: Int, to: Int, weight: Int)] = []
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let n = input[0]
            let m = input[1]
            let w = input[2]
            
            for _ in 0..<m {
                let input = readLine()!.split(separator: " ").map{ Int($0)! }
                let s = input[0]
                let e = input[1]
                let t = input[2]
                
                graph.append((from: s, to: e, weight: t))
                graph.append((from: e, to: s, weight: t))
            }
            
            for _ in 0..<w {
                let input = readLine()!.split(separator: " ").map{ Int($0)! }
                let s = input[0]
                let e = input[1]
                let t = input[2]
                
                graph.append((from: s, to: e, weight: -t))
            }
            
            print(hasNegativeCycle(n: n, graph: graph) ? "YES" : "NO")
        }
    }
    
    func hasNegativeCycle(n: Int, graph: [(from: Int, to: Int, weight: Int)]) -> Bool {
        // 모든 노드에서 시작이 가능하므로 0으로 초기화
        var dist = [Int](repeating: 0, count: n + 1)
        
        for _ in 0..<n-1 {
            for edge in graph {
                let from = edge.from
                let to = edge.to
                let weight = edge.weight
                
                if dist[to] > dist[from] + weight {
                    dist[to] = dist[from] + weight
                }
            }
        }
        
        for edge in graph {
            let from = edge.from
            let to = edge.to
            let weight = edge.weight
            
            if dist[to] > dist[from] + weight {
                return true  // 음수 사이클 존재
            }
        }
        
        return false
    }
}

class BellmanFord {
    func bellmanFord(graph: [(u: Int, v: Int, weight: Int)], vertices: Int, source: Int) -> [Int] {
        var distance = [Int](repeating: Int.max, count: vertices)
        distance[source] = 0

        // Relax edges repeatedly
        for _ in 0..<vertices - 1 {
            for edge in graph {
                let u = edge.u
                let v = edge.v
                let weight = edge.weight
                // Int.max가 아니라면 이미 한 번은 완화를 했다는 뜻
                if distance[u] != Int.max && distance[u] + weight < distance[v] {
                    distance[v] = distance[u] + weight
                }
            }
        }

        // Check for negative-weight cycles
        for edge in graph {
            let u = edge.u
            let v = edge.v
            let weight = edge.weight

            if distance[u] != Int.max && distance[u] + weight < distance[v] {
                print("Graph contains a negative weight cycle")
                return []
            }
        }

        return distance
    }
}


