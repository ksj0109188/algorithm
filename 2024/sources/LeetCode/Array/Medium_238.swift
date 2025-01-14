//
//  Medium_238.swift
//  BakJoon
//
//  Created by 김성준 on 1/14/25.
//

import Foundation

class Medium_238 {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        let zeroCount = countZeros(nums)
        var zeroIndex = -1
        var amount = nums.reduce(1) {$0 * $1}
        var answer: [Int] = []
        
        if zeroCount >= 1 {
            if zeroCount > 1 { return Array(repeating: 0, count: nums.count)}
            if let index = getZeroIndex(nums) {
                zeroIndex = index
                amount = removedZeroSum(nums)
            }
        }
        
        
        
        // print(amount)
        for num in nums {
            if zeroCount > 0 {
                if num != 0 { answer.append(0) }
                else { answer.append(amount) }
            } else {
                answer.append(amount / num)
            }
        }
        // 0이 두개 있을경우 전부다 값은 0이다.
        // 0이 한개일 경우엔 그 배열의 요소를 제거하면 된다.

        return answer
    }
    
    private func countZeros(_ nums: [Int]) -> Int {
        return nums.filter{ $0 == 0 }.count
    }
    
    private func getZeroIndex(_ nums: [Int]) -> Int? {
        nums.firstIndex(of: 0)
    }
    
    private func removedZeroSum(_ nums: [Int]) -> Int {
        return nums.reduce(1) {
            if $1 == 0 { $0 }
            else { $0 * $1 }
        }
    }
}
