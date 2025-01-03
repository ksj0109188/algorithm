//
//  Easy_190.swift
//  BakJoon
//
//  Created by 김성준 on 1/3/25.
//

import Foundation

class Solution_190 {
    func reverseBits(_ n: Int) -> Int {
        var result = 0
        var number = n
        
        for _ in 0..<32 {
            result = (result << 1) | (number & 1)
            
            number >>= 1
        }
        
        return result
    }
}
