//
//  LV2_삼각달팽이.swift
//  BakJoon
//
//  Created by 김성준 on 4/30/24.
//

import Foundation

class LV2_삼각달팽이 {
    func solution(_ n:Int) -> [Int] {
        
        var array = Array(repeating: [Int](), count: n)
        for i in 0..<n {
            array[i] = Array(repeating: 0, count: i + 1)
        }
        
        var currentNumber = 1
        var level = 0
        
        func fillTriangle(_ n: Int, _ level: Int ) {
            if n < 1 { return }
            
            let startIndex = level * 2
            let endIndex = n - 1 + startIndex
            
            //좌변
            for i in startIndex..<endIndex {
                array[i][level] = currentNumber
                currentNumber += 1
            }
            //밑변
            for i in level...endIndex - level {
                array[endIndex][i] = currentNumber
                currentNumber += 1
            }
            //우변
            for i in stride(from: endIndex - 1, to: startIndex, by: -1) {
                array[i][i - level] = currentNumber
                currentNumber += 1
            }
            
            fillTriangle(n - 3, level + 1)
        }
        
        fillTriangle(n, 0)
        
        return array.flatMap { $0 }
    }
}
