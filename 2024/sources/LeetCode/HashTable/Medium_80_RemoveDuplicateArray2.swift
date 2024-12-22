//
//  Medium_RemoveDuplicateArray2.swift
//  BakJoon
//
//  Created by 김성준 on 12/22/24.
//

import Foundation

class Medium_80_RemoveDuplicateArray2 {
    class Solution {
        func removeDuplicates(_ nums: inout [Int]) -> Int {
            guard nums.count > 2 else { return nums.count }
            var validIndex = 2

            for i in 2 ..< nums.count {
                if nums[i] != nums[validIndex - 2] {
                    nums.swapAt(validIndex, i)
                    validIndex += 1
                }
            }

            return validIndex
        }
    }
}
