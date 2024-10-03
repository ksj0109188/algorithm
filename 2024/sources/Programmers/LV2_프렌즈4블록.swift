//
//  LV2_프렌즈4블록.swift
//  BakJoon
//
//  Created by 김성준 on 10/2/24.
//

import Foundation

struct LV2_프렌즈4블록 {
//    func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
//        var isWork = true
//        var paths = [(1, 0), (-1, 0), (0, -1), (0, 1)]
//        var arr: [String] = .init(repeating: "", count: board.count)
//        
//        for i in 0..<board.count {
//            let swpeIndex = (board.count - 1) - i
//            arr[i] = board[swpeIndex]
//        }
//        
//        while isWork {
//            for i in 0..<m {
//                for j in 0..<n {
//                    var isComputeCount = 0
//                    
//                    for path in paths {
//                        let nx =  i + path.0
//                        let ny = j + path.1
//                        
//                        if (ny >= 0 && ny < arr[i].count ) {
//                            
//                        }
//                    }
//                }
//            }
//        }
//        
//        
//        return 0
//    }

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
}
