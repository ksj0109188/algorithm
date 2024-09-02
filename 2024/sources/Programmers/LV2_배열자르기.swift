//
//  LV2_배열자르기.swift
//  BakJoon
//
//  Created by 김성준 on 4/4/24.
//

import Foundation

class LV2_배열자르기 {
    func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
        if left > right && left == 0 && right == 0 {
            return [1]
        }
        
        var result: [Int] = []
        
        for pos in left...right {
            let pos = Int(pos)
            result += [max((pos / n), (pos % n)) + 1]
        }
        
        return result
    }
}
