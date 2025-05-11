//
//  12100.swift
//  BakJoon
//
//  Created by 김성준 on 5/11/25.
//

import Foundation

class 보드_12100 {
    var result = 0
    
    func moveToLeft(_ board: [[Int]]) -> [[Int]] {
        return board.map {
            let row = $0.filter{ $0 != 0 }
            var newRow: [Int] = []
            var isSkip: Bool = false
            
            for i in 0..<row.count {
                if isSkip {
                    isSkip = false
                    continue
                }
                
                if i + 1 < row.count && row[i] == row[i + 1] {
                    newRow.append(2 * row[i])
                    isSkip = true
                } else {
                    newRow.append(row[i])
                }
            }
            
            while newRow.count < $0.count {
                newRow.append(0)
            }
            
            return newRow
        }
    }
    
    func moveToRight(_ board: [[Int]]) -> [[Int]] {
        return board.map { row in
            let reversedRow = Array(row.reversed())
            let movedRow = moveToLeft([reversedRow])[0]
            
            return Array(movedRow.reversed())
        }
    }
    
    func moveToTop(_ board: [[Int]]) -> [[Int]] {
        let transposed = transpose(board)
        let moved = moveToLeft(transposed)
        return transpose(moved)
    }
    
    func moveToBottom(_ board: [[Int]]) -> [[Int]] {
        let transposed = transpose(board)
        let moved = moveToRight(transposed)
        return transpose(moved)
    }
    
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        let n = matrix.count
        
        var result = Array(repeating: Array(repeating: 0, count: n), count: n)
        
        for i in 0..<n {
            for j in 0..<n {
                result[j][i] = matrix[i][j]
            }
        }
        return result
    }
    
    func dfs(_ count: Int, _ board: [[Int]]) {
        if count == 5 {
            result = max(calculateScore(board),result)
            return
        }
        
        var directions: [([[Int]]) -> [[Int]]] = [moveToTop, moveToBottom, moveToLeft, moveToRight]
        
        for direction in directions {
            let newBoard = direction(board)
            dfs(count + 1, newBoard)
        }
    }
    
    func exec() {
        let n = Int(readLine()!)!
        var board: [[Int]] = []
        
        for _ in 0..<n {
            board.append(readLine()!.split(separator: " ").map{ Int($0)! })
        }
        
        dfs(0, board)
        
        print(result)
    }
    
    func calculateScore(_ board: [[Int]]) -> Int {
        return board.map {
            $0.max()!
        }.max()!
    }
}
