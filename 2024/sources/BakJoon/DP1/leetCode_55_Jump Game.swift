//
//  leetCode_55_Jump Game.swift
//  BakJoon
//
//  Created by 김성준 on 3/17/24.
//

import Foundation

class Solution55 {
    func canJump(_ nums: [Int]) -> Bool {
        guard nums.count > 2 else {
            return true
        }
        
        for i in stride(from: nums.count - 2, to: 0, by: -1) {
            if nums.count - 1 <= i + nums[i] {
                return true
            }
        }
        
        return false
    }
}
