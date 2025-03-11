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
                    print("length", length)
                    print("i", i)
                    print("j", j)
                    print("k", k)
                    let cost = dp[i][k] + dp[k+1][j] + matrices[i].0 * matrices[k].1 * matrices[j].1
                    dp[i][j] = min(dp[i][j], cost)
                }
            }
        }
        
        print(dp[0][n - 1])
    }
}


class Review_행렬곱_11049 {
    func exec() {
        let n = Int(readLine()!)!
        var matrix: [(r: Int, c: Int)] = []
        var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: n), count: n)
        
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let (r, c) = (input[0], input[1])
            matrix.append((r, c))
        }
        
        for i in 0..<n {
            dp[i][i] = 0
        }
        
        print("---------")
        // 문제풀이 접근 방법을 암기식으로 하다보니 해당 점화식과 반복문 정의를 하지못함.
        for length in 2...n {
            for i in 0...(n - length) {
                let j = i + length - 1
                for k in i..<j {
                    let cost = dp[i][k] + dp[k + 1][j] + matrix[i].r * matrix[k].c * matrix[j].c
                    dp[i][j] = min(dp[i][j], cost)
                }
            }
        }
        
        print(dp[0][dp.count - 1])
    }
}
