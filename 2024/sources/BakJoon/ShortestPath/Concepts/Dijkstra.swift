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
        var visited = Array(repeating: false, count: V)

        dist[s] = 0

        for _ in 0..<V {
            let u = minDistance(dist, visited)
            visited[u] = true

            for edge in adjList[u] {
                let v = edge.0
                let weight = edge.1

                if !visited[v] && dist[u] != Int.max && dist[u] + weight < dist[v] {
                    dist[v] = dist[u] + weight
                }
            }
        }

        return dist
    }

    private func minDistance(_ dist: [Int], _ visited: [Bool]) -> Int {
        var min = Int.max, minIndex = 0

        for v in 0..<V {
            if !visited[v] && dist[v] <= min {
                min = dist[v]
                minIndex = v
            }
        }

        return minIndex
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



