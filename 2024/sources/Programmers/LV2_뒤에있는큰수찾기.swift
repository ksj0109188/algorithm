//
//  LV2_뒤에있는큰수찾기.swift
//  BakJoon
//
//  Created by 김성준 on 4/22/24.
//

import Foundation

class LV2_뒤에있는큰수찾기 {
    func solution(_ numbers:[Int]) -> [Int] {
        var stack = [Int]()
        var result = Array(repeating: -1, count: numbers.count)
           
        for i in 0..<numbers.count {
            while !stack.isEmpty && numbers[i] > numbers[stack.last!] {
                let idx = stack.removeLast()
                result[idx] = numbers[i]
            }
            stack.append(i)
        }
        
        return result
    }
}
