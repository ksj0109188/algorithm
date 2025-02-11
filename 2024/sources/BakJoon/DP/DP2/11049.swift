//
//  11049.swift
//  BakJoon
//
//  Created by 김성준 on 2/11/25.
//

import Foundation

class 행렬곱셈순서_11049 {
    func exec() {
        let n = Int(readLine()!)!
        var matrices: [(Int, Int)] = []

        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            matrices.append((input[0], input[1]))
        }

        var dp = Array(repeating: Array(repeating: Int.max, count: n), count: n)
        
        // 자기 자신(한 개의 행렬만 있는 경우) → 곱셈 연산 필요 없음
        for i in 0..<n {
            dp[i][i] = 0
        }

        // 길이 2부터 n까지 증가시키면서 최소 곱셈 횟수 구하기
        for length in 2...n {
            for i in 0...(n - length) {
                let j = i + length - 1
                for k in i..<j {
                    let cost = dp[i][k] + dp[k+1][j] + matrices[i].0 * matrices[k].1 * matrices[j].1
                    dp[i][j] = min(dp[i][j], cost)
                }
            }
        }
        
        print(dp[0][n - 1])
    }
}
