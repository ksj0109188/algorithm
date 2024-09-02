//
//  LV3_이중우선순위큐.swift
//  BakJoon
//
//  Created by 김성준 on 8/19/24.
//

import Foundation

class LV3_이중우선순위큐 {
    class DoublePriority {
        let maxHeap : Heap<Int>
        let minHeap : Heap<Int>
        var isValid: [Int: Bool] = [:]
        
        init() {
            self.maxHeap = Heap<Int>(compareOperator: { $0 > $1 }, queue: [])
            self.minHeap = Heap<Int>(compareOperator: { $0 < $1 }, queue: [])
        }
        
        func insert(_ n: Int) {
            maxHeap.insert(value: n)
            minHeap.insert(value: n)
            isValid[n, default: true] = true
        }
        
        func deleteMax() {
            while let max = maxHeap.peek() {
                maxHeap.remove()
                if isValid[max, default: false] {
                    isValid[max] = false
                    break
                }
            }
        }
        
        func deleteMin() {
            while let min = minHeap.peek() {
                minHeap.remove()
                if isValid[min, default: false] {
                    isValid[min] = false
                    break
                }
            }
        }
        
        func getResult() -> [Int] {
            var max: Int?
            var min: Int?
            
            while let potentialMax = maxHeap.peek() {
                if isValid[potentialMax, default: false] {
                    max = potentialMax
                    break
                }
                maxHeap.remove()
            }
            
            while let potentialMin = minHeap.peek() {
                if isValid[potentialMin, default: false] {
                    min = potentialMin
                    break
                }
                minHeap.remove()
            }
            
            if let max = max, let min = min {
                return [max, min]
            }
            return [0, 0]
        }
    }
    
    class Heap<T : Equatable> {
        var queue: [T] = []
        let compareOperator: (T, T) -> Bool
        
        init(compareOperator: @escaping (T, T) -> Bool, queue: [T]) {
            self.compareOperator = compareOperator
            self.queue = queue
        }
        
        
        private func rightChildIndex(parent index: Int) -> Int {
            return index * 2  + 2
        }
        
        private func leftChildIndex(parent index: Int) -> Int{
            return index * 2  + 1
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
        
        func peek() -> T? {
            return queue.first
        }
        
        func insert(value: T) {
            queue.append(value)
            shiftUp(from: queue.count - 1)
        }
        
        func remove() {
            guard !queue.isEmpty else { return }
            
            let popedItem: T
            
            if count == 1 {
                popedItem = queue.removeLast()
            } else {
                queue.swapAt(0, queue.count - 1)
                popedItem = queue.removeLast()
                shiftDown(from: 0)
            }
            
        }
        
        func shiftUp(from index: Int) {
            guard index > 0 else { return }
            
            let parent = parentIndex(child: index)
            
            if parent >= 0 && compareOperator(queue[index], queue[parent]) {
                queue.swapAt(parent, index)
                shiftUp(from: parent)
            }
        }
        
        func shiftDown(from index: Int) {
            guard index >= 0 else { return }
            
            let leftIndex = leftChildIndex(parent: index)
            let rightIndex = rightChildIndex(parent: index)
            var highestPriorityIndex = index
            
            if leftIndex < count && compareOperator(queue[leftIndex], queue[highestPriorityIndex]) {
                highestPriorityIndex = leftIndex
            }
            
            if rightIndex < count && compareOperator(queue[rightIndex], queue[highestPriorityIndex]) {
                highestPriorityIndex = rightIndex
            }
            
            if highestPriorityIndex != index {
                queue.swapAt(index, highestPriorityIndex)
                shiftDown(from: highestPriorityIndex)
            }
        }
    }
    
    func solution(_ operations:[String]) -> [Int] {
        let queue = DoublePriority()
        
        for operation in operations {
            let components = operation.split(separator: " ")
            let command = components[0]
            
            switch command {
            case "I":
                if let number = Int(components[1]) {
                    queue.insert(number)
                }
            case "D":
                if components[1] == "1" {
                    queue.deleteMax()
                } else if components[1] == "-1" {
                    queue.deleteMin()
                }
            default:
                break
            }
        }
        
        return queue.getResult()
    }
}
