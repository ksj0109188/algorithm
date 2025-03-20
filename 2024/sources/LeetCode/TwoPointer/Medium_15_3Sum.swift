//
//  Medium_15_3Sum.swift
//  BakJoon
//
//  Created by 김성준 on 1/2/25.
//

import Foundation

class Review_Medium_15 {
    //MARK: 시간복잡도가 O(n^3)이라 시간초과 발생함.
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var sets: Set<[Int]> = []
        
        if nums.count == 3 && nums[0] + nums[1] + nums[2] == 0 {
            return [[nums[0], nums[1], nums[2]]]
        }
        
        for i in 0..<nums.count - 2 {
            for j in i + 1..<nums.count - 1 {
                for k in j + 1..<nums.count {
                    if nums[i] + nums[j] + nums [k] == 0 {
                        let sortResult = [nums[i], nums[j], nums[k]].sorted()
                        
                        sets.insert(sortResult)
                    }
                }
            }
        }
        
        return Array(sets)
    }
}

class Medium_15 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        let nums = nums.sorted() // 정렬
//        [-4, -1, -1, 0, 1, 2]
//        [-4, 0, 0, 4]
//        [-10, -5, -5, -4, -4, -3, -2, -2, 0, 0, 1, 2, 2, 2, 2, 5, 5]
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
