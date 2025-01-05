//
//  137.swift
//  BakJoon
//
//  Created by 김성준 on 1/5/25.
//

import Foundation

class Medium_137 {
    func singleNumber(_ nums: [Int]) -> Int {
        var ones = 0
        var twos = 0
        
        for num in nums {
            twos |= ones & num
            ones ^= num
            
            let threes = ones & twos
            
            twos &= ~threes
            ones &= ~threes
        }
        
        return ones
    }
}
