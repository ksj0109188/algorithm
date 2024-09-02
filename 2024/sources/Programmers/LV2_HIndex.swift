//
//  LV2_HIndex.swift
//  BakJoon
//
//  Created by 김성준 on 4/5/24.
//

import Foundation

class LV2_HIndex {
//    func solution(_ citations:[Int]) -> Int {
//        let sortedCitations = citations.sorted(by: <)
//        var result = 0
//        
//        for i in 0..<sortedCitations.count {
//            let citiation = sortedCitations[i]
//            
//            if sortedCitations.count - i >=  citiation
//                && i <= citiation
//            {
//                result = max(result, citiation)
//            }
//        }
//        return result
//    }
        
    func solution(_ citations:[Int]) -> Int {
        var result = 0
        let n = citations.count
        
        for i in 0..<n {
            var bigNumber = 0
            var lessNumber = 0
            
            for j in 0..<n {
                if citations[j] >= citations[i] {
                    bigNumber += 1
                } else if citations[j] <= citations[i] {
                    lessNumber += 1
                }
            }
            
            if citations[i] <= bigNumber && citations[i] >= lessNumber {
                result = max(result, citations[i])
            }
        }
        
        return result
    }
}
//count 5
//index 0 1 2 3 4
//list  1 3 3 5 6
