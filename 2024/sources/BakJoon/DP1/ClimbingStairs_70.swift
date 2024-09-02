//
//  ClimbingStairs_70.swift
//  BakJoon
//
//  Created by 김성준 on 3/10/24.
//

import Foundation

// Each time you can either climb 1 or 2 steps.

class Solution70 {
    func climbStairs(_ n: Int) -> Int {
        guard n > 1 else { return 1 }
        var dp = [Int](repeating: -1, count: n + 1)
        dp[0] = 1
        dp[1] = 1
        
        for i in 2...n {
            dp[i] = dp[i-2] + dp[i-1]
        }
        
        return dp[n]
    }
}




func solution() {
    let n = Int(readLine()!)!

    for i in 0..<n {
        var result = ""
        let voteNumber = Int(readLine()!)!
        let stringPlus = voteNumber / 5
        let remain = voteNumber % 5
        
        for i in 0..<stringPlus {
            result += "++++"
            result += " "
        }

        for i in 0..<remain {
            result += "|"
        }

        print(result)
    }
    
}
