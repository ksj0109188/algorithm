//
//  LV2_N진수 게임.swift
//  BakJoon
//
//  Created by 김성준 on 7/10/24.
//

import Foundation

class N진수게임{
    func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
        // n : 진번
        // t: 미리 구할 숫자의 갯수 -> 튜브가 말해야하는 숫자 개수
        // m: 게임에 참여하는 인원
        // p: 튜브가 말하는 순서
        
        var numsString = ""
        var result = ""
        
        for i in 0..<t * m {
            numsString += String(i, radix: n)
        }
        
        let nums = Array(numsString)
        
        for i in 1...t {
            let index = (i * m) - (m - p)
            print(index - 1)
//            result.append(nums[index])
        }
        
        
        return result.uppercased()
    }
}
