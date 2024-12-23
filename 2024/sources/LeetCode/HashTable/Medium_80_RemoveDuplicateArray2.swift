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
            var dict: [Int: Int] = [:]
            var newNums: [Int] = []

            for num in nums {
                dict[num, default: 0] += 1
                
                if dict[num]! < 3 {
                    newNums.append(num)
                }
            }

            nums = newNums

            return newNums.count
        }
    }
    
    //MARK: 최적화 끝판왕
    class Solution2 {
        func removeDuplicates(_ nums: inout [Int]) -> Int {
            guard nums.count > 2 else { return nums.count }
            var validIndex = 2

            ///notes:
            ///Input: nums = [0,0,1,1,1,1,2,3,3]
            ///Output: 7, nums = [0,0,1,1,2,3,3,_,_]
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
