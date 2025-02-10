//
//  그래프.swift
//  BakJoon
//
//  Created by 김성준 on 2/10/25.
//

import Foundation

class 팀프로젝트_9466 {
    func exec() {
        let T = Int(readLine()!)!
        
        for _ in 0..<T {
            let n = Int(readLine()!)!
            let arr = [0] + readLine()!.split(separator: " ").map{ Int($0)! }
            
            print(findUnteamedStudents(n, arr))
        }
    }
    
    func findUnteamedStudents(_ n: Int, _ choices: [Int]) -> Int {
        var visited = [Bool](repeating: false, count: n + 1)
        var teamCount = 0  // 팀에 속한 학생 수
        
        func dfs(_ node: Int, _ cycle: inout [Int]) {
            var current = node
            
            while !visited[current] {
                visited[current] = true
                cycle.append(current)
                current = choices[current] // 다음 학생으로 이동
            }
            
            //MARK: 이 단계에서 current는 사이클이 발생한 노드, index는 사이클의 시작점을 뜻하므로 전체 갯수 - 시작 지점의 위치 = 현재 사이클을 구성하는 노드의 갯수가 됨
            if let cycleStartIndex = cycle.firstIndex(of: current) {
                teamCount += cycle.count - cycleStartIndex
            }
            
        }
        
        // 모든 학생을 순회하며 DFS 수행
        for i in 1...n {
            if !visited[i] {
                var cycle: [Int] = []
                dfs(i, &cycle)
            }
        }

        return n - teamCount  // 팀에 속하지 못한 학생 수
    }
}
