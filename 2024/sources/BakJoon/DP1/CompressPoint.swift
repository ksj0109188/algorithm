//
//  File.swift
//  BakJoon
//
//  Created by 김성준 on 9/20/24.
//

import Foundation

struct CompressPoint {
    func solution() {
        let _ = Int(readLine()!)!
        let nums = readLine()!.split(separator: " ").map{ Int($0)! }
        let sortedNums = nums.sorted(by: <)
        var dp: [Int] = [Int](repeating: 0, count: sortedNums.count)
        var result: [Int: Int] = [:]
        result[nums.min()!, default: 0] = 0
        
        for i in 1..<sortedNums.count {
            if sortedNums[i - 1] < sortedNums[i] {
                dp[i] = dp[i - 1] + 1
            } else if sortedNums[i - 1] == sortedNums[i] {
                dp[i] = dp[i - 1]
            }
            result[sortedNums[i], default: 0] = dp[i]
        }
        
        for num in nums {
            print(result[num] ?? 0)
        }
    }
    
    // 다른 사람 풀이참고 (dp를 사용하지 않아도 되는 문제)
    func solution2() {
        let n = Int(readLine()!)!
        let arr = readLine()!.split(separator: " ").map{Int(String($0))!}
        var dict = [Int:Int]()
        var next = 0
        for i in arr.sorted() {
            if dict[i] == nil {
                dict[i] = next
                next += 1
            }
        }
        print("\(arr.map{ String(dict[$0]!) }.joined(separator: " "))")
    }
}
