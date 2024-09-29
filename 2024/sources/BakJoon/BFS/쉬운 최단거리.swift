//
//  쉬운 최단거리.swift
//  BakJoon
//
//  Created by 김성준 on 9/29/24.
//

import Foundation

struct 쉬운최단거리 {
    struct Edge {
        let step: (rowIndex: Int, colIndex: Int)
        let val: Int
    }
    
    func solution() {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let n = input[0]
        let m = input[1]
        var arr: [[Int]] = .init(repeating: [], count: n)
        var isVisted: [[Bool]] = .init(repeating: .init(repeating: false, count: m), count: n)
        var distance: [[Int]] = .init(repeating: .init(repeating: -1, count: m), count: n)
        var startStep: (rowIndex: Int, colIndex: Int) = (0, 0)
        let nextPaths: [(rowIndex: Int, colIndex: Int)] = [(-1, 0), (1,0), (0,-1), (0, 1)]
        
        for i in 0..<n {
            let rows = readLine()!.split(separator: " ").map{ Int($0)! }
            if let targetIndex = rows.firstIndex(where: {$0 == 2}) {
                startStep = (i, targetIndex)
            }
            arr[i] = rows
        }
        
        var queue:[Edge] = [.init(step: startStep, val: 0)]
        distance[startStep.rowIndex][startStep.colIndex] = 0
        isVisted[startStep.rowIndex][startStep.colIndex] = true
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            for nextPath in nextPaths {
                let nextRow = current.step.rowIndex + nextPath.rowIndex
                let nextCol = current.step.colIndex + nextPath.colIndex
                
                if (nextRow >= 0 && nextRow < n) && (nextCol >= 0 && nextCol < m) && !isVisted[nextRow][nextCol] && arr[nextRow][nextCol] == 1 {
                    isVisted[nextRow][nextCol] = true
                    distance[nextRow][nextCol] = current.val + 1
                    queue.append(.init(step: (rowIndex: nextRow, colIndex: nextCol), val: current.val + 1))
                }
            }
        }
        
        var result = ""
        
        for i in 0..<n {
            for j in 0..<m {
                if arr[i][j] == 0 {
                    result += "0"
                } else {
                    result += "\(distance[i][j])"
                }
                
                if j != m - 1 { result += " "}
            }
            result += "\n"
        }
        
        print(result)
    }
}
