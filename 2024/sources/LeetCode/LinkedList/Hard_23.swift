//
//  LinkedList.swift
//  BakJoon
//
//  Created by 김성준 on 3/13/25.
//

import Foundation


class Hard_23 {
    struct Heap {
        private var queue: [Int] = []
        private var operation: (Int, Int) -> Bool = (<=)
        
        var count: Int { queue.count }

        private func parentIndex(_ index: Int) -> Int {
            return (index - 1) / 2
        }
        
        private func leftChildIndex(_ index: Int) -> Int {
            return index * 2 + 1
        }
        
        private func rightChildIndex(_ index: Int) -> Int {
            return index * 2 + 2
        }
        
        mutating func push(_ val: Int) {
            queue.append(val)
            shiftUp()
        }
        
        mutating func pop() -> Int? {
            guard !queue.isEmpty else { return nil}
            
            queue.swapAt(0, queue.count - 1)
            var popedItem = queue.removeLast()
            
            shiftDown()
            
            return popedItem
        }
        
        private mutating func shiftUp() {
            var index = queue.count - 1
            
            while index > 0 {
                var parent = parentIndex(index)

                if operation(queue[index], queue[parent]) {
                    queue.swapAt(index, parent)
                    index = parent
                } else {
                    break
                }
            }
        }
        
        private mutating func shiftDown() {
            var parent = 0
            
            while true {
                var candidate = parent
                var leftChild = leftChildIndex(parent)
                var rightChild = rightChildIndex(parent)
                
                if leftChild < queue.count && operation(queue[leftChild], queue[candidate]) {
                    candidate = leftChild
                }
                if rightChild < queue.count && operation(queue[rightChild], queue[candidate]) {
                    candidate = rightChild
                }
                
                if parent == candidate { break }
                
                queue.swapAt(candidate, parent)
                parent = candidate
            }
        }
        
    }
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var heap = Heap()
        
        for node in lists.compactMap({$0}) {
            extractVal(node)
        }


        var node: ListNode? = ListNode(0)
        var nextNode = node
        
        for _ in 0..<heap.count {
            nextNode?.next = ListNode(heap.pop()!)
            nextNode = nextNode?.next
        }

        return node?.next
    
        
 
        func extractVal(_ node: ListNode) {
            heap.push(node.val)
              
            if node.next != nil {
                extractVal(node.next!)
            }
        }
    }
    
  
}
