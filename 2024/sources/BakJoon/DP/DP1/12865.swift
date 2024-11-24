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
