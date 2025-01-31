//
//  2473.swift
//  BakJoon
//
//  Created by 김성준 on 1/29/25.
//

import Foundation

class 세용액_2473 {
    func solution() {
        let n = Int(readLine()!)!
        let arr: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }.sorted(by: <)
        var result: (Int, (Int,Int,Int)) = (Int.max, (0,0,0))
        
        for i in 0..<n - 2 {
            for j in i + 1..<n - 1 {
                let target = arr[i] + arr[j]
                var left = j + 1
                var right = n - 1
                
                while left <= right {
                    let mid = (left + right) / 2
                    let currentSum = arr[i] + arr[j] + arr[mid]
                    
                    if abs(result.0) > abs(currentSum) {
                        result = (currentSum, (arr[i], arr[j], arr[mid]))
                    }
                    //MARK: target을 절대값 기준으로하면 틀린 케이스가 있는데 이걸 찾아보자.
                    if arr[mid] < abs(target) {
                        left = mid + 1
                    } else {
                        right = mid - 1
                    }
                }
            }
        }
        
        let sortedResult = [result.1.0, result.1.1, result.1.2].sorted()
        print("\(sortedResult[0]) \(sortedResult[1]) \(sortedResult[2])")
    }
}

class 세용액_2473_2 {
    func solution() {
        let n = Int(readLine()!)!
        let arr: [Int] = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
        var result: (Int, (Int, Int, Int)) = (Int.max, (0, 0, 0))
        
        for i in 0..<n - 2 {
            for j in i + 1..<n - 1 {
                let target = -(arr[i] + arr[j])  // 세 번째 값이 필요로 하는 목표값
                var left = j + 1
                var right = n - 1
                
                while left <= right {
                    let mid = (left + right) / 2
                    let currentSum = arr[i] + arr[j] + arr[mid]

                    // 0과의 차이 비교 (절댓값이 아니라 실제 값과 비교)
                    if abs(currentSum) < abs(result.0) {
                        result = (currentSum, (arr[i], arr[j], arr[mid]))
                    }
                        
                    if arr[mid] < target {  // 비교 대상은 target 그 자체여야 함
                        left = mid + 1
                    } else {
                        right = mid - 1
                    }
                }
            }
        }

        let sortedResult = [result.1.0, result.1.1, result.1.2].sorted()
        print("\(sortedResult[0]) \(sortedResult[1]) \(sortedResult[2])")
    }
}


