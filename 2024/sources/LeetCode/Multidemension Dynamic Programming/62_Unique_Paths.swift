//
//  62_Unique_Paths.swift
//  BakJoon
//
//  Created by 김성준 on 7/8/24.
//

import Foundation

class Unique_Paths {
    // m: row, n : col
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var row = [Int](repeating: 1, count: n)
        
        for _ in 0..<m - 1{
            var newRow = [Int](repeating: 1, count: n)
            
            for j in stride(from: n - 2, through: 0, by: -1) {
                newRow[j] = newRow[j + 1] + row[j]
            }
            
            row = newRow
        }
        
        return row[0]
    }
}
