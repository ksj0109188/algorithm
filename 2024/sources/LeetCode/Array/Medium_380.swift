//
//  Medium_380.swift
//  BakJoon
//
//  Created by 김성준 on 1/14/25.
//

import Foundation

class RandomizedSet {
    private var nums: Set<Int> = []
    
    init() {
        
    }
    
    func insert(_ val: Int) -> Bool {
        let (result, _) = nums.insert(val)
        
        return result
    }
    
    func remove(_ val: Int) -> Bool {
        if let _ = nums.remove(val) {
            return true
        } else {
            return false
        }
    }
    
    func getRandom() -> Int {
        if let result = nums.randomElement() {
            return result
        } else {
            exit(0)
        }
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
