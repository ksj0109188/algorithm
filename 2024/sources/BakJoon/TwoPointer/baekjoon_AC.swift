//
//  baekjoon_AC.swift
//  BakJoon
//
//  Created by 김성준 on 10/6/24.
//

import Foundation

class baekjoon_AC {
    func solution() {
        let T = Int(readLine()!)!
        
        for _ in 0..<T {
            let p = readLine()!
            let n = Int(readLine()!)!
            let input = readLine()!
            
            var arr: [Int] = []
            if n > 0 {
                arr = input.dropFirst().dropLast().split(separator: ",").compactMap { Int($0) }
            }
            
            var isReversed = false
            var start = 0
            var end = arr.count - 1
            var isError = false
            
            for command in p {
                if command == "R" {
                    isReversed.toggle()
                } else if command == "D" {
                    if start > end {
                        isError = true
                        break
                    }
                    if isReversed {
                        end -= 1
                    } else {
                        start += 1
                    }
                }
            }
            
            if isError {
                print("error")
            } else if start > end {
                print("[]")
            } else {
                let result: [Int]
                if start == end {
                    result = [arr[start]]
                } else if isReversed {
                    result = Array(arr[start...end].reversed())
                } else {
                    result = Array(arr[start...end])
                }
                print("[" + result.map { String($0) }.joined(separator: ",") + "]")
            }
        }
    }
}
