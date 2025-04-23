//
//  2504.swift
//  BakJoon
//
//  Created by 김성준 on 4/23/25.
//

import Foundation

class 괄호계산_2504 {
    func exec() {
        let str = Array(readLine()!)
        var stack: [Character] = []
        var temp = 1
        var result = 0
        var prev: Character = " "
        
        for i in 0..<str.count {
            let char = str[i]
            
            if char == "(" {
                stack.append(char)
                temp *= 2
            } else if char == "[" {
                stack.append(char)
                temp *= 3
            } else if char == ")" {
                if stack.isEmpty || stack.last! != "(" {
                    result = 0
                    break
                }
                if prev == "(" {
                    result += temp
                }
                stack.removeLast()
                temp /= 2
            } else if char == "]" {
                if stack.isEmpty || stack.last! != "[" {
                    result = 0
                    break
                }
                if prev == "[" {
                    result += temp
                }
                stack.removeLast()
                temp /= 3
            }
            prev = char
        }
        
        if !stack.isEmpty {
            print(0)
        } else {
            print(result)
        }
    }
    
    func exec2() {
        var stack: [Character] = []
        var valueStack: [Int] = []
        let str = Array(readLine()!)
        var result = 0
        
        for char in str {
            if char == "(" || char == "[" {
                stack.append(char)
                valueStack.append(0)  // 중첩값 초기화
            } else if char == ")" || char == "]" {
                if stack.isEmpty {
                    result = 0
                    break
                }
                let opening = stack.removeLast()
                let value = valueStack.removeLast()
                
                let expectedOpening: Character = (char == ")") ? "(" : "["
                let multiplier = (char == ")") ? 2 : 3
                
                if opening != expectedOpening {
                    result = 0
                    break
                }
                
                let innerValue = value == 0 ? 1 : value
                if valueStack.isEmpty {
                    result += innerValue * multiplier
                } else {
                    valueStack[valueStack.count - 1] += innerValue * multiplier
                }
            }
        }
        
        print(result)
    }
}
