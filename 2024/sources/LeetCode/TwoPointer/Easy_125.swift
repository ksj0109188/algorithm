//
//  Easy_125.swift
//  BakJoon
//
//  Created by 김성준 on 12/31/24.
//

import Foundation

class Solution_125 {
    func isPalindrome(_ s: String) -> Bool {
        let newChar = s.filter{ $0.isLetter || $0.isNumber }.map{ $0.lowercased() }
        print(newChar)
        var forward = 0
        var backward = newChar.count - 1
        
        guard newChar.count > 1 else { return true }
        guard forward != backward else { return false }
        
        while forward < backward {
            if newChar[forward] == newChar[backward] {
                forward += 1
                backward -= 1
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isPalindrome2(_ s: String) -> Bool {
        let filtered = s.lowercased().filter { $0.isLetter || $0.isNumber }
        return filtered == String(filtered.reversed())
    }
}
