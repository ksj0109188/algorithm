//
//  Hard_BurstBalloons.swift
//  BakJoon
//
//  Created by 김성준 on 9/24/24.
//

import Foundation

class BurstBallons {
    struct DpKey: Hashable {
        let left: Int
        let right: Int
    }
    
    func maxCoins(_ nums: [Int]) -> Int {
        var nums = nums
        nums.insert(1, at: 0)
        nums.append(1)
        
        var dp: [DpKey: Int] = [:]
        
        func dfs(_ l: Int, _ r: Int) -> Int {
            let dpKey = DpKey(left: l, right: r)
            
            if l > r { return 0 }
            if dp[dpKey] != nil { return dp[dpKey]! }
            
            for i in l...r {
                var coins = nums[l - 1] * nums[i] * nums[r + 1]
                coins += dfs(l, i - 1) + dfs(i + 1, r)
                dp[dpKey] = max(dp[dpKey, default: 0], coins)
            }
            
            return dp[dpKey, default: 0]
        }
        
        return dfs(1, nums.count - 2)
    }
}
