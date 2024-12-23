//
//  MooreVoting.swift
//  BakJoon
//
//  Created by 김성준 on 12/23/24.
//

import Foundation

//MARK: 169. Majority Element
class MooreVoting {
    class Solution {
        // MARK: O(n) Time / O(n) Space
        // func majorityElement(_ nums: [Int]) -> Int {
        //     var dict: [Int: Int] = [:]

        //     for num in nums{
        //         dict[num, default: 0] += 1

        //         if dict[num]! > nums.count / 2 {
        //             return num
        //         }
        //     }

        //     return -1
        // }
        
        //MARK: O(n) TimeComplexity / O(1) space
        func majorityElement(_ nums: [Int]) -> Int {
            var count = 0
            var majority = -1

            for n in nums {
                if count == 0 {
                    majority = n
                }
                if n == majority {
                    count += 1
                } else {
                    count -= 1
                }
            }

            let occurrences = nums.filter { $0 == majority }.count

            if occurrences > nums.count / 2 {
                return majority
            } else {
                return -1
            }
        }
    }
}
