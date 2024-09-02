//
//  LV2_쿼드압축 후 개수 세기.swift
//  BakJoon
//
//  Created by 김성준 on 7/23/24.
//

import Foundation

class LV2_쿼드압축 {
    func solution(_ arr: [[Int]]) -> [Int] {
        var zeroCount = 0
        var oneCount = 0

        func dfs(_ x: Int, _ y: Int, _ size: Int) {
            let firstValue = arr[x][y]
            var isUniform = true

            for i in 0..<size {
                for j in 0..<size {
                    if arr[x + i][y + j] != firstValue {
                        isUniform = false
                        break
                    }
                }
                if !isUniform {
                    break
                }
            }

            if isUniform {
                if firstValue == 0 {
                    zeroCount += 1
                } else {
                    oneCount += 1
                }
            } else {
                let newSize = size / 2
                dfs(x, y, newSize)
                dfs(x, y + newSize, newSize)
                dfs(x + newSize, y, newSize)
                dfs(x + newSize, y + newSize, newSize)
            }
        }

        dfs(0, 0, arr.count)
        return [zeroCount, oneCount]
    }
}
