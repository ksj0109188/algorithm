//
//  Medium_153.swift
//  BakJoon
//
//  Created by 김성준 on 2/14/25.
//

import Foundation

class Medium_153 {
    //MARK: [5,1,2,3,4]인 케이스를 생각해보자
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1
        
        while left < right {
            let mid = left + (right - left) / 2
            
            if left == mid {
                return nums[left] < nums[right] ? nums[left] : nums[right]
            }
            
            if nums[left] <= nums[mid] && nums[mid] < nums [right] {
                right = mid
            } else {
                left = mid
            }
        }
        
        return nums[left]
    }
    
    func findMin2(_ nums: [Int]) -> Int {
           var left = 0
           var right = nums.count - 1
           
           // 이미 정렬된 경우 처리
           if nums[left] <= nums[right] {
               return nums[left]
           }
           
           while left < right {
               let mid = left + (right - left) / 2
               
               // 최소값이 오른쪽 구간에 있는 경우
               if nums[mid] > nums[right] {
                   left = mid + 1
               }
               // 최소값이 왼쪽 구간에 있는 경우
               else {
                   right = mid
               }
           }
           
           return nums[left]
       }
}
