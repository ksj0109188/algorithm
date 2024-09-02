//
//  Medium_Combination.swift
//  BakJoon
//
//  Created by 김성준 on 5/12/24.
//

import Foundation

class Medium_Combination{
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var result: [[Int]] = []
        
        func dfs(_ first: Int, _ letters: [Int]) {
            if letters.count == k {
                result.append(letters)
                return
            }
            if first > n {
                return
            }
            
            for i in first...n {
                dfs(i + 1, letters + [i])
            }
        }
        
        dfs(1, [])
        
        return result
    }
}
