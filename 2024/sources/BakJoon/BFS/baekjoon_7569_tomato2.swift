//
//  tomato2.swift
//  BakJoon
//
//  Created by 김성준 on 10/3/24.
//

import Foundation

class baekjoon_7569_tomato2 {
    let nextSteps:  [(x: Int, y: Int, z: Int)]  = [(-1,0,0), (1,0,0), (0,-1,0), (0,1,0), (0,0,1), (0,0,-1)] // 상, 하, 좌, 우, 앞, 뒤
    var m: Int = 0
    var n: Int = 0
    var h: Int = 0
    
    func solution() {
        let arr = makeArray()
        
        bfs(queue: fetchStartPoint(arr), arr: arr)
    }
    
    private func makeArray() -> [[[Int]]]  {
        let input = readLine()!.split(separator: " ").map{ Int($0)!}
        m = input[0]
        n = input[1]
        h = input[2]
        
        var arr: [[[Int]]] = .init(repeating: .init(repeating: [], count: n), count: h)
        
        for i in 0..<h {
            for j in 0..<n {
                let input = readLine()!.split(separator: " ").map{ Int($0)! }
                arr[i][j] = input
            }
        }
        
        return arr
    }
    
    private func fetchStartPoint(_ arr: [[[Int]]]) -> [(x: Int, y: Int, z: Int)] {
        var startPoints: [(Int, Int, Int)] = []
        
        for i in 0..<arr.count {
            for j in 0..<arr[i].count {
                for k in 0..<arr[i][j].count {
                    if arr[i][j][k] == 1 {
                        startPoints.append((j, k, i))
                    }
                }
            }
        }
        
        return startPoints
    }
    
    private func bfs(queue: [(x: Int, y: Int, z: Int)], arr: [[[Int]]]) {
        var queue = queue
        var result = 0
        var arr = arr
        
        while !queue.isEmpty {
            var tempQueue: [(x: Int, y: Int, z: Int)] = []
            
            for current in queue {
                for nextStep in nextSteps {
                    let nx = current.x + nextStep.0
                    let ny = current.y + nextStep.1
                    let nz = current.z + nextStep.2
                    
                    if (nz >= 0 && nz < h)
                        && (nx >= 0 && nx < n)
                        && (ny >= 0 && ny < m)
                        && arr[nz][nx][ny] == 0 {
                        arr[nz][nx][ny] = 1
                        tempQueue.append((x: nx, y: ny, z: nz))
                    }
                }
            }
            
            if !tempQueue.isEmpty {
                result += 1
            }
            
            queue = tempQueue
        }
        
        // BFS가 끝난 후 익지 않은 토마토가 남아 있는지 확인
        for i in 0..<h {
            for j in 0..<n {
                for k in 0..<m {
                    if arr[i][j][k] == 0 {
                        print(-1)
                        return
                    }
                }
            }
        }
        
        print(result)
    }
}
