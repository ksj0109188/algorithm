//
//  502_IPO.swift
//  BakJoon
//
//  Created by 김성준 on 2/23/24.
//

import Foundation

class Solution502 {
    struct Project {
        let profit: Int
        let capital: Int
    }
    
    class PriorityQueue {
        var compareOperator: (Int, Int) -> Bool
        var queue:[Int]
        
        init(compareOperator: @escaping (Int, Int) -> Bool, queue: [Int]) {
            self.compareOperator = compareOperator
            self.queue = queue
        }
        
        var isEmpty: Bool {
            return queue.isEmpty
        }
        
        func enqueue(profit cost: Int) {
            queue.append(cost)
            heapifyUp(from: queue.count - 1)
        }
        
        func dequeue() -> Int? {
            guard !queue.isEmpty else { return nil }
            
            let popedItem: Int
            
            if queue.count == 1 {
                popedItem = queue.removeLast()
            } else {
                queue.swapAt(0, queue.count - 1)
                popedItem = queue.removeLast()
                heapifyDown(from: 0)
            }
            return popedItem
        }
        
        func heapifyUp(from index: Int) {
            guard index > 0 else { return }
            let parentIndex = parentIndex(child: index)
            
            if parentIndex >= 0 && compareOperator(queue[index], queue[parentIndex])  {
                queue.swapAt(parentIndex, index)
                heapifyUp(from: parentIndex)
            }
        }
        
        func heapifyDown(from index: Int) {
            let leftChildIndex = leftChildIndex(parent: index)
            let rightChildIndex = rightChildIndex(parent: index)
            var highestPriorityIndex = index
            
            if leftChildIndex < queue.count && compareOperator(queue[leftChildIndex], queue[highestPriorityIndex]) {
                highestPriorityIndex = leftChildIndex
            }
            
            if rightChildIndex < queue.count && compareOperator(queue[rightChildIndex], queue[highestPriorityIndex]) {
                highestPriorityIndex = rightChildIndex
            }
            
            if highestPriorityIndex != index {
                queue.swapAt(index, highestPriorityIndex)
                heapifyDown(from: highestPriorityIndex)
            }
        }
        
        private func leftChildIndex(parent index: Int) -> Int {
            return index * 2 + 1
        }
        
        private func rightChildIndex(parent index: Int) -> Int {
            return index * 2 + 2
        }
        
        private func parentIndex(child index: Int) -> Int {
            return (index - 1) / 2
        }
    }
    
    func findMaximizedCapital(_ k: Int, _ w: Int, _ profits: [Int], _ capital: [Int]) -> Int {
        var w = w
        let prioirtyQueue = PriorityQueue(compareOperator: {$0 > $1}, queue: [])
        var projects: [Project] = []
        
        for i in 0..<profits.count {
            projects.append(Project(profit: profits[i], capital: capital[i]))
        }
        
        projects.sort(by: {$0.capital < $1.capital})
        
        var i = 0
        for _ in 0..<k {
            while i < profits.count && projects[i].capital <= w {
                prioirtyQueue.enqueue(profit: projects[i].profit)
                i += 1
            }
            
            if !prioirtyQueue.isEmpty {
                if let profit = prioirtyQueue.dequeue() {
                    w += profit
                }
            }
        }
        return w
    }
}
