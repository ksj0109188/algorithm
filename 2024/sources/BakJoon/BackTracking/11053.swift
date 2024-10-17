//
//  LIP.swift
//  BakJoon
//
//  Created by 김성준 on 10/16/24.
//

import Foundation

//가장 긴 증가하는 부분수열

class _11053 {
    func solution() {
        // 6
        // 10 20 30 15 25 35 의 경우 값이 {10, 15, 25, 35} -> 4가 나와야 하는데 5가 나옴
        // 중간에 선택을 안하는 경우의 수도 있음 따라서 모든 조합을 확인해야함
        let input = Int(readLine()!)!
        let arr = readLine()!.split(separator: " ").map{ Int($0)! }
        var dp = [Int](repeating: 1, count: arr.count)
        
        for i in stride(from: (arr.count - 1) - 1, through: 0, by: -1) {
            if arr[i] < arr[i + 1] {
                dp[i] = dp[i + 1] + 1
            } else {
                dp[i] = dp[i + 1]
            }
        }
        
        print( dp.max() ?? 1)
    }
    
    func solution2() {
        // 중간에 선택을 안하는 경우의 수도 있음 따라서 모든 조합을 확인해야함
        let n = Int(readLine()!)!
        let arr = readLine()!.split(separator: " ").map{ Int($0)! }
        var dp = [Int](repeating: 1, count: arr.count)
        
        for i in 0..<n {
            for j in 0...i {
                if arr[i] > arr[j] {
                    dp[i] = max(dp[i], dp[j] + 1)
                }
            }
        }
        
        print( dp.max() ?? 1)
    }
    
}
