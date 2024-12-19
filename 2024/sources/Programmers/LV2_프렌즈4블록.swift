//
//  LV2_프렌즈4블록.swift
//  BakJoon
//
//  Created by 김성준 on 10/2/24.
//

import Foundation

struct LV2_프렌즈4블록 {
    func solution(_ m: Int, _ n: Int, _ board: [String]) -> Int {
        var gameBoard = board.map { Array($0) }
        var totalRemoved = 0
        
        func checkBlock(_ r: Int, _ c: Int) -> Bool {
            let block = gameBoard[r][c]
            return block != " " &&
                   c + 1 < n && r + 1 < m &&
                   block == gameBoard[r][c+1] &&
                   block == gameBoard[r+1][c] &&
                   block == gameBoard[r+1][c+1]
        }
        
        func markBlocks() -> Bool {
            var marked = Array(repeating: Array(repeating: false, count: n), count: m)
            var hasMarked = false
            
            for r in 0..<m-1 {
                for c in 0..<n-1 {
                    if checkBlock(r, c) {
                        marked[r][c] = true
                        marked[r][c+1] = true
                        marked[r+1][c] = true
                        marked[r+1][c+1] = true
                        hasMarked = true
                    }
                }
            }
            
            for r in 0..<m {
                for c in 0..<n {
                    if marked[r][c] {
                        gameBoard[r][c] = " "
                        totalRemoved += 1
                    }
                }
            }
            
            return hasMarked
        }
        
        func dropBlocks() {
            for c in 0..<n {
                var bottom = m - 1
                for r in (0..<m).reversed() {
                    if gameBoard[r][c] != " " {
                        gameBoard[bottom][c] = gameBoard[r][c]
                        bottom -= 1
                    }
                }
                while bottom >= 0 {
                    gameBoard[bottom][c] = " "
                    bottom -= 1
                }
            }
        }
        
        while markBlocks() {
            dropBlocks()
        }
        
        return totalRemoved
    }
    
    func solution2(_ m:Int, _ n:Int, _ board:[String]) -> Int {
        // MARK: 방향 Dictionary 하단 / 우 / 대각선
        typealias Position = (x:Int, y: Int)
        var gameBoard = board.map{Array($0)}
        let directions: [Position] = [(1, 0), (0, 1), (1,1)]
        let deleteChar: Character = "d"
        var result = 0
        
        func isPossible(currentX:Int, currentY: Int) -> Bool {
            let baseChar = gameBoard[currentX][currentY]
            
            guard baseChar != deleteChar else {
                return false
            }
            
            for squreDict in directions {
                let nextX = currentX + squreDict.0
                let nextY = currentY + squreDict.1
            
                if (nextX >= 0 && nextX < board.count) && (nextY >= 0 && nextY < board.first!.count) {
                    if gameBoard[nextX][nextY] != baseChar {
                        return false
                    }
                } else {
                    return false
                }
            }
            
            return true
        }
        
        func scanWorks() -> [(Int, Int)] {
            var matchPositions: [(Int, Int)] = []
            
            for i in 0..<gameBoard.count {
                for j in 0..<gameBoard.first!.count {
                    if isPossible(currentX: i, currentY: j) {
                        matchPositions.append((i, j))
                    }
                }
            }
            
            return matchPositions
        }

        func changeBlock(_ queue: inout [(Int, Int)]) {
            while !queue.isEmpty {
                let workPosition = queue.removeFirst()
                let currentX = workPosition.0
                let currentY = workPosition.1
                
                if gameBoard[currentX][currentY] != deleteChar {
                    gameBoard[currentX][currentY] = deleteChar
                    result += 1
                }
                
                for squreDict in directions {
                    let nextX = currentX + squreDict.0
                    let nextY = currentY + squreDict.1
                    
                    if (nextX >= 0 && nextX <= board.count) && (nextY >= 0 && nextY <= board.first!.count) && gameBoard[nextX][nextY] != deleteChar {
                        gameBoard[nextX][nextY] = deleteChar
                        result += 1
                    }
                }
            }
            
        }
        
        func shiftDown(){
            for j in stride(from: (gameBoard.first?.count ?? 0) - 1, through: 0, by: -1) {
                var shiftCount = 0
                for i in stride(from: gameBoard.count - 1, through: 0, by: -1) {
                    if gameBoard[i][j] == deleteChar {
                        shiftCount += 1
                    } else {
                        if shiftCount + i < board.count {
                            gameBoard[shiftCount + i][j] = gameBoard[i][j]
                            
                            // 터진 블록이 없다면, 현재 블록은 위치가 변하지 않으므로 삭제를 해줄 필요가 없음
                            if shiftCount != 0 {
                                gameBoard[i][j] = deleteChar
                            }
                        }
                    }
                }
            }
        }
        
        var works: [(Int, Int)] = scanWorks()
        
        while !works.isEmpty {
            changeBlock(&works)
            shiftDown()
            works = scanWorks()
        }

        return result
    }

}
