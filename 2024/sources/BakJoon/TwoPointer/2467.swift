//
//  2467.swift
//  BakJoon
//
//  Created by 김성준 on 12/24/24.
//

import Foundation

class 용액2467 {
    func solution() {
        let n = Int(readLine()!)!
        let arr = readLine()!.split(separator: " ").map{ Int($0)! }
        
        var i = 0
        var j = n - 1
        var minValue = Int.max
        var answer: (Int, Int) = (Int.max, Int.max)
        
        while i < j {
            let sum = arr[i] + arr[j]
            
            if abs(sum) < abs(minValue) {
                minValue = sum
                answer = (arr[i], arr[j])
            }
            
            // -1 0 1 2을 예제로 생각해보면 sum을 기준으로 포인터 이동하는 이유가 나옴
            if sum > 0 {
                j -= 1  // 합이 양수 -> 더 작은 값으로 이동
            } else {
                i += 1  // 합이 음수 -> 더 큰 값으로 이동
            }
        }
        
        print("\(answer.0) \(answer.1)")
    }

}
