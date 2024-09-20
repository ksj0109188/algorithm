//
//  SearchInsertPosition.swift
//  BakJoon
//
//  Created by 김성준 on 9/19/24.
//

import Foundation

struct SearchInsertPosition {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
            var right = nums.count - 1
            var left = 0
            var result = 0
        
            while left <= right {
                let mid = (left + right) / 2
                if nums[mid] <= target {
                    result = mid
                    left = mid + 1
                } else if nums[mid] > target {
                    right = mid - 1
                }
            }
        print(result)
            return result
            
        }
}
