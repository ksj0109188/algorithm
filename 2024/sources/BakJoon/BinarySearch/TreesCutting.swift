//
//  TreesCutting.swift
//  BakJoon
//
//  Created by 김성준 on 9/19/24.
//

import Foundation

struct TreesCutting {
    func solution() {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let _ = input[0]
        let m = input[1]
        
        let trees = readLine()!.split(separator: " ").map{Int($0)!}
        var left = 0
        var right = trees.max()!
        var result = 0
        
        while left <= right {
            let mid = (left + right) / 2
            let sum = calculateTrees(trees: trees, height: mid)
            
            if sum >= m {
                result = mid
                left = mid + 1
            } else if sum < m {
                right = mid - 1
            }
        }
        
        print(result)
    }
    
    func calculateTrees(trees: [Int], height: Int) -> Int {
        return trees.reduce(0){ $0 + max(0, $1 - height) }
    }
    
    
}

//4 7
//20 15 10 17
