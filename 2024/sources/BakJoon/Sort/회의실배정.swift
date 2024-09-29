//
//  회의실배정.swift
//  BakJoon
//
//  Created by 김성준 on 9/29/24.
//

import Foundation

struct 회의실배정 {
    func solution() {
        let n = Int(readLine()!)!
        var arr: [(start: Int, end: Int)] = []
        
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map{ Int($0)!}
            arr.append((start: input[0], end: input[1]))
        }
        
        arr.sort {
            if $0.end == $1.end {
                return $0.start < $1.start
            } else {
                return $0.end < $1.end
            }
        }
        
        var result = 1
        var curEnd = arr.first!.end
        
        arr.removeFirst()
        
        for item in arr {
            if item.start >= curEnd {
                result += 1
                curEnd = item.end
            }
        }
        
        print(result)
    }
}
