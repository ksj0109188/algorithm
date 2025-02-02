//
//  DDR.swift
//  BakJoon
//
//  Created by 김성준 on 2/2/25.
//

import Foundation

class DDR {
    let nearDirection: [Int: [Int]] = [1: [2, 4], 2:[1, 3], 3:[2, 4], 4:[1, 3]]
    
    func solution() {
        let arr = readLine()!.split(separator: " ").map{ Int($0)! }
        var leftFootPositions: [Int] = []
        var rightFootPositions: [Int] = []
        var result = 0
        
        for i in 0..<arr.count {
            guard arr[i] != 0 else { break }
            guard !leftFootPositions.isEmpty else {
                leftFootPositions.append(arr[i])
                result += 2
                continue
            }
            guard !rightFootPositions.isEmpty else {
                rightFootPositions.append(arr[i])
                result += 2
                continue
            }
            
            let currentLeftFootPosition = leftFootPositions.last!
            let currentRightFootPosition = rightFootPositions.last!
            
            if currentLeftFootPosition == arr[i] || currentRightFootPosition == arr[i] {
                result += 1
                continue
            }
            
            if nearDirection[currentLeftFootPosition]!.contains(arr[i]) {
                result += 3
                leftFootPositions.append(arr[i])
            } else if nearDirection[currentRightFootPosition]!.contains(arr[i]) {
                result += 3
                rightFootPositions.append(arr[i])
            }
        }
        
        print(result)
    }
}

class DDR2 {
    let cost = [
        [0, 2, 2, 2, 2],  // 0에서 이동하는 비용
        [2, 1, 3, 4, 3],  // 1에서 이동하는 비용
        [2, 3, 1, 3, 4],  // 2에서 이동하는 비용
        [2, 4, 3, 1, 3],  // 3에서 이동하는 비용
        [2, 3, 4, 3, 1]   // 4에서 이동하는 비용
    ]
    
    func solution() {
        let arr = readLine()!.split(separator: " ").map { Int($0)! }
        let n = arr.count - 1 // 마지막 0 제외
        
        var dp = Array(repeating: Array(repeating: Array(repeating: Int.max, count: 5), count: 5), count: n + 1)
        
        // 초기 상태: 두 발이 중앙(0,0)에 위치
        dp[0][0][0] = 0
        
        for step in 0..<n {
            let next = arr[step]
            
            for left in 0...4 {
                for right in 0...4 {
                    let prev = dp[step][left][right]
                    if prev == Int.max { continue }
                    
                    // 왼발을 움직일 경우
                    if right != next { // 두 발이 같은 위치에 있으면 안 됨
                        let moveCost = cost[left][next]
                        dp[step + 1][next][right] = min(dp[step + 1][next][right], prev + moveCost)
                    }
                    
                    // 오른발을 움직일 경우
                    if left != next {
                        let moveCost = cost[right][next]
                        dp[step + 1][left][next] = min(dp[step + 1][left][next], prev + moveCost)
                    }
                }
            }
        }
        
        // 마지막 단계에서 최소 힘을 찾음
        var result = Int.max
        for left in 0...4 {
            for right in 0...4 {
                result = min(result, dp[n][left][right])
            }
        }
        
        print(result)
    }
}
