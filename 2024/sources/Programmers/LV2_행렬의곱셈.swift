//
//  LV2_행렬의곱셈.swift
//  BakJoon
//
//  Created by 김성준 on 4/12/24.
//

import Foundation

class LV2_행렬곱셈 {
    func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
        let rows = arr1.count
        let cols = arr2[0].count
        let common = arr1[0].count
        
        var result = Array(repeating: Array(repeating: 0, count: cols), count: rows)
        
        for i in 0..<rows {
            for j in 0..<cols {
                for k in 0..<common {
                    result[i][j] += arr1[i][k] * arr2[k][j]
                }
            }
        }
        
        return result
    }
}
