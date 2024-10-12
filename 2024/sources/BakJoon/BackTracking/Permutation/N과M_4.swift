//
//  N과M_4.swift
//  BakJoon
//
//  Created by 김성준 on 10/12/24.
//

import Foundation

class N과M_4 {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)!}
        let n = input[0]
        let m = input[1]
        
        var result: [Int] = []
        dfs(startIndex: 1, endIndex: n, result: &result, length: m)
    }
    
    func dfs(startIndex: Int, endIndex: Int, result: inout [Int], length: Int) {
        guard result.count < length else {
            print(result.map{String($0)}.joined(separator: " "))
            return
        }
        
        for i in startIndex...endIndex {
            result.append(i)
            dfs(startIndex: i, endIndex: endIndex, result: &result, length: length)
            result.removeLast()
        }
    }
}
