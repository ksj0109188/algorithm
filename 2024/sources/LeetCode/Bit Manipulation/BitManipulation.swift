//
//  BitManipulation.swift
//  BakJoon
//
//  Created by 김성준 on 1/3/25.
//

import Foundation

class Easy_67_AddBinary {
    // 64bit 이상의 자릿수는 에러 발생
//    func addBinary(_ a: String, _ b: String) -> String {
//        let input1 = Int(a, radix: 2)!
//        let input2 = Int(b, radix: 2)!
//
//        return String(input1 + input2, radix: 2)
//    }
    
    func addBinary(_ a: String, _ b: String) -> String {
        let a = Array(a)
        let b = Array(b)
        var i = a.count - 1
        var j = b.count - 1
        var carry = 0
        var result: String = ""
        
        while i >= 0 || j >= 0 || carry > 0 {
            let aBit = i >= 0 ? Int(String(a[i]))! : 0
            let bBit = j >= 0 ? Int(String(b[j]))! : 0
            let total = aBit + bBit + carry
            
            result.insert(contentsOf: String("\(total % 2)"), at: result.startIndex)
            carry = total / 2
            i -= 1
            j -= 1
        }
        
        return result
    }
}
