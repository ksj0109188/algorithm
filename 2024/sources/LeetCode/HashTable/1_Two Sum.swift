//
//  HashTable.swift
//  BakJoon
//
//  Created by 김성준 on 2/1/24.
//

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    for (index, item) in nums.enumerated() {
        if let i = dict[item] {
            return [i, index]
        } else {
            dict[target - item] = index
        }
    }
    
    return []
}
