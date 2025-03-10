//
//  3478.swift
//  BakJoon
//
//  Created by 김성준 on 3/10/25.
//

import Foundation

class Medium_3478 {
    // ✅ 최대 힙 (O(log k) 삽입/삭제)
    struct MinHeap {
        private var heap = [Int]()
        private var heapSum = 0 // 누적 합을 유지하여 O(1) 조회 가능
        private var operation: (Int, Int) -> Bool = (<)
        
        private func parentIndex(child index: Int) -> Int{ return (index - 1) / 2 }
        private func leftChildIndex(parent index: Int) -> Int { return index * 2 + 1 }
        private func rightChildIndex(parent index: Int) -> Int {  index * 2 + 2 }
        
        mutating func push(_ val: Int) {
            heap.append(val)
            heapSum += val
            heapifyUp()
        }
        
        mutating func pop() -> Int? {
            guard !heap.isEmpty else { return nil }
            heap.swapAt(0, heap.count - 1)
            let maxValue = heap.removeLast()
            heapSum -= maxValue
            heapifyDown()
            
            return maxValue
        }
        
        func sum() -> Int {
            return heapSum
        }
        
        func count() -> Int {
            return heap.count
        }
        
        private mutating func heapifyUp() {
            var index = heap.count - 1
           
            while index > 0 {
                let parent = parentIndex(child: index)
                
                if operation(heap[index], heap[parent]) {
                    heap.swapAt(index, parent)
                    index = parent
                } else {
                    break
                }
            }
        }
        
        private mutating func heapifyDown() {
            var parent = 0
            
            while true {
                let leftChild = leftChildIndex(parent: parent)
                let rightChild = rightChildIndex(parent: parent)
                var candidate = parent
                
                // 자식의 가격이 candidate의 가격보다 클 때 candidate를 자식으로 설정
                if leftChild < heap.count && operation(heap[leftChild], heap[candidate]) {
                    candidate = leftChild
                }
                if rightChild < heap.count && operation(heap[rightChild], heap[candidate]) {
                    candidate = rightChild
                }
                
                if candidate == parent {
                    break
                }
                
                heap.swapAt(candidate, parent)
                parent = candidate
            }
        }
    }

    func findMaxSum(nums1: [Int], nums2: [Int], k: Int) -> [Int] {
        let n = nums1.count
        var answer = [Int](repeating: 0, count: n)
        let indexedNums = zip(nums1, nums2).enumerated().sorted { $0.1.0 < $1.1.0 } // O(n log n)
        
        var heap = MinHeap()
        var numToSum = [(num: Int, sum: Int)]()
        
        for (_, (num, num2)) in indexedNums {
            print(num, num2)
            heap.push(num2) // O(log k)
            if heap.count() > k {
                _ = heap.pop() // O(log k)
            }
            numToSum.append((num, heap.sum())) // O(1) (이전에는 O(k))
        }
        
        let sortedNums = numToSum.map { $0.num }
        let sortedSums = numToSum.map { $0.sum }
        
        for i in 0..<n {
            if let index = binarySearch(sortedNums, target: nums1[i]) {
                print("index", index)
                answer[i] = index >= 0 ? sortedSums[index] : 0
            } else {
                answer[i] = 0
            }
        }
        
        return answer
    }
    
    // ✅ 이진 탐색 (O(log n))
    func binarySearch(_ arr: [Int], target: Int) -> Int? {
        var left = 0, right = arr.count - 1
        var result: Int? = nil
        
        while left <= right {
            let mid = left + (right - left) / 2
            if arr[mid] < target {
                result = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return result
    }
}
