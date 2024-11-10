//
//  PascalTriangle_118.swift
//  BakJoon
//
//  Created by 김성준 on 3/11/24.
//

import Foundation

class Solution118 {
    func generate(_ numRows: Int) -> [[Int]] {
        guard numRows > 2 else {
            if numRows == 1 {
                return [[1]]
            } else {
                return [[1], [1, 1]]
            }
        }
        
        var dp : [[Int]] = []
        dp.insert([1], at: 0)
        dp.insert([1,1], at: 1)
        
        for i in 2..<numRows {
            dp.insert([dp[i-1][0]], at: i)
            
            for j in 1..<i {
                dp[i].append(dp[i-1][j-1] + dp[i-1][j])
            }
            
            dp[i].append(dp[i-1].last!)
        }
        return dp
    }
}
