//
//  LongestIncreasingPath.swift
//  BakJoon
//
//  Created by 김성준 on 9/3/24.
//

import Foundation

class LongestIncreasingPath {
    struct Path: Hashable {
        let i: Int
        let j: Int
        let element: Int
    }
    
    func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
        var dp: [Path: Int] = [:]
       
        func dfs(_ i: Int, _ j: Int, _ prev: Path) -> Int {
            if i < 0 || i >= matrix.count || j < 0 || j >= matrix[0].count
                || matrix[i][j] <= prev.element {
                return 0
            }
                
            let current = Path(i: i, j: j, element: matrix[i][j])
            
            //캐싱되어 있으면 그 이하 로직은 탐색 안해야 하지...
            if dp[current] != nil {
                return dp[current]!
            }
            
            var result = 1
            result = max(result, 1 + dfs(i - 1, j, current))
            result = max(result, 1 + dfs(i + 1, j, current))
            result = max(result, 1 + dfs(i, j - 1, current))
            result = max(result, 1 + dfs(i, j + 1, current))
            
            dp[current] = result
            
            return result
        }
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                dfs(i, j, Path(i: i, j: j, element: -1))
            }
        }
        
        return dp.values.max()!
    }
}
