//
//  최소스패닝트리.swift
//  BakJoon
//
//  Created by 김성준 on 9/2/24.
//

import Foundation
// https://www.acmicpc.net/problem/1197

class 최소스패닝트리 {
    class UnionFind {
        private var parent: [Int]
        private var rank: [Int] // 트리의 높이 -> 메모리 사용률 2배이므로 Weighted union find 사용
        
        init(_ n: Int) {
            parent = Array(0..<n)
            rank = Array(repeating: 0, count: n)
        }
        
        func find(_ x: Int) -> Int {
            if parent[x] != x { // 루트노드가 아니라면
                parent[x] = find(parent[x])  // Path compression
            }
            return parent[x]
        }
        
        func union(_ x: Int, _ y: Int) {
            let rootX = find(x)
            let rootY = find(y)
            
            // union by rank
            if rootX != rootY {
                if rank[rootX] < rank[rootY] {
                    parent[rootX] = rootY
                } else if rank[rootX] > rank[rootY] {
                    parent[rootY] = rootX
                } else {
                    parent[rootY] = rootX
                    rank[rootX] += 1
                }
            }
        }
    }
    
    struct Edge: Comparable {
        let from: Int
        let to: Int
        let weight: Int
        
        static func < (lhs: Edge, rhs: Edge) -> Bool {
            return lhs.weight < rhs.weight
        }
    }
    
    func kruskalMST(_ V: Int, _ edges: [(Int, Int, Int)]) -> Int {
        var unionFind = UnionFind(V + 1)  // 1-based indexing
        let sortedEdges = edges.map { Edge(from: $0.0, to: $0.1, weight: $0.2) }.sorted()
        
        var totalWeight = 0
        var edgeCount = 0
        
        for edge in sortedEdges {
            if unionFind.find(edge.from) != unionFind.find(edge.to) {
                unionFind.union(edge.from, edge.to)
                totalWeight += edge.weight
                edgeCount += 1
                
                if edgeCount == V - 1 {
                    break  // MST 완성
                }
            }
        }
        
        return totalWeight
    }
    
    func main() {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let V = input[0]
        let E = input[1]
        
        var edges: [(Int, Int, Int)] = []
        for _ in 0..<E {
            let edge = readLine()!.split(separator: " ").map { Int($0)! }
            edges.append((edge[0], edge[1], edge[2]))
        }
        print(edges)
        let result = kruskalMST(V, edges)
        print(result)
    }
}
