//
//  implements.swift
//  BakJoon
//
//  Created by 김성준 on 3/14/24.
//

import Foundation

class bakjun1015 {
    func solve() -> Int {
        let firstLine = readLine()!
        let parts = firstLine.split(separator: " ").compactMap { Int($0) }
        let n = parts[0]
        let m = parts[1]
        var matrix = [[Int]]()

        for _ in 0..<n {
            let row = readLine()!.compactMap { Int(String($0)) }
            matrix.append(row)
        }
        
        var maxSize = 0
        
        for i in 0..<n {
            for j in 0..<m {
                for size in 0..<min(n - i, m - j) {
                    if matrix[i][j] == matrix[i][j + size] &&
                        matrix[i][j] == matrix[i + size][j] &&
                        matrix[i][j] == matrix[i + size][j + size] {
                        maxSize = max(maxSize, size + 1)
                    }
                }
            }
        }
        
        return maxSize * maxSize
    }
//    func solve(_ n: Int, _ m: Int, _ matrix: [[Int]]) -> Int {
//        var maxValue = 0
//        
//        for i in 0..<n {
//            for j in 0..<m {
//                for k in 0..<min(n,m){
//                    if i+k < n && j+k < m {
//                        if matrix[i][j] == matrix[i][j+k] &&
//                            matrix[i][j+k] == matrix[i+k][j] &&
//                            matrix[i+k][j] == matrix[i+k][j+k] {
//                            maxValue = max(maxValue, k+1)
//                        }
//                    }
//                }
//            }
//        }
//        
//        return maxValue * maxValue
//    }
}


