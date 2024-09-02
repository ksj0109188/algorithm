//
//  LV2_예상 대진표.swift
//  BakJoon
//
//  Created by 김성준 on 3/29/24.
//

import Foundation

class Lv2_예상대진표 {
    func solution(_ n:Int, _ a:Int, _ b:Int) -> Int {
        var answer = 0
        var a: Double = Double(a)
        var b: Double = Double(b)
        while a != b {
            a = round(a / 2)
            b = round(b / 2)
            answer += 1
        }
        
        return answer
    }
    
}
