//
//  15663.swift
//  BakJoon
//
//  Created by 김성준 on 10/18/24.
//

import Foundation

class N과M_15663 {
    func solution() {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let length = input[1]
        var nunms = readLine()!.split(separator: " ").map { Int($0)! }
        var result: Set<[Int]> = []
        nunms.sort()
        
        dfs(nums: nunms, length: length, arr: [], isVisited: &result)
        
    }
    
    func dfs(nums: [Int], length: Int, arr: [Int], isVisited: inout Set<[Int]>) {
        guard arr.count < length else {
            if !isVisited.contains(arr) {
                print(arr.map{String($0)}.joined(separator: " "))
                isVisited.insert(arr)
            }
            return
        }
        
        for (index, num) in nums.enumerated() {
            var newNums = nums
            newNums.remove(at: index)
            
            dfs(nums: newNums, length: length, arr: arr + [num], isVisited: &isVisited)
        }
    }
}
