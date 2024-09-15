//
//  색종이만들기.swift
//  BakJoon
//
//  Created by 김성준 on 9/15/24.
//

import Foundation

struct 색종이만들기 {
    func solution() {
        let n = Int(readLine()!)!
        var arr: [[Int]] = .init(repeating: [], count: n)
        var result: [Int] = [0, 0]
        
        for i in 0..<n {
            let tiles = readLine()!.split(separator: " ").map{ Int($0)! }
            arr[i] += tiles
        }
        
        func dfs(startX: Int, startY: Int, size: Int) {
            let baseVal = arr[startX][startY]
            var isCompress: Bool = true
            
            for i in startX..<startX + size {
                if !isCompress { break }
                
                for j in startY..<startY + size {
                    if baseVal != arr[i][j] {
                        isCompress = false
                        break
                    }
                }
            }
            
            if !isCompress {
                let nextSize = size / 2
                dfs(startX: startX, startY: startY, size: nextSize)
                dfs(startX: startX, startY: startY + nextSize, size: nextSize)
                dfs(startX: startX + nextSize, startY: startY, size: nextSize)
                dfs(startX: startX + nextSize, startY: startY + nextSize, size: nextSize)
            } else {
                result[baseVal] += 1
            }
        }
        
        dfs(startX: 0, startY: 0, size: arr.count)
        
        print(result[0])
        print(result[1])
    }
}
