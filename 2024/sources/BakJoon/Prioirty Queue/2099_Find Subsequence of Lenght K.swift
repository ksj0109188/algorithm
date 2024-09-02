//
//  2099_Find Subsequence of Lenght K.swift
//  BakJoon
//
//  Created by 김성준 on 2/7/24.
//

import Foundation

func maxSubsequence(_ nums: [Int], _ k: Int) -> [Int] {
    var result: [Int] = []
    var largestList = nums.sorted(by: >).prefix(k)

    for item in nums {
        if largestList.contains(where: {$0 == item}) {
            result.append(item)
            if let largestIndex = largestList.firstIndex(where: {$0 == item}) {
                largestList.remove(at: largestIndex)
            }
        }
    }
    
    return result
}
