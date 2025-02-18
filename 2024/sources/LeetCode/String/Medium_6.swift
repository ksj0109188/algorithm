//
//  Medium_6.swift
//  BakJoon
//
//  Created by 김성준 on 2/18/25.
//

import Foundation

class Medium_6 {
    func convert(_ s: String, _ numRows: Int) -> String {
        var rows: [[String]] = .init(repeating: .init(repeating: " ", count: 0), count: numRows)
        let letters = Array(s)
        var result = ""
        var i = 0
        var isDown = true
        
        guard numRows > 1 else {
            return s
        }
        
        for letter in letters {
            print(i)
            rows[i].append(String(letter))
            
            (i, isDown) = nextStep(i, isDown, numRows)
        }
        
        rows.forEach{
            result += $0.joined()
        }
        
        return result
    }
    
    func nextStep(_ i: Int, _ isDown: Bool, _ size: Int) -> (Int, Bool) {
        var i = i
        var isDown = isDown
        
        // MARK: 이게 더 안전한 코드인듯
        //            if i == numRows - 1 && isDown {
        //                    isDown = false
        //                } else if i == 0 && !isDown {
        //                    isDown = true
        //                }
        //                if isDown {
        //                    i += 1
        //                } else {
        //                    i -= 1
        //
        //                }
        if isDown {
            i += 1
        } else {
            i -= 1
        }
        
        if i == size {
            i -= 2
            isDown = false
        } else if i < 0 {
            i += 2
            isDown = true
        }
        
        return (i, isDown)
    }
}
