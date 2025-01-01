//
//  Easy_392.swift
//  BakJoon
//
//  Created by 김성준 on 12/31/24.
//

import Foundation

class Solution_392 {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        let t = Array(t)
        let s = Array(s)
        var pointer = 0

        for i in 0..<t.count {
            guard pointer < s.count else { return true }
            
            if s[pointer] == t[i] {
                pointer += 1
            }
        }
        
        return pointer == s.count ? true : false
    }
}
