//
//  Medium_167.swift
//  BakJoon
//
//  Created by 김성준 on 12/31/24.
//

import Foundation

class Solution_Medium_167 {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var pointer1 = 0
        var pointer2 = numbers.count - 1
        var sum = 0
        var answer: [Int] = []
        
        while pointer1 < pointer2 {
            sum = numbers[pointer1] + numbers[pointer2]
            
            if sum == target {
                answer.append(pointer1 + 1)
                answer.append(pointer2 + 1)
                break
            } else if sum < target {
                pointer1 += 1
            } else {
                pointer2 -= 1
            }
        }
        
        return answer
    }
}
