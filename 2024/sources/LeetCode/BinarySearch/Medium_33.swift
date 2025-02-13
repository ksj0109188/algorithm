//
//  Medium_33.swift
//  BakJoon
//
//  Created by 김성준 on 2/13/25.
//

import Foundation

class Medium_33 {
    func search(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left <= right {
            let mid = (left + right) / 2
            
            if target == nums[mid] {
                return mid
            }
            
            // mid기준 왼쪽 정렬
            if nums[left] <= nums[mid] {
                if nums[left] <= target && target < nums[mid] {
                    right = mid - 1  // 왼쪽 범위에서 탐색
                } else {
                    left = mid + 1  // 오른쪽 범위에서 탐색
                }
            }
            // mid기준 오른쪽이 정렬됨
            else {
                if nums[mid] < target && target <= nums[right] {
                    left = mid + 1  // 오른쪽 범위에서 탐색
                } else {
                    right = mid - 1  // 왼쪽 범위에서 탐색
                }
            }
        }
        
        return -1
    }
}
