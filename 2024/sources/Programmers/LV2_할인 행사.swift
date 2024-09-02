//
//  LV2_할인 행사.swift
//  BakJoon
//
//  Created by 김성준 on 4/2/24.
//

import Foundation

class LV2_할인행사 {
    func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
        var result = 0
        
        for i in 0..<discount.count - 9 {
            let startIndex = i
            let endIndex = i + 9
            if isPosibble(want, number, Array(discount[startIndex...endIndex])) {
               result += 1
            }
        }
        
        return result
    }
    
    func isPosibble(_ want: [String], _ number: [Int], _ products: [String]) -> Bool {
        var wantMap : [String: Int] = [:]
        
        for i in 0..<want.count {
            wantMap[want[i]] = number[i]
        }
        
        for product in products {
            wantMap[product, default: 0] -= 1
        }
        
        return wantMap.filter{$0.value > 0}.isEmpty
    }
    
}
