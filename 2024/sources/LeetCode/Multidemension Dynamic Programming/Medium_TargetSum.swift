//
//  TargetSum.swift
//  BakJoon
//
//  Created by 김성준 on 7/24/24.
//

import Foundation

class TargetSum {
    struct State: Hashable {
        let index: Int
        let total: Int
    }
    
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        var dp = [State: Int]() // (index, total) -> # of ways
        
        func backtrack(_ i: Int, _ total: Int) -> Int {
            if i == nums.count {
                return total == target ? 1 : 0
            }
            let state = State(index: i, total: total)
            if let cachedResult = dp[state] {
                return cachedResult
            }
            let add = backtrack(i + 1, total + nums[i])
            let subtract = backtrack(i + 1, total - nums[i])
            dp[state] = add + subtract
            return dp[state]!
        }
        
        return backtrack(0, 0)
    }
}
