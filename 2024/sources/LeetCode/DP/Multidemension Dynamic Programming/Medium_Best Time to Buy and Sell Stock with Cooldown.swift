//
//  Medium_Best Time to Buy and Sell Stock with Cooldown.swift
//  BakJoon
//
//  Created by 김성준 on 7/9/24.
//

import Foundation

class Medium_309 {
    struct State: Hashable {
        let index: Int
        let buying: Bool
    }

    var dp = [State: Int]()
    
    func maxProfit(_ prices: [Int]) -> Int {
        // 이것도 왜 처음부터 buy를 할 까?
        return dfs(prices, 0, true)
    }
    
    func dfs(_ prices: [Int], _ i: Int, _ buying: Bool) -> Int {
        if i >= prices.count {
            return 0
        }
        
        let state = State(index: i, buying: buying)
        if let cached = dp[state] {
            return cached
        }
        
        if buying {
            let buy = dfs(prices, i + 1, !buying) - prices[i]
            let cooldown = dfs(prices, i + 1, buying)
            dp[state] = max(buy, cooldown)
        } else {
            let sell = dfs(prices, i + 2, !buying) + prices[i]
            let cooldown = dfs(prices, i + 1, buying)
            dp[state] = max(sell, cooldown)
        }
        
        return dp[state]!
    }
}
