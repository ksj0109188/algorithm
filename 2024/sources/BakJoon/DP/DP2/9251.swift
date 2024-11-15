//
//  9251.swift
//  BakJoon
//
//  Created by 김성준 on 11/16/24.
//

import Foundation

class LCS9251{
    func solution() {
        let string1 = Array(readLine()!)
        let string2 = Array(readLine()!)
        
        var dp: [[Int]] = .init(repeating: [Int](repeating: 0, count: string2.count + 1), count: string1.count + 1)
        
        for i in stride(from: string1.count - 1 , through: 0, by: -1) {
            for j in stride(from: string2.count - 1 , through: 0, by: -1 ){
                if string1[i] == string2[j] {
                    dp[i][j] = dp[i + 1][j + 1] + 1
                } else {
                    dp[i][j] = max(dp[i + 1][j], dp[i][j + 1])
                }
            }
        }
        
        print(dp[0][0])
    }
}
