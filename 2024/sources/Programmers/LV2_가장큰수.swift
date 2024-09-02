//
//  LV2_가장큰수.swift
//  BakJoon
//
//  Created by 김성준 on 7/16/24.
//

import Foundation

class LV2_가장큰수{
    func solution(_ numbers:[Int]) -> String {
        let numbers = numbers.map { String($0) }
        let sortNumbers = numbers.sorted { $0 + $1 > $1 + $0 }
        
        print(sortNumbers)
        let result = sortNumbers.joined()
        
        // 모든 숫자가 0인 경우, "000..."을 "0"으로 변환
        return result.first == "0" ? "0" : result
    }
}
