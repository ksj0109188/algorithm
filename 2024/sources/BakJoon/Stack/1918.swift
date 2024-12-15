//
//  1918.swift
//  BakJoon
//
//  Created by 김성준 on 12/15/24.
//

import Foundation

class 후위표기식_1918 {
    func solution() {
        let input = String(readLine()!)
        print(infixToPostfix(input))
        
//        let testCase1 = "A*(B+C)"
//        let testCase2 = "A+B"
//        let testCase3 = "A+B*C"
//        let testCase4 = "A+B*C-D/E"
//
//        print(infixToPostfix(testCase1))
//        print(infixToPostfix(testCase2))
//        print(infixToPostfix(testCase3))
//        print(infixToPostfix(testCase4))
        
    }
    
    func infixToPostfix(_ expression: String) -> String {
        // 연산자 우선순위 정의
        let precedence: [Character: Int] = ["+": 1, "-": 1, "*": 2, "/": 2, "(": 0]
        var operatorStack: [Character] = [] // 연산자를 담는 스택
        var postfix: [Character] = []      // 결과를 담는 배열 (후위 표기식)

        for char in expression {
            if char.isLetter { // 피연산자
                postfix.append(char)
            } else if char == "(" {
                operatorStack.append(char)
            } else if char == ")" {
                while let top = operatorStack.last, top != "(" {
                    postfix.append(operatorStack.removeLast())
                }
                operatorStack.popLast() // 여는 괄호 제거
            } else { // 연산자 (+, -, *, /)
                while let top = operatorStack.last, precedence[top] ?? 0 >= precedence[char] ?? 0 {
                    postfix.append(operatorStack.removeLast())
                }
                operatorStack.append(char)
            }
        }

        // 스택에 남아있는 연산자를 결과로 이동
        while let top = operatorStack.last {
            postfix.append(operatorStack.removeLast())
        }

        return String(postfix)
    }
    
}
