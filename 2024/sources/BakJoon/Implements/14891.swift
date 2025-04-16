//
//  2048.swift
//  BakJoon
//
//  Created by 김성준 on 4/16/25.
//

import Foundation

class 톱니바퀴_14891 {
    func exec() {
        var wheels = [[Character]]()
        for _ in 0..<4 {
            wheels.append(Array(readLine()!))
        }

        let k = Int(readLine()!)!
        for _ in 0..<k {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            let (targetIndex, direction) = (input[0] - 1, input[1])

            // 0: 안 회전, 1: 시계, -1: 반시계
            var directionMap = [Int](repeating: 0, count: 4)
            directionMap[targetIndex] = direction
            dfs(wheels, &directionMap, targetIndex)

            // 실제 회전 수행
            for i in 0..<4 {
                if directionMap[i] == 1 {
                    wheels[i].insert(wheels[i].removeLast(), at: 0)
                } else if directionMap[i] == -1 {
                    wheels[i].append(wheels[i].removeFirst())
                }
            }
        }

        // 점수 계산
        var score = 0
        for i in 0..<4 {
            if wheels[i][0] == "1" {
                score += (1 << i)
            }
        }
        print(score)
    }

    func dfs(_ wheels: [[Character]], _ directionMap: inout [Int], _ current: Int) {
        let left = current - 1
        let right = current + 1

        // 왼쪽 톱니
        if left >= 0 && directionMap[left] == 0 {
            if wheels[left][2] != wheels[current][6] {
                directionMap[left] = -directionMap[current]
                dfs(wheels, &directionMap, left)
            }
        }

        // 오른쪽 톱니
        if right < 4 && directionMap[right] == 0 {
            if wheels[current][2] != wheels[right][6] {
                directionMap[right] = -directionMap[current]
                dfs(wheels, &directionMap, right)
            }
        }
    }
}
