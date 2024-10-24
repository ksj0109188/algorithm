//
//  RGB.swift
//  BakJoon
//
//  Created by 김성준 on 10/21/24.
//

import Foundation

class RGB1149 {
    func solution() {
        let n = Int(readLine()!)!
        var arr : [[Int]] = []
        
        for _ in 0..<n {
            let costs = readLine()!.split(separator: " ").map{ Int($0)! }
            
            arr.append(costs)
        }
        
        var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: arr.first?.count ?? 3), count: arr.count)
        dp[0] = arr.first ?? []
        
        for i in 1..<n {
            dp[i][0] = arr[i][0] + min(dp[i - 1][1], dp[i - 1][2])
            dp[i][1] = arr[i][1] + min(dp[i - 1][0], dp[i - 1][2])
            dp[i][2] = arr[i][2] + min(dp[i - 1][0], dp[i - 1][1])
        }
        
        print(dp.last?.min() ?? -1)
    }
}
