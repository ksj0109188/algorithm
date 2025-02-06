//
//  7579.swift
//  BakJoon
//
//  Created by 김성준 on 2/5/25.
//

import Foundation

class 앱_7579 {
    ///note: 이전 값을 다시 계산하는 이슈가 있었음 예를들어  현재 계산하려는 메모리가 20일 때, 메모리가 10이고 비용이 0인 것을 계산하려고 할 때, remain = 20 - 10 -> dp[remain==10]=0 이 이미 계산되어 있고 현재 메모리가 10이고 비용이 0이니 두번 중복되는 이슈가 있음
    func solution1() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let (n, m) = (input[0], input[1])
        let maxCost = 1_000_000_000
        let memories = readLine()!.split(separator: " ").map{ Int($0)! }
        let costs = readLine()!.split(separator: " ").map{ Int($0)! }
        var dp: [Int] = .init(repeating: maxCost, count: m + 1)
        dp[0] = 0
        
        for i in 0..<m + 1 {
            for j in 0..<n {
                let memory = memories[j] // 30 10 20 25 40
                let cost = costs[j]
                let remain = i - memory // 40 - 30 -> 10
                
                print("i", i)
                print("memory", memory)
                print("remain", remain)
                if remain >= 0 {
                    //                    if dp[i] == maxCost {
                    //                        dp[i] = cost
                    //                    }
                    print("dp[i] :", dp[i])
                    print("dp[remain] :", dp[remain])
                    print("cost", cost)
                    dp[i] = min(dp[i], dp[remain] + cost)
                }
                print("=================")
            }
        }
        print(dp[10], dp[20], dp[30], dp[35], dp[40])
        print(dp[m])
    }
    
    ///note dp를 메모리 크기일때 최소 비용으로 정의한다면 너무 비효율적이고 의미가 부정확함, -> 따라서 dp를 비용당 최대 메모리 할당 가능한 정수로 하면 될듯 -> Solution3
    /// 예제 케이스
    //3 15
    //10 20 25
    //5 10 15
    func solution2() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let (n, m) = (input[0], input[1])
        let maxCost = 1_000_000_000
        let memories = readLine()!.split(separator: " ").map{ Int($0)! }
        let costs = readLine()!.split(separator: " ").map{ Int($0)! }
        var dp: [Int] = .init(repeating: maxCost, count: m + 1)
        
        for i in 0..<n {
            let memory = memories[i]
            let cost = costs[i]
            // memory 10 -> 0 ~ 10까지 10의
            // j 10, 11 ,12 13 14 15
            for j in stride(from: m, through: memory, by: -1) {
                if dp[j] == maxCost {
                    dp[j] = cost
                } else {
                    dp[j] = min(dp[j], dp[j - memory] + cost)
                }
            }
        }
        
        print(dp)
        print(dp[m])
    }

    ///note: 문제에서 입력이 메모리의 크기는 최대 10,000,000이고 비용은 최대 크기가 100이고 길이는 최대 100 이므로 dp를 비용당 최대 메모리 해제 크기로 정의하는 게 좋다.
    //MARK: 최적화 버전
    func solution3() {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let (n, m) = (input[0], input[1])
        let maxCost = 10_000_000_000
        let memories = readLine()!.split(separator: " ").map { Int($0)! }
        let costs = readLine()!.split(separator: " ").map { Int($0)! }
        
        let maxCostSum = costs.reduce(0, +)  // 최대 비용
        var dp = [Int](repeating: 0, count: maxCostSum + 1) // 비용을 인덱스로 하는 DP 배열
        
        var result = Int.max
        
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

