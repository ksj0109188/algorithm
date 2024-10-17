//
//  number1.swift
//  BakJoon
//
//  Created by 김성준 on 10/16/24.
//

import Foundation

class C1001 {
    // 초안
    public func solution(_ N: Int, _ K : Int) {
        var amount = K
        var count = 0
        
        for i in stride(from: N, through: 1, by: -1) {
            if amount >= i {
                amount -= i
                count += 1
            }
        }
        
        if amount > 0 {
            print(-1)
        } else {
            print(count)
        }
    }
    
    // 개선된 알고리즘
    func imporveSolution(_ N: Int, _ K : Int) -> Int {
        var remaining = K
        var count = 0
        var maxGlass = N
        
        while remaining > 0 {
            let lastGlass = binarySearch(left: 1, right: maxGlass, target: remaining)

            remaining -= lastGlass
            maxGlass = lastGlass - 1
            count += 1
            
            if lastGlass == 0 {
                break
            }
        }
        
        return remaining == 0 ? count : -1
    }
    
    func binarySearch(left: Int, right: Int, target: Int) -> Int {
        var left = left
        var right = right
        var result = 0
        
        while left <= right {
            let mid = (left + right) / 2

            if mid <= target {
                left = mid + 1
                result = mid
            } else {
                right = mid - 1
            }
        }
        
        return result
    }
    
}
