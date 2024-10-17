//
//  친구비.swift
//  BakJoon
//
//  Created by 김성준 on 10/13/24.
//

import Foundation

class 친구비 {
    class UnionFind {
        var parent : [Int]
        var rank: [Int]
        
        init(size: Int) {
            self.parent = Array(0..<size)
            self.rank = .init(repeating: 0, count: size)
        }
        
        func find(path: Int) -> Int {
            if parent[path] != path {
                parent[path] = find(path: parent[path])
            }
            
            return parent[path]
        }
        
        func union(x: Int, y: Int) {
            let rootX = find(path: x)
            let rootY = find(path: y)
     
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
        
        func getGroupRoots() -> Set<Int> {
            return Set(parent)
        }
    }
    
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let n = input[0]
        let m = input[1]
        let k = input[2]
        let fees = readLine()!.split(separator: " ").map{ Int($0)! }
        let unionFind = UnionFind(size: n)
        
        for _ in 0..<m {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let x = input[0] - 1
            let y = input[1] - 1
            
            if fees[x] < fees[y] {
                unionFind.union(x: x, y: y)
            } else {
                unionFind.union(x: y, y: x)
            }
        }
        
        let groups = unionFind.getGroupRoots()
        let totalCost = groups.map{ fees[$0] }.reduce(into: 0) { $0 += $1 }
        
        if totalCost > k {
            print("Oh no")
            return
        } else {
            print(totalCost)
        }
    }
}

// GPT 풀이
import Foundation

class 친구비2 {
    class UnionFind {
        var parent : [Int]
        var rank: [Int]
        
        init(size: Int) {
            self.parent = Array(0..<size)
            self.rank = .init(repeating: 0, count: size)
        }
        
        func find(path: Int) -> Int {
            if parent[path] != path {
                parent[path] = find(path: parent[path])
            }
            return parent[path]
        }
        
        func union(x: Int, y: Int) {
            let rootX = find(path: x)
            let rootY = find(path: y)
     
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
    
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let n = input[0]
        let m = input[1]
        let k = input[2]
        let fees = readLine()!.split(separator: " ").map{ Int($0)! }
        let unionFind = UnionFind(size: n)
        
        // 친구 관계 연결
        for _ in 0..<m {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let x = input[0] - 1
            let y = input[1] - 1
            unionFind.union(x: x, y: y)
        }
        
        // 각 그룹의 루트를 찾고 최소 친구비 계산
        var minCost = [Int](repeating: Int.max, count: n)
        
        for i in 0..<n {
            let root = unionFind.find(path: i)
            minCost[root] = min(minCost[root], fees[i])  // 각 그룹의 최소 친구비 갱신
        }
        
        // 각 그룹의 최소 친구비를 더한 총 비용 계산
        let totalCost = minCost.filter { $0 != Int.max }.reduce(0, +)
        
        // 결과 출력
        if totalCost > k {
            print("Oh no")
        } else {
            print(totalCost)
        }
    }
}


//5 3 20
//30 10 20 20 30
//1 3
//2 4
//5 4
