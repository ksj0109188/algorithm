////
////  373_Find_K_Pairs_With.swift
////  BakJoon
////
////  Created by 김성준 on 2/16/24.
////
//
//import Foundation
//
//struct Pair {
//    var left: Int
//    var right: Int
//    var index: Int
//    var sum: Int
//    
//    init(_ left: Int, _ right: Int, _ index: Int) {
//        self.left = left
//        self.right = right
//        self.sum = left + right
//        self.index = index
//    }
//}
//
////class PriorityQueue {
////    var queue: [Pair] = [Pair]()
////
////    private func leftChildIndex(parent index: Int) -> Int {
////        return index * 2 + 1
////    }
////    
////    private func rightChildIndex(parent index: Int) -> Int {
////        return index * 2 + 2
////    }
////    
////    private func parentIndex(child index: Int) -> Int {
////        return (index - 1) / 2
////    }
////    
////    func enqueue(_ pair: Pair) {
////        queue.append(pair)
////        heapifyUp(from: queue.count - 1)
////    }
////    
////    func dequeue() -> Pair? {
////        guard !queue.isEmpty else { return nil }
////        
////        let popedItem: Pair
////        
////        if queue.count == 1 {
////            popedItem = queue.removeLast()
////        } else {
////            queue.swapAt(0, queue.count - 1)
////            popedItem = queue.removeLast()
////            heafipyDown(from: 0)
////        }
////        return popedItem
////    }
////    
////    func heapifyUp(from index: Int) {
////        guard index > 0 else { return }
////        let parentIndex = parentIndex(child: index)
////        
////        if parentIndex >= 0 && queue[parentIndex].sum > queue[index].sum {
////            queue.swapAt(parentIndex, index)
////            heapifyUp(from: parentIndex)
////        }
////    }
////    
////    func heafipyDown(from index: Int) {
////        let leftChildIndex = leftChildIndex(parent: index)
////        let rightChildIndex = rightChildIndex(parent: index)
////        var smallestIndex = index
////        
////        if leftChildIndex < queue.count && queue[leftChildIndex].sum < queue[smallestIndex].sum {
////            smallestIndex = leftChildIndex
////        }
////        
////        if rightChildIndex < queue.count && queue[rightChildIndex].sum < queue[smallestIndex].sum {
////            smallestIndex = rightChildIndex
////        }
////        
////        if smallestIndex != index {
////            queue.swapAt(index, smallestIndex)
////            heafipyDown(from: smallestIndex)
////        }
////    }
////    
////    init(_ nums1: [Int], _ nums2: [Int]) {
////        for index in 0..<nums1.count {
////            let pair = Pair(nums1[index], nums2[0], 0)
////            enqueue(pair)
////        }
////    }
////}
//
//class Solution373 {
//    func kSmallestPairs(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> [[Int]] {
//        var result:[[Int]] = []
//        let prioirtyQueue = PriorityQueue(nums1, nums2)
//        var k = k
//        
//        while k > 0 {
//            if let item = prioirtyQueue.dequeue() {
//                result.append([item.left, item.right])
//                let nextItemIndex = item.index + 1
//                if nextItemIndex < nums2.count {
//                    let nextPair = Pair(item.left, nums2[nextItemIndex], nextItemIndex)
//                    prioirtyQueue.enqueue(nextPair)
//                }
//            }
//            k -= 1
//        }
//        return result
//    }
//}
