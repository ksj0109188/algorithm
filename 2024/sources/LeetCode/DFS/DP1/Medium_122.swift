//
//  Medium_122.swift
//  BakJoon
//
//  Created by 김성준 on 12/30/24.
//

import Foundation

class BestProfitStock1_122 {
    private struct State: Hashable {
        let index: Int
        let isBuying: Bool
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        var dp : [State: Int] = [:]
        
        func dfs(_ index: Int, _ isBuying: Bool) -> Int {
            guard index < prices.count else { return 0 }
            
            let state = State(index: index, isBuying: isBuying)
            
            if dp[state] != nil {
                return dp[state]!
            }
            
            if isBuying {
                // 구매하거나, 그냥 넘어가거나
                let buy = dfs(index + 1, false) - prices[index]
                let skip = dfs(index + 1, isBuying)
                dp[state] = max(buy, skip)
            } else {
                // 판매하거나, 그냥 넘어가거나
                let sell = dfs(index + 1, true) + prices[index]
                let skip = dfs(index + 1, isBuying)
                dp[state] = max(sell, skip)
            }

            
            return dp[state]!
        }
        
        return dfs(0, true)
    }
    
    // 최적화
    func maxProfit2(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else { return 0 }
        var maxProfit = 0
        for i in 1 ..< prices.count {
            guard prices[i-1] < prices[i] else {
                continue
            }
            maxProfit += prices[i] - prices[i-1]
        }
        
        return maxProfit
    }
    
}
