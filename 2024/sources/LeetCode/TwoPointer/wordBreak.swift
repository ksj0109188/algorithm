//
//  wordBreak.swift
//  BakJoon
//
//  Created by 김성준 on 7/1/24.
//

import Foundation

class Medium_wordBreak {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let n = s.count
        let wordSet = Set(wordDict)
        var dp = Array(repeating: false, count: n + 1)
        dp[0] = true
        
        for i in 1...n {
            for j in 0..<i {
                let start = s.index(s.startIndex, offsetBy: j)
                let end = s.index(s.startIndex, offsetBy: i)
                let substring = String(s[start..<end])
                
                if dp[j] && wordSet.contains(substring) {
                    dp[i] = true
                    break
                }
            }
        }
        
        return dp[n]
    }
}
