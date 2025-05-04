//
//  Hard_DistinctSubsequences.swift
//  BakJoon
//
//  Created by 김성준 on 9/11/24.
//

import Foundation

class Hard115 {
    struct Position: Hashable {
        let i: Int
        let j: Int
    }
    
    func numDistinct(_ s: String, _ t: String) -> Int {
        var cache: [Position: Int] = [:]
        let s = Array(s)
        let t = Array(t)
        
        func dfs(_ i: Int, _ j:Int) -> Int {
            let position = Position(i: i, j: j)
            
            if j == t.count {
                return 1
            }
            if i == s.count {
                return 0
            }
            
            if cache[position] != nil {
                return cache[position]!
            }
            
            if s[i] == t[j] {
                cache[position] = dfs(i + 1, j + 1) + dfs(i + 1, j)
            } else {
                cache[position] = dfs(i + 1, j)
            }
            
            return cache[position] ?? 0
        }
        
        return dfs(0, 0)
    }
}

