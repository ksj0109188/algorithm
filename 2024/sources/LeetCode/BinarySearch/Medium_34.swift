//
//  Medium_34.swift
//  BakJoon
//
//  Created by 김성준 on 2/14/25.
//

import Foundation

class Medium_34 {
   func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        return [findBound(nums, target, true), findBound(nums, target, false)]
    }
    
    private func findBound(_ nums: [Int], _ target: Int, _ isFirst: Bool) -> Int {
        var left = 0, right = nums.count - 1
        var bound = -1
        
        while left <= right {
            let mid = (left + right) / 2
            
            if nums[mid] == target {
                bound = mid
                if isFirst {
                    right = mid - 1  // 첫 번째 위치 찾기 위해 왼쪽 탐색
                } else {
                    left = mid + 1   // 마지막 위치 찾기 위해 오른쪽 탐색
                }
            } else if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return bound
    }
}
