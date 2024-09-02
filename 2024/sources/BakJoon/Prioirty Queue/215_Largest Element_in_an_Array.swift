//
//  215_Largest Element_in_an_Array.swift
//  BakJoon
//
//  Created by 김성준 on 2/8/24.
//

import Foundation
//
//class Solution215 {
//    var nums: [Int]
//    
//    init(nums: [Int]) {
//        self.nums = nums
//    }
//    
//    func findKthLargest(_ k: Int) -> Int {
//        return quickSelect(0, nums.count - 1, nums.count - k)
//    }
//    
//    func quickSelect(_ left: Int, _ right: Int, _ k: Int) -> Int {
//        if left < right {
//            let pivotIndex = partition(left, right)
//            if pivotIndex == k {
//                return nums[pivotIndex]
//            } else if k < pivotIndex {
//                return quickSelect(left, pivotIndex - 1, k)
//            } else {
//                return quickSelect(pivotIndex + 1  , right, k)
//            }
//        }
//        return nums[left]
//    }
//    
//   // 3
//   // 0, 1, 2, 3, 4, 5, 6
//    func partition(_ low: Int, _ high: Int) -> Int {
//        let pivotIndex = Int.random(in: low...high)
//        let pivot = nums[pivotIndex]
//        nums.swapAt(pivotIndex, high)
//        var i = low
//           
//        for j in i..<high {
//            if nums[j] <= pivot {
//                nums.swapAt(i, j)
//                i += 1
//            }
//        }
//        
//        nums.swapAt(high, i)
//        return i
//    }
//}

class Solution215 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var heap = Heap(elements: nums, priority: { $0 > $1 } )
        var K = k
        var result: Int = 0
        while K >= 1 {
            result = heap.dequeue() ?? 0
            K -= 1
        }
        return result
    }
    
    struct Heap {
        var elements: [Int]
        let priorityFunction: (Int, Int) -> Bool
        
        var count: Int {
            elements.count
        }
        
        var isEmpty: Bool {
            elements.isEmpty
        }
        
        init(elements: [Int], priority: @escaping (Int, Int) -> Bool) {
            self.elements = elements
            priorityFunction = priority
            buildHeap()
        }
        
        mutating func buildHeap() {
            // 힙은 Leaf Node를 제외한 나머지 노드까지만 반복 수행
            // 리프노드는 중간 노드를 Heapify하면서 정렬되기 때문
            for i in (0..<count/2).reversed() {
                shiftDown(index: i)
            }
        }
        
        func peek() -> Int? {
            return elements.first
        }
        
        mutating func dequeue() -> Int? {
            guard !isEmpty else { return nil }
            elements.swapAt(0, count - 1)
            let element = elements.removeLast()
            if !isEmpty {
                shiftDown(index: 0)
            }
            return element
        }
        
        func isRoot(_ index: Int) -> Bool {
            return index == 0
        }
        
        func leftChildIndex(of index: Int) -> Int {
            return 2 * index + 1
        }
        
        func rightChildIndex(of index: Int) -> Int {
            return 2 * index + 2
        }
        
        func parentIndex(of index: Int) -> Int {
            return (index - 1) / 2
        }
        
        func isHigherPriority(at firstIndex: Int, than secondIndex: Int) -> Bool {
            return priorityFunction(elements[firstIndex], elements[secondIndex])
        }
        
        func highestPriorityIndex(of parentIndex: Int, and childIndex: Int) -> Int {
            guard childIndex < count && isHigherPriority(at: childIndex, than: parentIndex) else {
                return parentIndex
            }
            return childIndex
        }
        
        func highestPriorityIndex(for parent: Int) -> Int {
            let left = leftChildIndex(of: parent)
            let right = rightChildIndex(of: parent)
            let leftPriority = highestPriorityIndex(of: parent, and: left)
            return highestPriorityIndex(of: leftPriority, and: right)
        }
        
        mutating func shiftUp(index: Int) {
            let parent = parentIndex(of: index)
            guard !isRoot(index), isHigherPriority(at: index, than: parent) else { return }
            elements.swapAt(index, parent)
            shiftUp(index: parent)
        }
        
        mutating func shiftDown(index: Int) {
            let childIndex = highestPriorityIndex(for: index)
            if index == childIndex {
                return
            }
            elements.swapAt(index, childIndex)
            shiftDown(index: childIndex)
        }
    }
}
