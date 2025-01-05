//
//  Medium_201.swift
//  BakJoon
//
//  Created by 김성준 on 1/5/25.
//

import Foundation
//MARK: 범위 left: 10/ right: 15 일때 범위는 다음과 같다 right부터 이진수로 -1
// 따라서 최상위 비트는 범위내 숫자에서 고정된다. 그걸 찾으면 되는 것이 포인트임
//15 -> 1111
//14 -> 1110
//13 -> 1101
//12 -> 1100
//11 -> 1011
//10 -> 1010


class Solution_201 {
//    func rangeBitwiseAnd1(_ left: Int, _ right: Int) -> Int {
//        var result = left
//        
//        for num in left...right {
//            result &= num
//        }
//        
//        return result
//    }
    
    func rangeBitwiseAnd2(_ left: Int, _ right: Int) -> Int {
        var left = left
        var right = right
        var shift = 0
        //MARK: 
        // 공통된 비트를 찾을 때까지 shift
        while left < right {
            left >>= 1
            right >>= 1
            shift += 1
        }
        
        // 공통된 비트를 복원
        return left << shift
    }
    
}
