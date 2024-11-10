//
//  Naver_성냥.swift
//  BakJoon
//
//  Created by 김성준 on 3/11/24.
//

import Foundation

class Naver02 {
    let matchCounts = [6, 2, 5, 5, 4, 5, 6, 3, 7, 6] // 숫자 0~9를 만드는데 필요한 성냥개비 수
       
       func solve(k: Int) -> Int {
           var dp = [Int](repeating: 0, count: k + 1)
           dp[0] = 1 // 성냥개비 0개로 만들 수 있는 조합의 수는 1 (아무것도 만들지 않는 경우)
           
           for currentMatches in 1...k {
               for matches in matchCounts {
                   if currentMatches - matches >= 0 {
                       dp[currentMatches] += dp[currentMatches - matches]
                   }
               }
           }
           
           return dp[k]
       }
}

class Naver03 {
    let matchCounts: [Int: Int] = [0: 6, 1: 2, 2: 5, 3: 5, 4: 4, 5: 5, 6: 6, 7: 3, 8: 7, 9: 6]
    
    func findCombinations(_ k: Int, _ combination: [Int] = []) -> Set<[Int]> {
        if k == 0 {
            return [combination]
        } else if k < 0 {
            return []
        }
        
        var results = Set<[Int]>()
        for (num, matchCount) in matchCounts {
            if matchCount <= k {
                let newCombinations = findCombinations(k - matchCount, combination + [num])
                for combo in newCombinations {
                    results.insert(combo)
                }
            }
        }
        return results
    }
    
    func solve(k: Int) -> Set<[Int]> {
        return findCombinations(k)
    }
}
