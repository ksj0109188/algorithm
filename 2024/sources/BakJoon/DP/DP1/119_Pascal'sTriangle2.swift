//
//  119_Pascal'sTriangle2.swift
//  BakJoon
//
//  Created by 김성준 on 3/12/24.
//

import Foundation

class Solution119 {
    func getRow(_ rowIndex: Int) -> [Int] {
        var dp = [Int](repeating: 1, count: rowIndex+1)
        
        for i in 0..<rowIndex {
            for j in stride(from: i, to: 0, by: -1) {
                dp[j] += dp[j-1]
            }
        }
        
        return dp
    }
}

