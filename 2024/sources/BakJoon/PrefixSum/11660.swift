//
//  11660.swift
//  BakJoon
//
//  Created by 김성준 on 11/10/24.
//

import Foundation

func solution11660() {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let n = input[0]
    let m = input[1]
    
    var arr: [[Int]] = []
    var prefixSum: [[Int]] = .init(repeating: .init(repeating: 0, count: n + 1), count: n + 1)
    
    for i in 0..<n {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        arr.append(input)
    }
    
    for i in 1..<n + 1 {
        for j in 1..<n + 1 {
            prefixSum[i][j] = prefixSum[i - 1][j] + prefixSum[i][j - 1] - prefixSum[i - 1][j - 1] + arr[i - 1][j - 1]
        }
    }
    
    for i in 0..<m {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let x1 = input[0]
        let y1 = input[1]
        let x2 = input[2]
        let y2 = input[3]
        
        let sum = prefixSum[x2][y2] - prefixSum[x2][y1 - 1] - prefixSum[x1 - 1][y2] + prefixSum[x1 - 1][y1 - 1]
        
        print(sum)
    }
    
}
