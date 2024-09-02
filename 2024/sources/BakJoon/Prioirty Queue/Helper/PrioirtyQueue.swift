//
//  PrioirtyQueue.swift
//  BakJoon
//
//  Created by 김성준 on 2/26/24.
//

import Foundation

struct GlobalPriorityQueue<S: Equatable> {
    var compareOperator: (S, S) -> Bool
    var queue:[S]
    
    init(compareOperator: @escaping (S, S) -> Bool, queue: [S] ) {
        self.compareOperator = compareOperator
        self.queue = queue
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
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    var count: Int {
        return queue.count
    }
    
    var pick: S? {
        return queue.first
    }
    
    mutating func enqueue(value: S) {
        queue.append(value)
        heapifyUp(from: queue.count - 1)
    }
    
    mutating func dequeue() -> S? {
        guard !queue.isEmpty else { return nil }
        
        let popedItem: S
        
        if queue.count == 1 {
            popedItem = queue.removeLast()
        } else {
            queue.swapAt(0, queue.count - 1)
            popedItem = queue.removeLast()
            heapifyDown(from: 0)
        }
        return popedItem
    }
    
    mutating func heapifyUp(from index: Int) {
        guard index > 0 else { return }
        
        let parentIndex = parentIndex(child: index)
        
        if parentIndex >= 0 && compareOperator(queue[index], queue[parentIndex])  {
            queue.swapAt(parentIndex, index)
            heapifyUp(from: parentIndex)
        }
    }
    
    mutating func heapifyDown(from index: Int) {
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
    
}
