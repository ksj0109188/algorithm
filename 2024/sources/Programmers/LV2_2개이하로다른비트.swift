//
//  LV2_2개이하로다른비트.swift
//  BakJoon
//
//  Created by 김성준 on 6/25/24.
//

import Foundation

class LV2_2개이하로다른비트 {
    func solution(_ numbers:[Int64]) -> [Int64] {
        return numbers.map {
            if $0 % 2 == 0 { return $0 + 1 }
            else {
                    // $0 + 1 가장 오른쪽 0인 비트를 1로 바꾸는 수식
                    // 1001 -> 1010
                print($0+1)
                print(~$0)
                let last = (~$0) & ($0+1)
                print(last)
                return ($0 | last) & ~(last>>1)
            }
        }
    }

}

