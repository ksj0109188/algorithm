//
//  CountSubArrSumOfX.swift
//  BakJoon
//
//  Created by 김성준 on 6/25/24.
//

import Foundation

class CountSubArrSumOfX {
    // 문제: 배열에서 원소들의 합이 x인 연속 부분배열의 개수를 구하라
    // arr : [1, 3, 5, 6, 2, 7, 9] (비정렬)
    // x : 9
    // answer: [3,6], [2,7], [9]
    func soltion1(arr: [Int], x: Int) {
        var count = 0
        var sum = 0
        var left = 0
        var right = 0
        
        while right < arr.count - 1 {
            guard sum != x else {
                count += 1
                left = right
                sum = 0
                continue
            }
            
            sum += arr[right]
            
            if sum < x {
                right += 1
            } else if sum > x {
                sum -= arr[left]
                left += 1
            }
        }
        print(count)
    }
    // 다음 정렬된 배열에서 두개의 원소의 합이 x와 같은지를 확인하고 같다면 각각원소의 인덱스를 반환하라
    // arr = [2, 4, 5, 7, 11, 15], x= 15
    
    func solution2(arr: [Int], x: Int) {
        var left = 0
        var right =  arr.count - 1
        var sum = 0
        var result: [[Int]] = []
        
        while left < right {
            sum = arr[left] + arr[right]
            if sum > x {
                sum -= arr[right]
                right -= 1
            } else if sum < x {
                sum -= arr[left]
                left += 1
            } else if sum == x {
                result.append([left, right])
                sum -= arr[left]
                left += 1
            }
        }
        
        print(result)
    }
}
