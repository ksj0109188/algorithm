//
//  2206.swift
//  BakJoon
//
//  Created by 김성준 on 12/9/24.
//

import Foundation

class 벽부수고이동하기_2206 {
    func bfs(_ graph: [[Int]], _ N: Int, _ M: Int) -> Int {
        // 상하좌우 이동 방향
        let dx = [0, 0, 1, -1]
        let dy = [1, -1, 0, 0]
        
        // 3차원 방문 배열 (x, y, 벽 부순 여부)
        var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: M), count: N)
        
        print(visited)
        // 큐 정의 (x, y, 거리, 벽 부순 횟수)
        var queue = [(x: Int, y: Int, dist: Int, broken: Int)]()
        queue.append((0, 0, 1, 0))
        visited[0][0][0] = 0
        
        var queueIndex = 0
        
        while queueIndex < queue.count {
            let (x, y, dist, broken) = queue[queueIndex]
            queueIndex += 1
            
            // 목적지 도달
            if x == N-1 && y == M-1 {
                return dist
            }
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                // 맵 범위 체크
                guard 0..<N ~= nx && 0..<M ~= ny else { continue }
                
                // 벽이 없는 경우
                if graph[nx][ny] == 0 && visited[nx][ny][broken] == 0 {
                    queue.append((nx, ny, dist+1, broken))
                    visited[nx][ny][broken] = 1
                }
                
                // 벽이 있고 아직 부수지 않은 경우
                if graph[nx][ny] == 1 && broken == 0 && visited[nx][ny][1] == 0 {
                    queue.append((nx, ny, dist+1, 1))
                    visited[nx][ny][1] = 1
                }
            }
        }
        
        return -1 // 도달 불가능한 경우
    }

    func solution() {
        // 입력 처리
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let N = input[0], M = input[1]
        
        var graph = [[Int]]()
        
        for _ in 0..<N {
            let row = Array(readLine()!).map { Int(String($0))! }
            graph.append(row)
        }
        
        // 결과 출력
        print(bfs(graph, N, M))
    }
}
