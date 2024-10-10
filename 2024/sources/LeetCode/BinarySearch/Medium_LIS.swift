//
//  LIS.swift
//  BakJoon
//
//  Created by 김성준 on 10/10/24.
//

import Foundation

class LIS_Solution {
   func lengthOfLIS_BinarySearch(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return 0
        }
        
        var tails = [Int]()
        
        for num in nums {
            var left = 0
            var right = tails.count
            
            while left < right {
                let mid = left + (right - left) / 2
                if tails[mid] < num {
                    left = mid + 1
                } else {
                    right = mid
                }
            }
            
            if right >= tails.count {
                tails.append(num)
            } else {
                tails[right] = num
            }
        }
        
        return tails.count
    }
    
    func lengthOfLIS_DP(_ nums: [Int]) -> Int {
        var dp: [Int] = .init(repeating: 1, count: nums.count)

        for i in 0..<nums.count {
            for j in 0...i {
                if nums[i] > nums[j] && dp[i] < dp[j] + 1{
                    dp[i] = dp[j] + 1
                }
            }
        }

        return dp.max() ?? 0
    }
}
