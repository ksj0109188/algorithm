//
//  322_CoinChange.swift
//  BakJoon
//
//  Created by 김성준 on 3/10/24.
//

import Foundation

class Solution322 {
    
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp = Array(repeating: amount + 1, count: amount + 1)
        if amount < 1 {
            return 0
        }
        if coins.filter({ $0 <= amount }).isEmpty {
            return -1
        }
        
        dp[0] = 0
        
        for i in 1...amount {
            for coin in coins {
                if i - coin >= 0 {
                    dp[i] = min(dp[i], dp[i - coin] + 1)
                }
            }
        }
        
        return dp[amount] > amount ? -1 : dp[amount]
    }
}
