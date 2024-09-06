//
//  baekjoon_1012_유기농배추.swift
//  BakJoon
//
//  Created by 김성준 on 9/6/24.
//

import Foundation

class baekjoon_1012_유기농배추 {
    struct Path: Hashable {
        let x: Int
        let y: Int
    }
    
    func solution() {
        let routes = [(x: -1, y: 0), (x: 1, y: 0), (x: 0, y: -1), (x: 0, y: 1)] // // 상, 하, 좌, 우
        
        let t = Int(readLine()!)!
        
        for _ in 0..<t {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let m = input[0]
            let n = input[1]
            let k = input[2]
            
            var arr: [[Int]] = Array(repeating: [Int](repeating: 0, count: n), count: m)
            var visited = Set<Path>()
            var result = 0
            
            for _ in 0..<k {
                let input = readLine()!.split(separator: " ").map{ Int($0)! }
                let x = input[0]
                let y = input[1]
                
                arr[x][y] = 1
            }
            
            for i in 0..<m {
                for j in 0..<n {
                    let path = Path(x: i, y: j)
                    if arr[i][j] == 1 && !visited.contains(path) {
                        visited.insert(path)
                        bfs(i, j)
                        result += 1
                    }
                }
            }
            
            print(result)
            
            func bfs(_ i: Int, _ j: Int) {
                var queue = [Path(x: i, y: j)]
                
                while !queue.isEmpty {
                    let path = queue.removeFirst()
                    
                    for route in routes {
                        let nextX = path.x + route.x
                        let nextY = path.y + route.y
                        let nextPath = Path(x: nextX, y: nextY)
                        
                        if nextX >= 0 && nextX < arr.count && nextY >= 0 && nextY < arr[0].count {
                            if arr[nextX][nextY] == 1 && !visited.contains(nextPath) {
                                visited.insert(nextPath)
                                queue.append(nextPath)
                            }
                        }
                    }
                }
            }
        }
    }
}
