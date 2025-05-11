//
//  dijkstra_1238.swift
//  BakJoon
//
//  Created by 김성준 on 12/7/24.
//

import Foundation

class dijkstra_1238 {
    class PriorityQueue<T> where T: Comparable {
        var queue: [Node] = []
        let operation: (T, T) -> Bool
        
        init(operation: @escaping (T, T) -> Bool) {
            self.operation = operation
        }
        
        struct Node {
            let vertax: T
            let weight: T
        }
        
        
        func isEmpty() -> Bool {
            queue.isEmpty
        }
        
        func enQueue(vertax: T, weight: T) {
            let node = Node(vertax: vertax, weight: weight)
            queue.append(node)
            shiftUp(from: queue.count - 1)
        }
        
        func dequeue() -> (T, T)? {
            guard !queue.isEmpty else { return nil }
            
            let popedItem: (T, T)
            
            if queue.count == 1 {
                let popedNode = queue.removeFirst()
                popedItem = (popedNode.vertax, popedNode.weight)
            } else {
                queue.swapAt(0, queue.count - 1)
                let popedNode = queue.removeLast()
                
                shitDown(from: 0)
                popedItem = (popedNode.vertax, popedNode.weight)
            }
            
            return popedItem
        }
        
        private func shiftUp(from index: Int) {
            var child = index
            var parent = parentIndex(index: child)
            
            while child > 0 && operation(queue[child].weight, queue[parent].weight) {
                queue.swapAt(child, parent)
                child = parent
                parent = parentIndex(index: child)
            }
        }
        
        private func shitDown(from index: Int) {
            var parent = index
            
            while true {
                let leftChild = leftChildIndex(index: parent)
                let rightChild = rightChildIndex(index: parent)
                var candidate = parent
            
                if leftChild < queue.count && operation(queue[leftChild].weight, queue[parent].weight) {
                    candidate = leftChild
                }
                
                if rightChild < queue.count && operation(queue[rightChild].weight, queue[parent].weight) {
                    candidate = rightChild
                }
                
                
                if candidate == parent {
                    return
                }
                
                queue.swapAt(parent, candidate)
                parent = candidate
            }
        }
        
        private func parentIndex(index: Int) -> Int{
            return (index - 1) / 2
        }
        private func leftChildIndex(index: Int) -> Int {
            return index * 2 + 1
        }
        private func rightChildIndex(index: Int) -> Int {
            return index * 2 + 2
        }
    }
    
    func solution() {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let n = input[0], m = input[1], x = input[2]
        var graph: [Int: [(Int, Int)]] = [:]
        var reversedGraph: [Int: [(Int, Int)]] = [:]
        var answer = 0
        
        for i in 0..<m {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let from = input[0]
            let to = input[1]
            let weight = input[2]
            
            graph[from, default: []].append((to, weight))
            reversedGraph[to, default: []].append((from, weight))
        }
        
        // X -> 각 마을 까지 최단거리
        let dist = dijkstra(n:n, start: x, graph: graph)
        
        // 각 마을에서 -> X까지의 최단 거리
        let reversedDist = dijkstra(n:n, start: x, graph: reversedGraph)
        
        for i in 1...n {
            answer = max(answer, dist[i]+reversedDist[i])
        }
        
        print(answer)
    }
    
    private func dijkstra(n: Int, start: Int, graph:[Int: [(Int, Int)]]) -> [Int] {
        var dist: [Int] = .init(repeating: Int.max, count: n + 1)
        var pq = PriorityQueue<Int>{ $0 < $1 }
        
        dist[start] = 0
        pq.enQueue(vertax: start, weight: 0)
        
        while !pq.isEmpty() {
            if let current = pq.dequeue() {
                let curVertax = current.0
                let curWeight = current.1
                
                if dist[curVertax] < curWeight {
                    continue
                }
                
                guard let nextNodes = graph[curVertax] else {
                    continue
                }
                
                for nextNode in nextNodes {
                    let nextVertax = nextNode.0
                    let nextWeight = nextNode.1
                    
                    if dist[nextVertax] > curWeight + nextWeight {
                        dist[nextVertax] = curWeight + nextWeight
                        pq.enQueue(vertax: nextVertax, weight: curWeight + nextWeight)
                    }
                }
            }
        }
        
        return dist
    }
}
