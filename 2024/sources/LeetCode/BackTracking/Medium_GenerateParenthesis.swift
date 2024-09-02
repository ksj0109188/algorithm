//
//  Medium_GenerateParenthesis.swift
//  BakJoon
//
//  Created by 김성준 on 5/30/24.
//

import Foundation

class Solution_generateParenthesis {
//    MARK: 초기 해결방법
//    시간 복잡도: O(n) + 괄호 조합이 올바른지 검사 O(m) / 공간 복잡도:O(n)
//    func checkPossible(combination: String) -> Bool {
//        var openStack: [Character] = []
//        for char in combination {
//            if char == "(" {
//                openStack.append(char)
//            } else if char == ")" {
//                if openStack.isEmpty {
//                    return false
//                } else {
//                    openStack.removeLast()
//                }
//            }
//        }
//        
//        return openStack.isEmpty ? true : false
//    }
//    
//    func generateParenthesis(_ n: Int) -> [String] {
//        var result: [String] = []
//        
//        func dfs(index: Int, currentCombination: String) {
//            if index == n * 2 {
//                if checkPossible(combination: currentCombination) {
//                    result.append(currentCombination)
//                }
//                return
//            }
//            
//            dfs(index: index + 1, currentCombination: currentCombination + "(")
//            dfs(index: index + 1, currentCombination: currentCombination + ")")
//        }
//        
//        dfs(index: 1, currentCombination: "(")
//        
//        return result
//    }
    
//  MARK: 개선된 방법
//  시간복잡도: Cn -> C4 카탈란 수 / 공간복잡도: O(n)
    func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []
        
        func dfs(_ left: Int, _ right: Int, currentCombination: String) {
            if currentCombination.count == n * 2 {
                result.append(currentCombination)
                return
            }
            
            if left < n {
                dfs(left + 1, right, currentCombination: currentCombination + "(")
            }
            
            if right < left {
                dfs(left, right + 1, currentCombination: currentCombination + ")")
            }
        }
        
        dfs(0, 0, currentCombination: "")
        
        return result
    }
}

