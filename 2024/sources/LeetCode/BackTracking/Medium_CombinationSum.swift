//
//  Medium_CombinationSum.swift
//  BakJoon
//
//  Created by 김성준 on 5/12/24.
//

import Foundation

class Medium_CombinationSum {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
//        var result: [[Int]] = []
//        
//        func bt(_ candidate: [Int], _ sum:Int){
//            if sum >= target {
//                if sum == target {
//                    var candidate = candidate.sorted()
//                    if !result.contains(candidate) {
//                        result.append(candidate)
//                    }
//                } else {
//                    return
//                }
//            }
//            
//            for num in candidates {
//                bt(candidate + [num], sum + num)
//            }
//        }
//        
//        bt([], 0)
//        
//        return result
        
        var result: [[Int]] = []
        let candidates = candidates.sorted()
        
        func dfs(_ start: Int, _ currentCombination: [Int], _ currentSum: Int) {
            if currentSum == target {
                result.append(currentCombination)
                return
            }
            if currentSum > target {
                return
            }
            
            for i in start..<candidates.count {
                let num = candidates[i]
                dfs(i, currentCombination + [num], currentSum + num)
            }
        }
        
        dfs(0, [], 0)
        return result
    }
}
