//
//  Dijkstra.swift
//  BakJoon
//
//  Created by 김성준 on 3/2/24.
//



import Foundation

class Graph {
    var adjList: [[(Int, Int)]] // (destination, weight)
    var V: Int

    init(vertices V: Int) {
        self.V = V
        adjList = Array(repeating: [], count: V)
    }

    func addEdge(from u: Int, to v: Int, weight: Int) {
        adjList[u].append((v, weight))
    }

    func dijkstra(source s: Int) -> [Int] {
        var dist = Array(repeating: Int.max, count: V)
        dist[s] = 0
        
        // 우선순위 큐 대신 최소힙 사용
        var pq = [(Int, Int)]() // (거리, 정점)
        pq.append((0, s))
        
        while !pq.isEmpty {
            pq.sort { $0.0 < $1.0 } // 최소힙 정렬
            let (currentDist, u) = pq.removeFirst()
            
            // 이미 더 짧은 경로가 존재하면 스킵
            if currentDist > dist[u] { continue }
            
            for (v, weight) in adjList[u] {
                let newDist = currentDist + weight
                
                if newDist < dist[v] {
                    dist[v] = newDist
                    pq.append((newDist, v))
                }
            }
        }
        
        return dist
    }
}

//// Example usage
//let graph = Graph(vertices: 5)
//graph.addEdge(from: 0, to: 1, weight: 10)
//graph.addEdge(from: 0, to: 2, weight: 3)
//graph.addEdge(from: 1, to: 2, weight: 1)
//graph.addEdge(from: 2, to: 1, weight: 4)
//graph.addEdge(from: 1, to: 3, weight: 2)
//graph.addEdge(from: 2, to: 3, weight: 8)
//graph.addEdge(from: 3, to: 4, weight: 7)
//
//let distances = graph.dijkstra(source: 0)



