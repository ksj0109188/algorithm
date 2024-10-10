//
//  KaKaoMobility.swift
//  BakJoon
//
//  Created by 김성준 on 10/9/24.
//

import Foundation

class KaKaoMobility {
    func solution(_ A: inout [Int]) -> Int {
         let N = A.count / 2
         var dp = Array(repeating: 1, count: N)
         var lastIndex = [Int: Int]()
         var maxChain = 0

         for i in 0..<N {
             let left = A[2*i]
             let right = A[2*i + 1]
             
             if let prev = lastIndex[left] {
                 dp[i] = dp[prev] + 1
             }
             
             lastIndex[right] = i
             maxChain = max(maxChain, dp[i])
         }

         return N - maxChain
     }
    
    // N^2 풀이
//    func solution(_ A: inout [Int]) -> Int {
//         let N = A.count / 2  // 도미노 개수
//         var dp = Array(repeating: 1, count: N)  // DP 테이블 초기화, 각 도미노는 자기 자신만으로도 연결될 수 있으므로 초기값 1
//
//         // DP를 이용해 최장 연결 수열 계산
//         for i in 1..<N {
//             for j in 0..<i {
//                 // 이전 도미노의 오른쪽 값과 현재 도미노의 왼쪽 값이 같다면
//                 if A[2 * j + 1] == A[2 * i] {
//                     dp[i] = max(dp[i], dp[j] + 1)  // 연결이 가능하므로 dp 값을 갱신
//                 }
//             }
//         }
//
//         // 최장 연결 수열의 길이
//         let longestChain = dp.max() ?? 1
//         return N - longestChain  // 전체 도미노에서 최장 연결된 도미노 수열을 뺀 값이 삭제해야 할 도미노 수
//     }
}
