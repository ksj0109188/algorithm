//
//  1806.swift
//  BakJoon
//
//  Created by 김성준 on 12/31/24.
//

import Foundation

class 부분합_1806{
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let n = input[0]
        let s = input[1]
        let arr = readLine()!.split(separator: " ").map{ Int($0)! }
        var start = 0
        var end = 0
        var sum = 0
        var result = Int.max
        
        while end < n {
            sum += arr[end]
            
            while sum >= s {
                result = min(result, end - start + 1)
                sum -= arr[start]
                start += 1
            }
            
            end += 1
        }
        
        if result == Int.max {
            result = 0
        }
        
        print(result)
    }
}

