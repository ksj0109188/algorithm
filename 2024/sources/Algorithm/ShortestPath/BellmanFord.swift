//
//  BellmanFord.swift
//  BakJoon
//
//  Created by 김성준 on 4/15/24.
//

import Foundation

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
    
    
    // Example usage
//    let graph = [(u: 0, v: 1, weight: -1), (u: 1, v: 2, weight: -2), (u: 2, v: 0, weight: -3)]
//    let vertices = 3
//    let source = 0
//
//    let distances = bellmanFord(graph: graph, vertices: vertices, source: source)
//
//    if !distances.isEmpty {
//        for (index, distance) in distances.enumerated() {
//            print("Distance from node \(source) to node \(index) is \(distance)")
//        }
//    }
}
