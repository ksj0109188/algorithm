//
//  LV2_전력망둘로나누기.swift
//  BakJoon
//
//  Created by 김성준 on 4/17/24.
//

import Foundation

class LV2_전력망둘로나누기 {
    func solution(_ n: Int, _ wires: [[Int]]) -> Int {
        var list = [[Int]](repeating: [Int](), count: n + 1)
        var isVisted = [Bool]()
        var result = Int.max
        
        for wire in wires {
            let v1 = wire[0]
            let v2 = wire[1]
            list[v1].append(v2)
            list[v2].append(v1)
        }
        
        // 방문 함수
        func dfs(_ current: Int, _ avoid: Int) -> Int{
            isVisted[current] = true
            var count = 1
            for path in list[current] {
                if !isVisted[path] && path != avoid {
                    count += dfs(path, avoid)
                }
            }
            
            return count
        }
        
        for wire in wires {
            isVisted = [Bool](repeating: false, count: n + 1)
            
            
            var count1 = dfs(wire[0], wire[1])
            var count2 = n - count1
            
            let difference = abs(count1 - count2)
            result = min(difference, result)
            
        }
        
        return result
    }

}
