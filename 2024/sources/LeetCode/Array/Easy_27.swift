//
//  Easy_27.swift
//  BakJoon
//
//  Created by 김성준 on 12/21/24.
//

import Foundation

class Easy_27 {
    class Solution {
        static func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
            var k = 0
            var newNums: [Int] = []
            
            for num in nums {
                if num != val {
                    newNums.append(num)
                }
            }
            
            nums = newNums
            return nums.count
        }
    }
}
