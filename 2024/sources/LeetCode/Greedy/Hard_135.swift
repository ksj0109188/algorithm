//
//  Hard_135.swift
//  BakJoon
//
//  Created by 김성준 on 1/21/25.
//

import Foundation

// MARK: 난 초기 이 문제를 DP라 막연히 생각했었음. -> DP 알고리즘의 본질을 다시 생각해보면 아니란걸 알 수 있음.
class Hard_135 {
    func candy(_ ratings: [Int]) -> Int {
        let n = ratings.count
        guard n > 0 else { return 0 }
        
        // 모든 아이들에게 최소 1개의 사탕을 배분
        var candies = Array(repeating: 1, count: n)
        
        // 왼쪽에서 오른쪽으로 탐색
        for i in 1..<n {
            if ratings[i] > ratings[i - 1] {
                candies[i] = candies[i - 1] + 1
            }
        }
        
        // 오른쪽에서 왼쪽으로 탐색
        for i in stride(from: n - 2, through: 0, by: -1) {
            if ratings[i] > ratings[i + 1] {
                candies[i] = max(candies[i], candies[i + 1] + 1)
            }
        }
        
        // 총 사탕 수를 반환
        return candies.reduce(0, +)
    }
}
