//
//  Medium_Letter Combinations.swift
//  BakJoon
//
//  Created by 김성준 on 5/8/24.
//

import Foundation

class Medium_Letter_Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else {
            return []
        }
        
        let letters = ["","","abc","def","ghi","jkl", "mno", "pqrs", "tuv", "wxyz"]
        
        var result: [String] = []

        func bt(_ index: Int, _ letter: String) {
            if letter.count == digits.count {
                result.append(letter)
                return
            }
            let letterIndex = Int(String(digits[String.Index(utf16Offset: index, in: digits)]))!
            
            for char in letters[letterIndex] {
                bt(index + 1, letter + String(char))
            }
        }
        
        let firstNumber = digits.first.map{ Int(String($0))!}
        bt(0, "")
        
        return result
    }
}
