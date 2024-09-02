//
//  LV2_땅따먹기.swift
//  BakJoon
//
//  Created by 김성준 on 4/23/24.
//

import Foundation

class LV2_땅따먹기 {
    func solution(_ land:[[Int]]) -> Int{
        guard !land.isEmpty else { return -1 }
        
        let columnSize = 4
        var dp = [[Int]](repeating: [0, 0, 0, 0], count: land.count)
        dp[0] = land.first!
        
        for i in 1..<land.count{
            for j in 0...columnSize {
                if j == 0 {
                    dp[i][j] = land[i][j] + max(dp[i - 1][1], dp[i - 1][2], dp[i - 1][3])
                } else if j == 1 {
                    dp[i][j] = land[i][j] + max(dp[i - 1][0], dp[i - 1][2], dp[i - 1][3])
                } else if j == 2 {
                    dp[i][j] = land[i][j] + max(dp[i - 1][0], dp[i - 1][1], dp[i - 1][3])
                } else if j == 3 {
                    dp[i][j] = land[i][j] + max(dp[i - 1][0], dp[i - 1][1], dp[i - 1][2])
                }
            }
        }
     
        return dp.last?.max() ?? -1
    }
}
