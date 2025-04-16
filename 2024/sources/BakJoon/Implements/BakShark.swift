//
//  BakShark.swift
//  BakJoon
//
//  Created by 김성준 on 4/7/25.
//

import Foundation

class BabyShark {
    struct Position: Hashable {
        var x: Int
        var y: Int
    }
    
    let dx = [-1, 0, 1, 0]
    let dy = [0, -1, 0, 1]

    func exec() {
        let n = Int(readLine()!)!
        var map = [[Int]]()
        var sharkSize = 2
        var eatenFish = 0
        var time = 0
        var sharkPosition: Position?

        // 맵 입력 받기
        for i in 0..<n {
            let row = readLine()!.split(separator: " ").map { Int($0)! }
            map.append(row)
            if let j = row.firstIndex(of: 9) {
                sharkPosition = Position(x: i, y: j)
                map[i][j] = 0
            }
        }

        // BFS 탐색 함수
        func bfs(start: Position) -> (Position, Int)? {
            var queue = [(Position, Int)]() // (위치, 이동 거리)
            var visited = Set<Position>()
            var candidates = [(Position, Int)]()

            queue.append((start, 0))
            visited.insert(start)

            while !queue.isEmpty {
                let (current, distance) = queue.removeFirst()

                for i in 0..<4 {
                    let nx = current.x + dx[i]
                    let ny = current.y + dy[i]

                    if nx >= 0, ny >= 0, nx < n, ny < n, !visited.contains(Position(x: nx, y: ny)) {
                        if map[nx][ny] <= sharkSize {
                            visited.insert(Position(x: nx, y: ny))
                            queue.append((Position(x: nx, y: ny), distance + 1))
                            
                            if map[nx][ny] > 0, map[nx][ny] < sharkSize {
                                candidates.append((Position(x: nx, y: ny), distance + 1))
                            }
                        }
                    }
                }
            }

            // 먹을 수 있는 물고기 중 가장 가까운 물고기 찾기
            if let closestFish = candidates.min(by: {
                ($0.1, $0.0.x, $0.0.y) < ($1.1, $1.0.x, $1.0.y)
            }) {
                return closestFish
            } else {
                return nil
            }
        }

        while let (nextFish, distance) = bfs(start: sharkPosition!) {
            // 이동
            sharkPosition = nextFish
            time += distance
            eatenFish += 1
            map[nextFish.x][nextFish.y] = 0

            // 상어 크기 증가 조건 확인
            if eatenFish == sharkSize {
                sharkSize += 1
                eatenFish = 0
            }
        }

        print(time)
    }
}
