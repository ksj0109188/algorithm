//
//  1932.swift
//  BakJoon
//
//  Created by 김성준 on 10/25/24.
//

import Foundation

class IntTriangle_1932 {
    func solution() {
        let n = Int(readLine()!)!
        var arr: [[Int]] = []
        var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: n), count: n)
        let nextSteps = [(1,0), (1,1)]
        
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            
            arr.append(input)
        }
        
        dp[0][0] = arr[0][0]
        
        for i in 0..<arr.count {
            for j in 0..<arr[i].count {
                for nextStep in nextSteps {
                    let nx = i + nextStep.0
                    let ny = j + nextStep.1
                    
                    if (nx >= 0 && nx < arr.count) {
                        dp[nx][ny] = max(dp[nx][ny], arr[nx][ny] + dp[i][j] )
                    }
                }
            }
        }
        print(dp)
        print(dp.last?.max() ?? 0)
    }
}
