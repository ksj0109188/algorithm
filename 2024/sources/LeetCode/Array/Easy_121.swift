//
//  Easy_121.swift
//  BakJoon
//
//  Created by 김성준 on 12/27/24.
//

import Foundation

class Easy_121 {
    class Solution {
        func maxProfit(_ prices: [Int]) -> Int {
            var minPrice = Int.max // 최소 가격 초기화
            var maxProfit = 0 // 최대 이익 초기화

            for price in prices {
                // 최소 가격 업데이트
                minPrice = min(minPrice, price)
                // 현재 가격에서 최소 가격을 뺀 값으로 최대 이익 업데이트
                maxProfit = max(maxProfit, price - minPrice)
            }

            return maxProfit
        }
    }
}
