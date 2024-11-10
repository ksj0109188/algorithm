//
//  leetCode_198_Robber.swift
//  BakJoon
//
//  Created by 김성준 on 3/17/24.
//

import Foundation

class Solution198 {
    class ImprovedSolution {
        var dp: [Int: Int] = [:]

        func rob(_ nums: [Int]) -> Int {
            guard nums.count > 1 else { return nums.first ?? 0 }
            return max(robber(0, nums), robber(1, nums))
        }
        // [1,2,3,1]
        func robber(_ index: Int, _ nums: [Int]) -> Int {
            guard index < nums.count else { return 0 }
            var result = max(dp[index + 2] ?? robber(index + 2, nums),
                             dp[index + 3] ?? robber(index + 3, nums))
            result += nums[index]
            dp[index] = result
            return result
        }
    }
    
    func rob(_ nums: [Int]) -> Int {
            var dp = Array(repeating: 0, count: nums.count )
            let numCount = nums.count

            if numCount > 2{
                dp[0] = nums[0]
                dp[1] = nums[1]
                dp[2] = nums[0] + nums[2]

                for i in 3..<nums.count {
                    dp[i] += max(dp[i-2], dp[i-3])
                }

                return dp.max{$0 < $1}!

            } else if numCount == 2 {
               return  max(nums.first!, nums.last!)
            } else {
                return nums.first!
            }
        }
}
