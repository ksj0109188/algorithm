//
//  LV3_깊이:너비 우선 탐색.swift
//  BakJoon
//
//  Created by 김성준 on 3/29/24.
//

import Foundation

class LV3_깊이너비우선탐색 {
    func solution(_ n:Int, _ computers:[[Int]]) -> Int {
        var visited:[Bool] = [Bool](repeating: false, count: n)
        var networks = 0
        
        for computer in 0..<n {
            if !visited[computer] {
                visited[computer] = true
                networks += 1
                dfs(computer, &visited, n, computers)
            }
        }
        
        print(networks)
        return networks
    }   
    
    func dfs(_ computer: Int, _ visited: inout [Bool], _ n: Int, _ computers: [[Int]]) {
        for edge in 0..<n {
            if computers[computer][edge] == 1 && !visited[edge] {
                visited[edge] = true
                dfs(edge, &visited, n, computers)
            }
        }
    }
    
}


