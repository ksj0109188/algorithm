//
//  1202.swift
//  BakJoon
//
//  Created by 김성준 on 2/24/25.
//

import Foundation

class 보석도둑_1202 {
    struct PriorityQueue {
        struct Node {
            let m: Int
            let v: Int
        }
        let operation: (Int, Int) -> Bool
        var queue: [Node]
        
        init(operation: @escaping (Int, Int) -> Bool, queue: [Node]) {
            self.operation = operation
            self.queue = queue
        }
        
        private func leftChildIndex(parent: Int) -> Int {
            return parent * 2 + 1
        }
        
        private func rightChildIndex(parent: Int) -> Int {
            return parent * 2 + 2
        }
        
        private func parentIndex(index: Int) -> Int {
            return (index - 1) / 2
        }
        
        mutating func enQueue(node: Node) {
            queue.append(node)
            
            heapifyUp(child: queue.count - 1)
        }
        
        mutating func deQueue() -> Node? {
            guard !queue.isEmpty else { return nil }
            
            queue.swapAt(0, queue.count - 1)
            
            let popedItem = queue.removeLast()
            
            if queue.count > 0 {
                heapifyDown(index: 0)
            }
            
            return popedItem
        }
        
        private mutating func heapifyUp(child index: Int) {
            var child = index
            
            while child > 0  {
                let parent = parentIndex(index: child)
                
                if operation(queue[child].v, queue[parent].v) {
                    queue.swapAt(child, parent)
                    child = parent
                } else {
                    break
                }
            }
        }
        
        private mutating func heapifyDown(index: Int) {
            var parent = index
            
            while true {
                let leftChild = leftChildIndex(parent: parent)
                let rightChild = rightChildIndex(parent: parent)
                var candidate = parent
                
                // 자식의 가격이 candidate의 가격보다 클 때 candidate를 자식으로 설정
                if leftChild < queue.count && operation(queue[leftChild].v, queue[candidate].v) {
                    candidate = leftChild
                }
                if rightChild < queue.count && operation(queue[rightChild].v, queue[candidate].v) {
                    candidate = rightChild
                }
                
                if candidate == parent {
                    break
                }
                
                queue.swapAt(candidate, parent)
                parent = candidate
            }
        }
    }
    
    func exec() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let (n, k) = (input[0], input[1])
        var items: [(m: Int, v: Int)] = []
        var limits: [Int] = []
        var result = 0
        
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            
            items.append((m: input[0], v: input[1]))
        }
        
        for _ in 0..<k {
            let input = Int(readLine()!)!
            limits.append(input)
        }
        
        items.sort{ $0.m < $1.m }
        limits.sort()
        
        var priorityQueue = PriorityQueue(operation: >, queue: [])

        // 각 가방에 대해 처리2 -> removeFirst -> O(n)복잡도를 개선
        var itemIndex = 0
        for limit in limits {
            // 현재 가방의 제한 무게보다 작거나 같은 보석들을 모두 우선순위 큐에 추가
            while itemIndex < items.count && items[itemIndex].m <= limit {
                priorityQueue.enQueue(node: .init(m: items[itemIndex].m, v: items[itemIndex].v))
                itemIndex += 1
            }
            
            // 가방에 넣을 수 있는 보석 중 가장 가치가 높은 보석 선택
            if let node = priorityQueue.deQueue() {
                result += node.v
            }
        }
        
        print(result)
    }
}

