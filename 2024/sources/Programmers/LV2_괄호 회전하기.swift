//
//  LV2_괄호 회전하기.swift
//  BakJoon
//
//  Created by 김성준 on 4/2/24.
//

import Foundation

class LV2괄호회전하기 {
    func solution(_ s:String) -> Int {
        var s = s
        var result = 0
        
        for _ in 0..<s.count {
            let frontCharacter = s.removeFirst()
            s.append(frontCharacter)
            if isPosibble(s) {
                result += 1
            }
        }
        
        return result
    }
    
//    func isPosibble(_ s: String) -> Bool {
//        var stack: [Character] = []
//        var keyMap = ["(" : ")", "[": "]", "{":"}"]
//        
//        for c in s {
//            if c == "(" || c == "[" || c == "{" {
//                stack.append(c)
//                continue
//            }
//            if !stack.isEmpty {
//                if let compare = keyMap[String(stack.removeLast())], compare == String(c) {
//                    continue
//                }
//            }
//            
//            return false
//        }
//        
//        return true
//    }
    
    func isPosibble(_ s: String) -> Bool {
        var stack: [Character] = []
        let keyMap: [Character: Character] = ["(" : ")", "[": "]", "{":"}"]

        for c in s {
            if let closeBracket = keyMap[c] {
                stack.append(closeBracket)
            } else if stack.isEmpty || stack.removeLast() != c {
               return false
            }
        }
        
        return stack.isEmpty
    }
}
