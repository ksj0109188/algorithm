//
//  C1002.swift
//  BakJoon
//
//  Created by 김성준 on 10/16/24.
//

import Foundation

class C1002 {
    public func solution(_ S: inout String) -> Int {
        var count = 0
        var S: [Character] = Array(String(Int(S, radix: 10)!))
        
        while !S.isEmpty {
            if S.last == "1" {
                S[S.count - 1] = "0"
                count += 1
            } else {
                S.removeLast()
                count += 1
            }
        }
        
        return count - 1
    }
    public func solution2(_ S: inout String) -> Int {
        var count = 0
        var binaryArray = Array(S)
        
        // 앞쪽의 0 제거
        while binaryArray.first == "0" {
            binaryArray.removeFirst()
        }
        
        while !binaryArray.isEmpty {
            if binaryArray.last == "1" {
                // 홀수: 1을 빼고 2로 나누기
                binaryArray.removeLast()
                count += 2 // 두번 연산이니
                if binaryArray.isEmpty {
                    count -= 1  // 마지막 1을 제거할 때는 나누기 연산이 필요 없음
                }
            } else {
                // 짝수: 2로 나누기
                binaryArray.removeLast()
                count += 1
            }
            
        }
        
        return count
    }
    
    
}
