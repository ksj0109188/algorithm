//
//  11404.swift
//  BakJoon
//
//  Created by 김성준 on 12/5/24.
//

import Foundation

class Ployd_11404 {
    let limitValue = 100_000_001
    func solution() {
        let n = Int(readLine()!)!
        let m = Int(readLine()!)!
        var dp: [[Int]] = .init(repeating: .init(repeating: limitValue, count: n), count: n)
        
        for i in 0..<n {
            dp[i][i] = 0
        }
        
        for _ in 0..<m {
            let input = readLine()!.split(separator: " ").map{Int($0)!}
            let from = input[0] - 1
            let to = input[1] - 1
            let weight = input[2]
            
            dp[from][to] = min(dp[from][to], weight)
        }
        
        floydWarshall(n: n, arr: dp).forEach({
            print($0.map{ String($0) }.joined(separator: " "))
        })
        
    }
    
    func floydWarshall(n: Int, arr: [[Int]]) -> [[Int]] {
        var newArr = arr
        
        for k in 0..<n {
            for i in 0..<n{
                for j in 0..<n {
                    if i == j || newArr[i][k] == limitValue || newArr[k][j] == limitValue {
                        continue
                    }
                    newArr[i][j] = min(newArr[i][j], newArr[i][k] + newArr[k][j])
                }
            }
        }
        
        //MARK: 도달할 수 없는 경우 0으로 체크
        for i in 0..<n {
            for j in 0..<n {
                if newArr[i][j] == limitValue {
                    newArr[i][j] = 0
                }
            }
        }
        
        return newArr
    }
}
