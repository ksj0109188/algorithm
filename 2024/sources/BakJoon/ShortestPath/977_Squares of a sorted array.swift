//
//  977_Squares of a sorted array.swift
//  BakJoon
//
//  Created by 김성준 on 3/2/24.
//

import Foundation

class Solution977 {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = nums.count - 1
        var result = Array<Int>(repeating: 0, count: nums.count)
        var insertPointer = rightIndex
        while leftIndex <= rightIndex {
            guard leftIndex != rightIndex else {
                result[0] = nums[leftIndex] * nums[leftIndex]
                break
            }
            let leftValue = nums[leftIndex] * nums[leftIndex]
            let rightValue = nums[rightIndex] * nums[rightIndex]
            
            if leftValue < rightValue {
                result[insertPointer] = rightValue
                rightIndex -= 1
            } else {
                result[insertPointer] = leftValue
                leftIndex += 1
            }
            insertPointer -= 1
        }
        
        return result
    }
}
