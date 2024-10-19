//
//  15666_N과M12.swift
//  BakJoon
//
//  Created by 김성준 on 10/19/24.
//

import Foundation

final class N과M12_15666 {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let n = input[0]
        let m = input[1]
        let arr = readLine()!.split(separator: " ").map{ Int($0)! }
        let nums = Set<Int>(arr)
        var result: [Int] = []
        
        
        dfs(0, nums.sorted(by: <), &result, m)
    }
    
    private func dfs(_ startIndex: Int, _ nums: [Int], _ result: inout [Int],_ length: Int) {
        guard result.count < length else {
            print(result.map{ String($0) }.joined(separator: " "))
            return
        }
        
        for i in startIndex..<nums.count {
            result.append(nums[i])
            dfs(i, nums, &result, length)
            result.removeLast()
        }
    }
}
