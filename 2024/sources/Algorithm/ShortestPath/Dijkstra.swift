//
//  Dijkstra.swift
//  BakJoon
//
//  Created by 김성준 on 3/2/24.
//



import Foundation

//https://www.acmicpc.net/problem/1753
class 최단경로_1753 {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let v = input[0]
        let e = input[1]
        let startV = Int(readLine()!)!
        var graph = Array(repeating: [(to: Int, weight: Int)](), count: v + 1)
        
        // 간선 정보 입력
        for _ in 0..<e {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let from = input[0]
            let to = input[1]
            let weight = input[2]
            graph[from].append((to: to, weight: weight))
        }
        
        let result = dijkstra(graph: graph, start: startV, v: v)
        
        for i in 1...v {
            if result[i] == Int.max {
                print("INF")
            } else {
                print(result[i])
            }
        }
    }
    
    func dijkstra(graph: [[(to: Int, weight: Int)]], start: Int, v: Int) -> [Int] {
        var dist = Array(repeating: Int.max, count: v + 1)
        dist[start] = 0
        
        let pq = PriorityQueue<Int>(operation: <)
        pq.enqueue(node: PriorityQueue.Node(vertex: start, distance: 0))
        
        while let current = pq.dequeue() {
            if current.distance > dist[current.vertex] {
                continue
            }
            
            for next in graph[current.vertex] {
                let newDistance = current.distance + next.weight
                
                if newDistance < dist[next.to] {
                    dist[next.to] = newDistance
                    pq.enqueue(node: PriorityQueue.Node(vertex: next.to, distance: newDistance))
                }
            }
        }
        
        return dist
    }
    
    // 반복문 구현
    class PriorityQueue<T> where T: Comparable {
        struct Node: Comparable {
            let vertex: T
            let distance: T
            static func < (lhs: 최단경로_1753.PriorityQueue<T>.Node, rhs: 최단경로_1753.PriorityQueue<T>.Node) -> Bool {
                return lhs.distance < rhs.distance
            }
        }
        
        private var heap: [Node] = []
        private let operation: (T, T) -> Bool
        
        init(operation: @escaping (T, T) -> Bool) {
            self.operation = operation
        }
        
        func enqueue(node: Node) {
            heap.append(node)
            shiftUp(from: heap.count - 1)
        }
        
        func dequeue() -> Node? {
            guard !heap.isEmpty else { return nil}
            
            var popedItem: Node
            
            if heap.count == 1 {
                popedItem = heap.removeFirst()
            } else {
                heap.swapAt(0, heap.count - 1)
                popedItem = heap.removeLast()
                shiftDown(from: 0)
            }
            
            return popedItem
        }
        
        private func leftChildIndex(parent: Int) -> Int {
            return parent * 2 + 1
        }
        
        private func rightChildIndex(parent: Int) -> Int{
            return parent * 2 + 2
        }
        
        private func parentIndex(index: Int) -> Int {
            return (index - 1) / 2
        }
        
        private func shiftUp(from index: Int) {
            var child = index
            var parent = parentIndex(index: child)
            
            while child > 0 && operation(heap[child].distance, heap[parent].distance) {
                heap.swapAt(child, parent)
                child = parent
                parent = parentIndex(index: child)
            }
        }
        
        private func shiftDown(from index: Int) {
            let count = heap.count
            var parent = index
            
            while true {
                let leftChild = leftChildIndex(parent: parent)
                let rightChild = rightChildIndex(parent: parent)
                var candidate = parent
                
                if leftChild < count && operation(heap[leftChild].distance, heap[candidate].distance) {
                    candidate = leftChild
                }
                
                if rightChild < count && operation(heap[rightChild].distance, heap[candidate].distance) {
                    candidate = rightChild
                }
                
                if candidate == parent {
                    return
                }
                
                heap.swapAt(parent, candidate)
                parent = candidate
            }
        }
    }
    
    // 재귀 구현 (시간 초과가 발생)
    class PriorityQueue2<T> where T: Comparable {
        struct Node {
            let vertex: T
            let distance: T
        }
        
        private var queue: [Node] = []
        private let operation: (T, T) -> Bool
        
        init(operation: @escaping (T, T) -> Bool) {
            self.operation = operation
        }
        
        func enqueue(node: Node) {
            queue.append(node)
            shiftUp(from: queue.count - 1)
        }
        
        func dequeue() -> Node? {
            guard !queue.isEmpty else { return nil}
            
            var popedItem: Node
            
            if queue.count == 1 {
                popedItem = queue.removeFirst()
            } else {
                queue.swapAt(0, queue.count - 1)
                popedItem = queue.removeLast()
                shiftDown(from: 0)
            }
            
            return popedItem
        }
        
        private func leftChild(index: Int) -> Int {
            return index * 2 + 1
        }
        
        private func rightChild(index: Int) -> Int{
            return index * 2 + 2
        }
        
        private func parent(index: Int) -> Int {
            return (index - 1) / 2
        }
        
        private func shiftUp(from index: Int) {
            guard index > 0 else { return }
            
            let parent = parent(index: index)
            
            if parent >= 0 && operation(queue[parent].distance, queue[index].distance) {
                queue.swapAt(parent, index)
                shiftUp(from: parent)
            }
        }
        
        private func shiftDown(from index: Int) {
            let leftChild = leftChild(index: index)
            let rightChild = rightChild(index: index)
            var highestPriority = index
            
            if leftChild < queue.count && operation(queue[leftChild].distance, queue[highestPriority].distance) {
                highestPriority = leftChild
            }
            
            if rightChild < queue.count && operation(queue[rightChild].distance, queue[highestPriority].distance) {
                highestPriority = rightChild
            }
            
            if highestPriority != index {
                queue.swapAt(index, highestPriority)
                shiftDown(from: highestPriority)
            }
        }
    }
}
