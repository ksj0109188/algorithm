//
//  LV2_귤고르기.swift
//  BakJoon
//
//  Created by 김성준 on 3/30/24.
//

import Foundation

class LV2귤고르기 {
    func solution(_ k:Int, _ tangerine:[Int]) -> Int {
        // 시간복잡도는 O(n) , O(logN) 필요
        var tangerineSize : [Int: Int] = [:]
        var result = 0
        var k = k
        
        for i in tangerine {
            tangerineSize[i, default: 0] += 1
        }
        
        let classified = tangerineSize.sorted{$0.value > $1.value}
        
        while k > 0 {
            k -= classified[result].value
            result += 1
        }
        
        return result
        
    }
}
