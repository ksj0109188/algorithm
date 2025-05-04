//
//  Medium_Longest Common Subsequence.swift
//  BakJoon
//
//  Created by 김성준 on 7/8/24.
//

import Foundation

class Medium_Longest_Common_Subsequence {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
           let n = text1.count
           let m = text2.count
           
           var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
           
           let text1Array = Array(text1)
           let text2Array = Array(text2)
           
           for i in stride(from: n - 1, through: 0, by: -1) {
               for j in stride(from: m - 1, through: 0, by: -1) {
                   if text1Array[i] == text2Array[j] {
                       dp[i][j] = 1 + dp[i + 1][j + 1]
                   } else {
                       dp[i][j] = max(dp[i + 1][j], dp[i][j + 1])
                   }
               }
           }
           
           return dp[0][0]
       }
    
}
