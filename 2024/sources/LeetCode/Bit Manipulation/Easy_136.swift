//
//  Easy_136.swift
//  BakJoon
//
//  Created by 김성준 on 1/4/25.
//

import Foundation

class Solution_136 {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0

        for num in nums {
            result ^= num
        }

        return result
    }
}
