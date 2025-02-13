//
//  Medium_162.swift
//  BakJoon
//
//  Created by 김성준 on 2/13/25.
//

import Foundation

class Medium_162 {
    func findPeakElement(_ nums: [Int]) -> Int {
            var left = 0
            var right = nums.count - 1

            while left < right {
                let mid = (left + right) / 2

                if nums[mid] < nums[mid + 1] {
                    left = mid + 1
                } else {
                    right = mid
                }
            }

            return left
        }
}

