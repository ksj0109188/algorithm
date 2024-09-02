//
//  743_NetworkDelayTime.swift
//  BakJoon
//
//  Created by 김성준 on 3/3/24.
//

import Foundation

class Solution743 {
    struct Node: Equatable {
        let from: Int
        let to: Int
        let time: Int
        
        static func < (lhs: Node, rhs: Node) -> Bool {
            return lhs.time < rhs.time
        }
        
        static func > (lhs: Node, rhs: Node) -> Bool {
            return lhs.time > rhs.time
        }
        
        static func == (lhs: Node, rhs: Node) -> Bool {
            return lhs.time == rhs.time
        }
    }
    
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        var distance: [Int] = Array(repeating: Int.max, count: n + 1)
        distance[k] = 0
        var prioirtyQueue = GlobalPriorityQueue<Node>(compareOperator: {$0 < $1}, queue: [])
        
        let sourcePath = times.filter({ edge in
            let from = edge[0]
            return from == k
        })
        
        for path in sourcePath {
            prioirtyQueue.enqueue(value: Node(from: path[0], to: path[1], time: path[2]))
        }
        
        while !prioirtyQueue.isEmpty {
            guard let node = prioirtyQueue.dequeue() else {
                break
            }
            
            let from = node.from
            let to = node.to
            if distance[from] + node.time < distance[to] {
                distance[to] = distance[from] + node.time
                for path in times.filter({$0.first! == to}) {
                    prioirtyQueue.enqueue(value: Node(from: path[0], to: path[1], time: path[2]))
                }
            }
        }
        
        distance.removeFirst()
        
        return distance.contains(where: {$0 == Int.max}) ? -1 : distance.max(by: {$0 < $1}) ?? -1
    }
}

// Heap 클래스 없이 푼 방법
// 배열 자체에 최소값만 들어가게함 -> 힙 정렬이 필요가 없음.
class Solution743_minimumRuntime {
    func networkDelayTime(_ times: [[Int]], _ n: Int, _ k: Int) -> Int {
        let graph: [Int: [(Int, Int)]] = times.reduce(into: [:]) { $0[$1[0], default: []].append(($1[2], $1[1])) }
        var distances = Array(repeating: Int.max, count: n + 1)
        distances[k] = 0
        var heap: [(Int, Int)] = [(0, k)]
        
        while !heap.isEmpty {
            let count = heap.count

            for _ in 0..<count {
                let (currW, curr) = heap.removeFirst()

                for next in graph[curr] ?? [] {
                    let nextW = currW + next.0
                    if nextW < distances[next.1] {
                        distances[next.1] = nextW
                        heap.append((nextW, next.1))
                    }
                }
            }
        }

        let minSize = distances[1...n].max() ?? -1
        return minSize == Int.max ? -1 : minSize
    }
}

