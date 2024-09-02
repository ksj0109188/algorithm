//
//  LV2_숫자변환하기swift.swift
//  BakJoon
//
//  Created by 김성준 on 4/23/24.
//

import Foundation

class LV2_숫자변환하기 {
    // 틀림 -> DP를 활용해서 풀었어야함 가장 큰 연산인 Log3^1,000,000 의 시간 복잡도만 고려했음 하지만 각 선택지마다 3가지의 선택지가 있으므로 시간복잡도는 이것 보다 훨씬 큰 값이됨 총 선택지가 1,000,000번이 될 수있고 각 선택지가 3개 있으니 3^1,000,000 이 될 수 있을 거 같음 여기서 분기계수 개념이 사용되며 분기계수는 3(자식노드의 평균 수) 깊이는 n 즉 3^n이 시간복잡도가 됨
    
    // 분기 계수의 예시  DFS/BFS 탐색: 깊이 우선 탐색(DFS) 또는 너비 우선 탐색(BFS)에서 각 노드에서 취할 수 있는 행동의 수를 분기 계수라고 할 수 있습니다. 예를 들어, 게임에서 한 플레이어가 할 수 있는 모든 가능한 움직임의 수가 그 노드의 분기 계수가 됩니다.
    
    func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
        var result = Int.max
        
        func dfs(_ current: Int, _ target: Int, _ count: Int) {
            if current <= target {
                if current == target {
                    result = min(count, result)
                }
                
                dfs(current * 3, target, count + 1)
                dfs(current * 2, target, count + 1)
                dfs(current + n, target, count + 1)
            }
        }
        
        dfs(x, y, 0)
        
        return result == Int.max ? -1 : result
    }
    
    func solution2(_ x:Int, _ y:Int, _ n:Int) -> Int {
        var dp = [Int](repeating: Int.max, count: y + 1)
        dp[x] = 0 // start point
        
        for i in x...y {
            if dp[i] == Int.max {
                continue
            }
            if i + n <= y {
                dp[i + n] = min(dp[i + n], dp[i] + 1)
            }
            
            if i * 2 <= y {
                dp[i * 2] = min(dp[i * 2], dp[i] + 1)
            }
            
            if i * 3 <= y {
                dp[i * 3] = min(dp[i * 3], dp[i] + 1)
            }
            
        }
        
        return dp[y] == Int.max ? -1 : dp[y]
    }
}
