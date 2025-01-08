//
//  9252.swift
//  BakJoon
//
//  Created by 김성준 on 1/8/25.
//

import Foundation

class LCS2_9252 {
    func solution() {
        let firstString = Array(readLine()!)
        let secondString = Array(readLine()!)
        
        var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: firstString.count + 1), count: secondString.count + 1)
        
        var resultString = ""
        
        for i in 1...secondString.count {
                 for j in 1...firstString.count {
                     if secondString[i - 1] == firstString[j - 1] {
                         dp[i][j] = dp[i - 1][j - 1] + 1
                     } else {
                         dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                     }
                 }
             }
        
        print(dp[secondString.count][firstString.count])
        
        var x = secondString.count
        var y = firstString.count
        
        while x > 0 && y > 0 {
            if secondString[x - 1] == firstString[y - 1] {
                // 공통 문자를 결과 문자열에 추가
                resultString.append(secondString[x - 1])
                x -= 1
                y -= 1
            } else if dp[x - 1][y] > dp[x][y - 1] {
                x -= 1
            } else {
                y -= 1
            }
        }
        print(String(resultString.reversed()))
    }
}
