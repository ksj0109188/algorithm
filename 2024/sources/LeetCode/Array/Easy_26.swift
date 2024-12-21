//
//  Easy_26.swift
//  BakJoon
//
//  Created by 김성준 on 12/21/24.
//

import Foundation

class Easy_26 {
    class Solution {
        static func removeDuplicates(_ nums: inout [Int]) -> Int {
            var newNums:[Int] = []
            
            for num in nums {
                guard !newNums.isEmpty else {
                    newNums.append(num)
                    continue
                }
                
                if newNums.last! != num {
                    newNums.append(num)
                }
            }
            
            nums = newNums
            return newNums.count
        }
    }
}
