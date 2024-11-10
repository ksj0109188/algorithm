//
//  FiboNacci.swift
//  BakJoon
//
//  Created by 김성준 on 3/7/24.
//

import Foundation

class Soltion_509 {
    func fib(_ n: Int) -> Int {
        var dp = Array<Int>(repeating: -1, count: n+1)
        dp[0] = 0
        
        if n < 1 {
            return dp[n]
        }
        
        for i in 1...n {
            if i <= 2 {
                dp[i] = 1
                continue
            }
            dp[i] = dp[i-2] + dp[i-1]
        }
        
        return dp[n]
    }
}

