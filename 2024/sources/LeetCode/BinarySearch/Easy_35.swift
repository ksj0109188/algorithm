//
//  Easy_35.swift
//  BakJoon
//
//  Created by 김성준 on 1/30/25.
//

import Foundation

class Easy_35 {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count - 1
    
        while left <= right {
            let mid = (left + right) / 2

            if nums[mid] == target {
                return mid
            }

            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return left
    }
    //MARK: [1,3] target: 2 일때 정답을 찾을 수 없음
    //MARK: left 위치는 가장 근접한 값의 삽입 위치임 따라서 이걸 활용하면 됨
    
    func searchInsert2(_ nums: [Int], _ target: Int) -> Int {
        var left = 0
        var right = nums.count
        var result = -1

        while left <= right {
            let mid = (left + right) / 2
//            print("prev left", left)
//            print("prev right", right)
//            print("mid",mid)
            guard mid < nums.count else { return mid } // 이 부분도 오류 발생 가능성, 즉 left를 반환하면 해결될 일임
            if nums[mid] == target {
                result = mid
                return result
            }

            if nums[mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
            
            result = mid
//            print("result",result)
        }

        return result
    }
}
