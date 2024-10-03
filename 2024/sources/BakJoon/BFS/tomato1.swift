//
//  tomato1.swift
//  BakJoon
//
//  Created by 김성준 on 10/3/24.
//

import Foundation

struct tomato1 {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)!}
        let m = input[0]
        let n = input[1]
        
        var arr: [[Int]] = .init(repeating: [], count: n)
        
        for i in 0..<n {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            arr[i] = input
        }
        
        var queue: [(i:Int, j:Int)] = fetchStartPoint(arr: arr)
        let nextSteps = [(1, 0), (-1, 0), (0, -1), (0, 1)]
        var result = 0
        
        while !queue.isEmpty {
            var tempQueue: [(i:Int, j:Int)] = []
            
            for current in queue {
                for nextStep in nextSteps {
                    let nx = current.i + nextStep.0
                    let ny = current.j + nextStep.1
                    
                    if (nx >= 0 && nx < n) && (ny >= 0 && ny < m) && arr[nx][ny] == 0 {
                        arr[nx][ny] = 1
                        tempQueue.append((i: nx, j: ny))
                    }
                }
            }
            
            if !tempQueue.isEmpty {
                result += 1
            }
            
            queue = tempQueue
        }
        
        
        print(checkPossible(arr: arr) ? result : -1)
    }
    
    private func checkPossible(arr: [[Int]]) -> Bool {
        var result = true
        
        for i in 0..<arr.count {
            if arr[i].contains(0) {
                result = false
            }
        }
        
        return result
    }
    
    private func fetchStartPoint(arr: [[Int]]) -> [(i:Int, j:Int)] {
        var queue: [(i:Int, j:Int)] = []
        
        for i in 0..<arr.count {
            for j in 0..<arr[i].count {
                if arr[i][j] == 1 {
                    queue.append((i: i, j: j))
                }
            }
        }
        
        return queue
    }
}
