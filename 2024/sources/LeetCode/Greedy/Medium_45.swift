//
//  Medium_45.swift
//  BakJoon
//
//  Created by 김성준 on 1/14/25.
//

import Foundation

class Medium_45 {
    func jump(_ nums: [Int]) -> Int {
        var jumps = 0
        var currentEnd = 0
        var farthest = 0
        
        for i in 0..<nums.count - 1 {
            farthest = max(farthest, i + nums[i])
            if i == currentEnd {
                jumps += 1
                currentEnd = farthest
            }
        }
        
        return jumps
    }
    //MARK: O(n)^2 방식
    func jump2(_ nums: [Int]) -> Int {
        var dp: [Int] = .init(repeating: Int.max, count: nums.count)
        
        func dfs(_ index: Int, _ step: Int) -> Int {
            guard index < nums.count - 1 else { return step }
            
            if dp[index] != Int.max {
                return dp[index]
            }
            
            let len = nums[index]
            var minStep = Int.max
            
            for i in stride(from: len, through: 1, by:  -1) {
                minStep = min(dfs(index + i, step + 1), minStep)
            }
            
            dp[index] = minStep
            
            return dp[index]
        }
        
        dfs(0, 0)
        
        return dp[0]
    }
}
