//
//  12015.swift
//  BakJoon
//
//  Created by 김성준 on 3/8/25.
//


final class 가장긴증가하는부분수열2_12015 {
    func exec() {
        let n = Int(readLine()!)!
        let nums = readLine()!.split(separator: " ").map{ Int($0)! }
        var lis: [Int] = []
        
        for num in nums {
            guard !lis.isEmpty else {
                lis.append(num)
                continue
            }
            
            if lis.last! < num {
                lis.append(num)
            } else {
                var left = 0
                var right = lis.count - 1
                
                while left <= right {
                    let mid = left + (right - left) / 2
                    if lis[mid] < num {
                        left = mid + 1
                    } else {
                        right = mid - 1
                    }
                }
                
                lis[left] = num
            }
        }
        
        print(lis.count)
    }
}

