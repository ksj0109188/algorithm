//
//  Baekjoon_1927_Minheap.swift
//  BakJoon
//
//  Created by 김성준 on 9/9/24.
//

import Foundation


class Baekjoon_1927_MinHeap {
    class Heap<T: Comparable> {
        private var queue: [T] = []
        
        private var count: Int {
            queue.count
        }
        
        private func parentIndex(child index: Int) -> Int{
            return (index - 1) / 2
        }
        
        private func childLeftIndex(parent index: Int) -> Int {
            return index * 2 + 1
        }
        
        private func childRightIndex(parent index: Int) -> Int {
            return index * 2 + 2
        }
        
        private var pick: T? {
            return queue.first
        }
        
        func enqueue(item: T) {
            queue.append(item)
            let lastIndex = count - 1
            
            shiftUp(from: lastIndex)
        }
        
        func dequeue() -> T? {
            guard !queue.isEmpty else { return nil }
            if count == 1 { return queue.removeFirst() }
            
            let result = pick
            let rootIndex = 0
            
            queue.swapAt(rootIndex, queue.count - 1)
            queue.remove(at: queue.count - 1)
            
            shiftDown(from: rootIndex)
            
            return result
        }
        
        private func shiftUp(from index: Int) {
            guard index > 0 else { return }
            
            let parentIndex = parentIndex(child: index)
            
            if queue[index] < queue[parentIndex] {
                queue.swapAt(index, parentIndex)
                shiftUp(from: parentIndex)
            }
        }
        
        private func shiftDown(from index: Int) {
            let leftChild = childLeftIndex(parent: index)
            let rightChild = childRightIndex(parent: index)
            var highestPriority = index
            
            if leftChild < count && queue[leftChild] < queue[highestPriority]{
                highestPriority = leftChild
            }
            
            if rightChild < count && queue[rightChild] <  queue[highestPriority]{
                highestPriority = rightChild
            }
            
            if highestPriority != index {
                queue.swapAt(index, highestPriority)
                shiftDown(from: highestPriority)
            }
        }
    }
    
    func solution() {
        let queue = Heap<Int>()
        
        let n = Int(readLine()!)!
        for _ in 0..<n {
            let input = Int(readLine()!)!
            
            if input == 0 {
                print(queue.dequeue() ?? 0)
            } else {
                queue.enqueue(item: input)
            }
        }
    }
}
