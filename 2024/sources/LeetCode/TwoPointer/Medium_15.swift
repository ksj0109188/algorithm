//
//  Medium_11.swift
//  BakJoon
//
//  Created by 김성준 on 1/1/25.
//

import Foundation

class Medium_11 {
    func maxArea(_ height: [Int]) -> Int {
        var leftPointer = 0
        var rightPoinger = height.count - 1
        var result = 0
        
        while leftPointer < rightPoinger {
            let containerSize = min(height[leftPointer], height[rightPoinger])
                            
            result = max(result, containerSize * (rightPoinger - leftPointer))
            
            if height[leftPointer] < height[rightPoinger] {
                leftPointer += 1
            } else {
                rightPoinger -= 1
            }
        }
        
        return result
    }
}

