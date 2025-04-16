//
//  16234.swift
//  BakJoon
//
//  Created by 김성준 on 4/7/25.
//

import Foundation

class 인구이동_16234 {
    let dicts: [(r: Int, c: Int)] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    func exec() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let (n, L, R) = (input[0], input[1], input[2])
        var arr: [[Int]] = []
        
        for _ in 0..<n {
            arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
        }
        
        var days = 0
        
        func dfs(_ r: Int, _ c: Int, _ visited: inout [[Bool]]) -> [(Int, Int)] {
            var result: [(Int, Int)] = [(r, c)]
            visited[r][c] = true
            
            for dict in dicts {
                let nr = dict.r + r
                let nc = dict.c + c
                if (nr >= 0 && nr < n) && (nc >= 0 && nc < n) && !visited[nr][nc] {
                    let populationDiff = abs(arr[r][c] - arr[nr][nc])
                    
                    if populationDiff >= L && populationDiff <= R {
                        result += dfs(nr, nc, &visited)
                    }
                }
            }
            return result
        }

        while true {
            var visited: [[Bool]] = .init(repeating: .init(repeating: false, count: n), count: n)
            var moved = false
            
            for i in 0..<n {
                for j in 0..<n {
                    if !visited[i][j] {
                        let union = dfs(i, j, &visited)
                        if union.count > 1 {
                            moved = true
                            let total = union.reduce(0) { $0 + arr[$1.0][$1.1] }
                            let avg = total / union.count
                            for (r, c) in union {
                                arr[r][c] = avg
                            }
                        }
                    }
                }
            }

            if moved {
                days += 1
            } else {
                break
            }
        }

        print(days)
    }
}

//
//  16234.swift
//  BakJoon
//
//  Created by 김성준 on 4/7/25.
//


class 인구이동_16234_2 {
    let dicts: [(r: Int, c: Int)] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    func exec() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let (n, L, R) = (input[0], input[1], input[2])
        var arr: [[Int]] = []
        
        for _ in 0..<n {
            arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
        }
        
        var days = 0
        let dirs = [(-1, 0), (1, 0), (0, -1), (0, 1)]

        func bfs(_ startR: Int, _ startC: Int, _ visited: inout [[Bool]]) -> [(Int, Int)] {
            var q: [(Int, Int)] = [(startR, startC)]
            var union: [(Int, Int)] = [(startR, startC)]
            visited[startR][startC] = true
            var index = 0

            while index < q.count {
                let (r, c) = q[index]
                index += 1

                for (dr, dc) in dirs {
                    let nr = r + dr
                    let nc = c + dc
                    if nr >= 0 && nr < n && nc >= 0 && nc < n && !visited[nr][nc] {
                        let diff = abs(arr[r][c] - arr[nr][nc])
                        if diff >= L && diff <= R {
                            visited[nr][nc] = true
                            q.append((nr, nc))
                            union.append((nr, nc))
                        }
                    }
                }
            }
            return union
        }

        while true {
            var visited = Array(repeating: Array(repeating: false, count: n), count: n)
            var moved = false

            for i in 0..<n {
                for j in 0..<n {
                    if !visited[i][j] {
                        let union = bfs(i, j, &visited)
                        if union.count > 1 {
                            moved = true
                            let total = union.reduce(0) { $0 + arr[$1.0][$1.1] }
                            let avg = total / union.count
                            for (r, c) in union {
                                arr[r][c] = avg
                            }
                        }
                    }
                }
            }

            if moved {
                days += 1
            } else {
                break
            }
        }

        print(days)
    }
}
