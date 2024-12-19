//
//  12865.swift
//  BakJoon
//
//  Created by 김성준 on 11/24/24.
//

import Foundation

class 평범한배낭_12865 {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let n = input[0]
        let k = input[1]
        var items : [(w:Int, v:Int)] = []
        
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let w = input[0]
            let v = input[1]
            
            items.append((w: w, v: v))
        }
        
        start1DP(n: n, k: k, items: items)
    }
    
    func start1DP(n: Int, k: Int, items: [(w:Int, v:Int)]) {
        // dp[i] -> 현재 무게일때 최대 가치
        var dp: [Int] = .init(repeating: 0, count: k + 1)
        var items = items.sorted(by: {$0.w < $1.w})
        
        for i in 0..<n {
            let w = items[i].w // 3
            let v = items[i].v // 6
            
            for j in stride(from: k, through: w, by: -1) {
                print("w, v, k : ", w, v, k)
                print("j - w", j - w)
                dp[j] = max(dp[j - w] + v, dp[j])
                print(dp)
            }
        }
        
        print(dp[k])
    }
}

class 평범한배낭_12865_2 {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let n = input[0]
        let k = input[1]
        var items: [(weight: Int, value: Int)] = []
        var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: k + 1), count: n + 1)
        
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let weight = input[0]
            let value = input[1]
            
            items.append((weight: weight, value: value))
        }
        
        
        for i in 1...n {
            let item = items[i - 1]
            
            for j in 1...k {
                if item.weight <= j {
                    dp[i][j] = max(dp[i - 1 ][j], dp[i - 1][j - item.weight] + item.value)
                } else {
                    dp[i][j] = dp[i-1][j]
                }
            }
        }
        
        print(dp[n][k])
    }
}
