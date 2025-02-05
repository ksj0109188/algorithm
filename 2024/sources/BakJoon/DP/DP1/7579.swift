//
//  7579.swift
//  BakJoon
//
//  Created by 김성준 on 2/5/25.
//

import Foundation

class 앱_7579 {
    ///note
    ///3 15
    ///10 20 25
    ///5 10 15

    
    
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let (n, m) = (input[0], input[1])
        let maxCost = 1_000_000_000
        let memories = readLine()!.split(separator: " ").map{ Int($0)! }
        let costs = readLine()!.split(separator: " ").map{ Int($0)! }
        var dp: [Int] = .init(repeating: maxCost, count: m + 1)
        dp[0] = 0
        
        
        for i in 0..<n {
            let memory = memories[i]
            let cost = costs[i]
            
            for j in stride(from: m, through: 0, by: -1) {
                let remain = j - memory
                
                print("j", j)
                print("memory", memory)
                print("remain", remain)
                if remain >= 0 {
                    print("dp[j] :", dp[j])
                    print("dp[remain] :", dp[remain])
                    print("cost", cost)
                    dp[j] = min(dp[j], dp[remain] + cost)
                }
                print("=================")
            }
        }
        
//        print(dp[10], dp[20], dp[30], dp[35], dp[40])
        print(dp[m])
    }
    
    func solution2() {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (n, m) = (input[0], input[1])
        let maxCost = 10_000_000_000
        let memories = readLine()!.split(separator: " ").map { Int($0)! }
        let costs = readLine()!.split(separator: " ").map { Int($0)! }
        
        let maxCostSum = costs.reduce(0, +)  // 최대 비용
        var dp = [Int](repeating: 0, count: maxCostSum + 1) // 비용을 인덱스로 하는 DP 배열
        
        var result = maxCostSum
        
        for j in 0..<n {
            let memory = memories[j]
            let cost = costs[j]
            
            // 🔥 핵심: 큰 인덱스부터 갱신하여 중복 계산 방지
            for i in stride(from: maxCostSum, through: cost, by: -1) {
                dp[i] = max(dp[i], dp[i - cost] + memory)
                
                // m 바이트 이상 확보 가능한 경우 최소 비용 갱신
                if dp[i] >= m {
                    result = min(result, i)
                }
            }
        }
        
        print(result)
    }
}
