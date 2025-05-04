//
//  Easy_1137.swift
//  BakJoon
//
//  Created by 김성준 on 4/24/25.
//

import Foundation

class Easy_1137{
    func tribonacci(_ n: Int) -> Int {
        if n < 3 {
            if n == 0 {
                return 0
            } else {
                return 1
            }
        }
        
        var dp: [Int] = .init(repeating: 0, count: n + 1)
        dp[0] = 0
        dp[1] = 1
        dp[2] = 1

        for i in 3...n {
            dp[i] = dp[i - 3] + dp[i - 2] + dp[i - 1]
        }

        return dp[n]
    }
}
