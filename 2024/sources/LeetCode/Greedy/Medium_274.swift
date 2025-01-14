//
//  Medium_274.swift
//  BakJoon
//
//  Created by 김성준 on 1/14/25.
//

import Foundation

//MARK: 문제를 100% 이해하지 못한 상태에서 풀음
class Medium_274 {
    // MARK: O(n)2 풀이 오답
    func hIndex2(_ citations: [Int]) -> Int {
            var result = 0
            let n = citations.count

            for i in 0..<n {
                var count = 0

                for j in 0..<n {
//                    print("i, j : \(i), \(j)")
//                    print("citations[j], citations[i]", citations[j], citations[i])
                    if citations[j] >= citations[i] {
                        count += 1
                    }
                }

                if count >= citations[i] {
                    result = max(result, citations[i])
                }
            }

            return result
        }
    
    func hIndex(_ citations: [Int]) -> Int {
        let sortedCitations = citations.sorted(by: >)
        var hIndex = 0
        
        for i in 0..<sortedCitations.count {
            if sortedCitations[i] >= i + 1 {
                hIndex = i + 1
            } else {
                break
            }
        }
        
        return hIndex
    }
}
