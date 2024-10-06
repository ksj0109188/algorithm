//
//  1074_Z.swift
//  BakJoon
//
//  Created by 김성준 on 10/6/24.
//

import Foundation

struct Z_recursive {
    func solve() {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let n = input[0]
        let r = input[1]
        let c = input[2]
        let size = Int(pow(2.0, Double(n)))
        var count = 0
        var isCompleted = false
        dfs(0, 0, r, c, size, &count, isCompleted: &isCompleted)

    }

    func dfs(_ startX: Int, _ startY: Int, _ targetX: Int, _ targetY: Int, _ size: Int, _ count: inout Int, isCompleted: inout Bool) {
        guard size > 1 else { return }

        if size == 2 {
            for i in startX..<startX + size {
                for j in startY..<startY + size {
                    if i == targetX && j == targetY {
                        print(count)
                        isCompleted = true
                    }
                    count += 1
                }
            }
        }

        if !isCompleted {
            let nextSize = size / 2
            dfs(startX, startY, targetX, targetY, nextSize, &count, isCompleted: &isCompleted)
            dfs(startX, startY + nextSize, targetX, targetY, nextSize, &count, isCompleted: &isCompleted)
            dfs(startX + nextSize, startY, targetX, targetY, nextSize, &count, isCompleted: &isCompleted)
            dfs(startX + nextSize, startY + nextSize, targetX, targetY, nextSize, &count, isCompleted: &isCompleted)
        }
    }
}
