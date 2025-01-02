//
//  Medium_15_3Sum.swift
//  BakJoon
//
//  Created by 김성준 on 1/2/25.
//

import Foundation

class Medium_15 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    let nums = nums.sorted() // 정렬
    
    for i in 0..<nums.count {
        if i > 0 && nums[i] == nums[i - 1] {
            continue // 중복된 기준 값은 건너뜀
        }
        
        var left = i + 1
        var right = nums.count - 1
        
        while left < right {
            let sum = nums[i] + nums[left] + nums[right]
            
            if sum == 0 {
                result.append([nums[i], nums[left], nums[right]])
                
                // 중복된 값 건너뜀
                while left < right && nums[left] == nums[left + 1] {
                    left += 1
                }
                while left < right && nums[right] == nums[right - 1] {
                    right -= 1
                }
                
                left += 1
                right -= 1
            } else if sum < 0 {
                left += 1
            } else {
                right -= 1
            }
        }
    }
    
    return result
}

}
