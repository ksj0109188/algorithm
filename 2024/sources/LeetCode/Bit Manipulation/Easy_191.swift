//
//  Easy_191.swift
//  BakJoon
//
//  Created by 김성준 on 1/3/25.
//

import Foundation

class Solution_191 {
    func hammingWeight(_ n: Int) -> Int {
        let representation = Array(String(n, radix: 2))
        var left = 0
        var right = representation.count - 1
        
        var count = 0
        
        while left < right {
            if representation[left] == "1" {
                count += 1
            }
            if representation[right] == "1" {
                count += 1
            }
            
            left += 1
            right -= 1
        }
        
        if left == right && representation[left] == "1" {
            count += 1
        }
        
        return count
    }
}
