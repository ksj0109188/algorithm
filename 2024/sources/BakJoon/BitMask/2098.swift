//
//  2098.swift
//  BakJoon
//
//  Created by 김성준 on 10/28/24.
//

import Foundation

/// 시간복잡도가 O(n!) -> 1조 3천억 번 수행
class TSP_2098 {
    func solution() {
        let n = Int(readLine()!)!
        var arr: [[Int]] = []
        
        for _ in 0..<n {
            arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
        }
        
        var minVal = Int.max
        
        for i in 0..<n {
            for j in 0..<n {
                var isVisited: [[Bool]] = .init(repeating: .init(repeating: false, count: arr.first?.count ?? 0), count: arr.count)
                if arr[i][j] != 0 {
                    dfs((i, j), (i, j), stepCount: 0, 0, isVisited: &isVisited)
                }
            }
        }
        
        print(minVal)
        
        func dfs(_ startPosition: (Int, Int), _ position: (Int, Int), stepCount: Int, _ sum: Int, isVisited: inout [[Bool]]) {
            guard stepCount < n else {
                if startPosition == position {
                    minVal = min(minVal, sum)
                }
                
                return
            }
            
            let nextSteps = [(-1, 0), (1, 0), (0, -1), (0, 1)]
            
            for nextStep in nextSteps {
                let nx = position.0 + nextStep.0
                let ny = position.1 + nextStep.1
                
                if (nx >= 0 && nx < arr.count) && (ny >= 0 && ny < arr.first!.count) {
                    if !isVisited[nx][ny] && arr[nx][ny] != 0 {
                        // 마지막에 여행이 아닌데 출발했던 도시로 돌아오는 것은 불가능
                        if stepCount + 1 < n && (nx,ny) == startPosition {
                            continue
                        }
                        
                        isVisited[nx][ny] = true
                        dfs(startPosition, (nx, ny), stepCount: stepCount + 1, sum + arr[nx][ny], isVisited: &isVisited)
                        isVisited[nx][ny] = false
                    }
                }
            }
        }
    }
}

///note: 비트마스킹과 동적 프로그램밍을 활용해서 풀이
class TSP_2098_2 {
    func solution() {
        let n = Int(readLine()!)!
        var arr: [[Int]] = []
        
        for _ in 0..<n {
            arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
        }
        
        // DP 배열: [현재 도시][방문 상태] = 최소 비용
        var dp = Array(repeating: Array(repeating: -1, count: 1 << n), count: n)
        
        // DFS + DP (메모이제이션)
        func dfs(_ current: Int, _ visited: Int) -> Int {
            // 모든 도시를 방문한 경우
            print("(1 << n) - 1 ==", (1 << n) - 1)
            if visited == (1 << n) - 1 {
                // 시작점(0)으로 돌아갈 수 있는 경우
                return arr[current][0] != 0 ? arr[current][0] : Int.max
            }
            
            // 이미 계산한 경우 재활용
            if dp[current][visited] != -1 {
                return dp[current][visited]
            }
            
            dp[current][visited] = Int.max
            
            // 다음 방문할 도시 선택
            for next in 0..<n {
                // 이미 방문했거나 갈 수 없는 경우 스킵
                if visited & (1 << next) != 0 || arr[current][next] == 0 {
                    continue
                }
                
                // 현재 도시에서 다음 도시로 가는 비용과
                // 다음 도시에서 나머지 도시들을 순회하는 최소 비용의 합
                let cost = dfs(next, visited | (1 << next))
                if cost != Int.max {
                    dp[current][visited] = min(
                        dp[current][visited],
                        cost + arr[current][next]
                    )
                }
            }
            
            return dp[current][visited]
        }
        
        // 0번 도시에서 시작, 0번 도시만 방문한 상태
        let result = dfs(0, 1 << 0)
        print(result)
    }
}
