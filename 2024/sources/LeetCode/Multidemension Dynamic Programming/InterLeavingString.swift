//
//  InterLeavingString.swift
//  BakJoon
//
//  Created by 김성준 on 8/31/24.
//

import Foundation

struct Position: Hashable {
    let i: Int
    let j: Int
}

class InterLeavingString {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        guard s1.count + s2.count == s3.count else { return false }
          
        let s1 = Array(s1)
        let s2 = Array(s2)
        let s3 = Array(s3)
        var dp: [Position: Bool] = [:]
        
        func dfs(_ position: Position) -> Bool{
            let i = position.i
            let j = position.j
            if i == s1.count && j == s2.count { return true }
            
            if dp[position] != nil {
               return dp[position]!
            }
            
            if i < s1.count && s1[i] == s3[i + j] && dfs(Position(i: i + 1, j: j)) {
                return true
            }
            
            if j < s2.count && s2[j] == s3[i + j] && dfs(Position(i: i, j: j + 1)) {
                return true
            }
            
            dp[position] = false
            return false
        }
        
        return dfs(Position(i: 0, j: 0))
    }
}
