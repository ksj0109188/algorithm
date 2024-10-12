//
//  N과M_5.swift
//  BakJoon
//
//  Created by 김성준 on 10/12/24.
//

import Foundation

class N과M_5 {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)!}
        let n = input[0]
        let m = input[1]
        var isVisted: [Int: Bool] = [:]
        var arr = readLine()!.split(separator: " ").map{ Int($0)! }
        arr.sort(by: <)
        
        var result: [Int] = []
        
        dfs(arr: arr, length: m, &result, &isVisted)
    }
    
    func dfs(arr: [Int], length: Int,  _ result: inout [Int], _ isVisted: inout [Int: Bool]) {
        guard result.count < length else {
            print(result.map{ String($0) }.joined(separator: " "))
            return
        }
        
        for i in 0..<arr.count {
            if !isVisted[arr[i], default: false] {
                isVisted[arr[i], default: false] = true
                result.append(arr[i])
                
                dfs(arr: arr, length: length, &result, &isVisted)
                
                isVisted[arr[i]]! = false
                result.removeLast()
            }
        }
    }
}
