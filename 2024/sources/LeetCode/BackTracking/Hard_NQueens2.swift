//
//  Hard_NQueens2.swift
//  BakJoon
//
//  Created by 김성준 on 5/31/24.
//

import Foundation

//작성코드
// Time : O((n^n ) n) = (행*열) * false 변환 연산
// space complexity = n -> dfs의 깊이는 이미 놓은 퀸의 갯수까지만 탐색
//class Solution_NQueens2 {
//    func totalNQueens(_ n: Int) -> Int {
//        var result = 0
//        let possibleList: [[Bool]] = [[Bool]](repeating: [Bool](repeating: true, count: n), count: n)
//    
//        func dfs(_ possibleList: [[Bool]], _ qCount: Int, _ startRowPosition: Int) {
//            if qCount == n {
//                result += 1
//            }
//            
//            // 이미 둔 행에서 다른 열도 두어서 시도할 필요가 있음
//            for i in startRowPosition..<n {
//                for j in 0..<n {
//                    if possibleList[i][j] == true {
//                        dfs(transPossible(possibleList, i, j, n), qCount + 1, i + 1)
//                    }
//                }
//            }
//        }
//        
//        dfs(possibleList, 0, 0)
//        
//        return result
//    }
//    
//    ///notes: rowPosition, colPosition의 경우 체스가 놓인 위치임
//    private func transPossible(_ possibleList: [[Bool]], _ rowPosition: Int, _ colPostion: Int, _ n: Int ) -> [[Bool]] {
//        var possibleList = possibleList
//        
//        // 가로, 세로
//        for i in 0..<n {
//            possibleList[rowPosition][i] = false
//            possibleList[i][colPostion] = false
//        }
//        
//        var curRow = rowPosition
//        var curCol = colPostion
//        
//        // \대각선 -> +(1, 1)
//        while curRow > 0 && curCol > 0 {
//            curRow -= 1
//            curCol -= 1
//        }
//        
//        while checkRange(curRow, curCol, n) {
//            possibleList[curRow][curCol] = false
//            curRow += 1
//            curCol += 1
//        }
//        
//        curRow = rowPosition
//        curCol = colPostion
//        
//        //MARK: /대각선 이상하게 처리됨
//        // /대각선 -> +(1, 1)
//        while curRow > 0 && curCol < n - 1  {
//            curRow -= 1
//            curCol += 1
//        }
//        
//        while checkRange(curRow, curCol, n) {
//            possibleList[curRow][curCol] = false
//            curRow += 1
//            curCol -= 1
//        }
//        
//        return possibleList
//    }
//    
//    private func checkRange(_ row: Int, _ col: Int, _ n: Int) -> Bool {
//        return (row < n && row >= 0) && (col < n && col >= 0) ? true : false
//    }
//}

///notes: 개선안
//class Solution_NQueens2 {
//    func totalNQueens(_ n: Int) -> Int {
//        var result = 0
//        var cols = Array(repeating: false, count: n)
//        var diag1 = Array(repeating: false, count: 2 * n - 1) // row - col 값의 범위: // -n+1 ~ n-1 -> N=4일때 범위는 -3 ~ 3
//        var diag2 = Array(repeating: false, count: 2 * n - 1) // row + col 값의 범위: // 0 ~ 2n-2. -> N=4일때 범위는 0 ~ 6(0,0 -> 3,3일때 대각선 범위 이걸 식으로 나타내면 (n-1) + (n-1) -> 2(n-1))
//        
//        func dfs(_ row: Int) {
//            if row == n {
//                result += 1
//                return
//            }
//            
//            for col in 0..<n {
//                let d1 = row - col + n - 1 // diag1 배열의 인덱스를 맞추기 위해 + n - 1 // 이부분은 이해가 잘 안감 N = 3 -> -3 ~ 3의 범위를 가지니, 이걸 양수로 전환하기위 해 + n-1을 한 듯.
//                let d2 = row + col
//                
//                if !cols[col] && !diag1[d1] && !diag2[d2] {
//                    cols[col] = true // true는 체스를 놓았다는 플래그값
//                    diag1[d1] = true
//                    diag2[d2] = true
//                    
//                    dfs(row + 1)
//                    
//                    cols[col] = false
//                    diag1[d1] = false
//                    diag2[d2] = false
//                }
//            }
//        }
//        
//        dfs(0)
//        return result
//    }
//    
////    func totalNQueens(_ n: Int) -> Int {
////        var result = 0
////        var cols = Set<Int>()
////        var diag1 = Set<Int>()
////        var diag2 = Set<Int>()
////        
////        func dfs(_ row: Int) {
////            if row == n {
////                result += 1
////                return
////            }
////            
////            for col in 0..<n {
////                let d1 = row - col
////                let d2 = row + col
////                
////                if !cols.contains(col) && !diag1.contains(d1) && !diag2.contains(d2) {
////                    cols.insert(col)
////                    diag1.insert(d1)
////                    diag2.insert(d2)
////                    
////                    dfs(row + 1)
////                    
////                    cols.remove(col)
////                    diag1.remove(d1)
////                    diag2.remove(d2)
////                }
////            }
////        }
////        
////        dfs(0)
////        return result
////    }
//}
//

//class Hard_NQueens2 {
//    func totalNQueens(_ n: Int) -> Int {
//        
//    }
//}
