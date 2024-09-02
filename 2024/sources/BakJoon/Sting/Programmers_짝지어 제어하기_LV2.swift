//
//  Programmers_짝지어 제어하기_LV2.swift
//  BakJoon
//
//  Created by 김성준 on 3/24/24.
//

import Foundation

class Programmers_lv2_짝지어 {
    func solution(_ s:String) -> Int{
        var compareStack: [Character] = []
        
        for c in s {
            if compareStack.last == c {
                compareStack.removeLast()
            } else {
                compareStack.append(c)
            }
        }
        
        if compareStack.count > 0 {
            return 0
        } else {
            return 1
        }
    }
}
