//
//  LV2_연속부분수열합.swift
//  BakJoon
//
//  Created by 김성준 on 4/1/24.
//

import Foundation

class LV2연속부분수열합 {
    func solution(_ elements: [Int]) -> Int {
        let n = elements.count
        let extendedElements = elements + elements // 원형 수열을 확장
        var sums = Set<Int>()
        
        for start in 0..<n {
            var currentSum = 0
            for length in 0..<n {
                currentSum += extendedElements[length + start]
                sums.insert(currentSum)
            }
        }
       
        return sums.count
    }
}
