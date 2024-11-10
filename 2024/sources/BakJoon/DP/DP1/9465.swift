//
//  9465.swift
//  BakJoon
//
//  Created by 김성준 on 11/10/24.
//

import Foundation

func solution9465() {
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        var arr: [[Int]] = []
        let n = Int(readLine()!)!
        var dp = [[Int]](repeating: .init(repeating: 0, count: n), count: 2)
        
        for _ in 0..<2 {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            arr.append(input)
        }
        
        dp[0][0] = arr[0][0]
        dp[1][0] = arr[1][0]
        
        if n > 1 {
            dp[0][1] = arr[1][0] + arr[0][1]
            dp[1][1] = arr[0][0] + arr[1][1]
            
            for i in 2..<n {
                dp[0][i] = max(dp[1][i-1], dp[1][i-2]) + arr[0][i]
                dp[1][i] = max(dp[0][i-1], dp[0][i-2]) + arr[1][i]
            }
        }

        print(max(dp[0].last ?? 0, dp[1].last ?? 0))
    }
    
}
