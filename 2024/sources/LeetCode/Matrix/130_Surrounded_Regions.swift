//
//  130_Surrounded_Regions.swift
//  BakJoon
//
//  Created by 김성준 on 1/25/24.
//

import Foundation

// 24/01/30 시간초과
//func solve(_ board: inout [[String]]) {
//    var changeList: [(Int,Int)] = []
//    
//    for i in 0..<board.count {
//        for j in 0..<board[i].count {
//            if board[i][j] == "O" {
//                changeList.removeAll()
//                if checkConvert(board: &board, currentXY: (i, j), changeList: &changeList) {
//                    changeList.forEach { x, y in
//                        board[x][y] = "X"
//                    }
//                }
//            }
//        }
//    }
//    
//    print(board)
//    
//}
//
//func checkConvert(board: inout [[String]], currentXY: (Int, Int), changeList: inout [(Int,Int)]) -> Bool{
//    var canConvert = true
//    let currentX = currentXY.0
//    let currentY = currentXY.1
//    let direct = ["top": currentX - 1, "bottom": currentX + 1, "left": currentY - 1, "right": currentY + 1]
//    // 경계선 상 하 좌 우 일 경우 바꾸지 않음.
//    if direct["top"]! < 0 || direct["bottom"]! >= board.count || direct["left"]! < 0 || direct["right"]! >= board[currentX].count{
//        canConvert = false
//        return canConvert
//    }
//    
//    changeList.append((currentX, currentY))
//    
//    // 상
//    if board[direct["top"]!][currentY] == "O" && !changeList.contains(where: {$0 == (direct["top"]!, currentY)}) && canConvert {
//        canConvert = checkConvert(board: &board, currentXY: (direct["top"]!,currentY), changeList: &changeList)
//    }
//    // 하
//    if board[direct["bottom"]!][currentY] == "O" && !changeList.contains(where: {$0 == (direct["bottom"]!, currentY)}) && canConvert {
//        canConvert = checkConvert(board: &board, currentXY: (direct["bottom"]!,currentY), changeList: &changeList)
//    }
//    // 좌
//    if board[currentX][direct["left"]!] == "O" && !changeList.contains(where: {$0 == (currentX, direct["left"]!)}) && canConvert {
//        canConvert = checkConvert(board: &board, currentXY: (currentX, direct["left"]!), changeList: &changeList)
//    }
//    // 우
//    if board[currentX][direct["right"]!] == "O" && !changeList.contains(where: {$0 == (currentX, direct["right"]!)})  && canConvert{
//        canConvert = checkConvert(board: &board, currentXY: (currentX, direct["right"]!), changeList: &changeList)
//    }
//    
//    return canConvert
//}


//func solve(_ board: inout [[String]]) {
//    let rows = board.count
//    let cols = board[0].count
//
//    // 테두리의 'O' 찾기
//    for i in 0..<rows {
//        for j in [0, cols - 1] {
//            if board[i][j] == "O" {
//                dfs(&board, i, j)
//            }
//        }
//    }
//
//    for i in [0, rows - 1] {
//        for j in 0..<cols {
//            if board[i][j] == "O" {
//                dfs(&board, i, j)
//            }
//        }
//    }
//
//    // 모든 'O'를 'X'로, 모든 'A'를 'O'로 변환
//    for i in 0..<rows {
//        for j in 0..<cols {
//            if board[i][j] == "O" {
//                board[i][j] = "X"
//            } else if board[i][j] == "A" {
//                board[i][j] = "O"
//            }
//        }
//    }
//}
//
//func dfs(_ board: inout [[String]], _ x: Int, _ y: Int) {
//    let rows = board.count
//    let cols = board[0].count
//
//    if x < 0 || x >= rows || y < 0 || y >= cols || board[x][y] != "O" {
//        return
//    }
//
//    board[x][y] = "A"
//    // 우, 상,좌, 하
//    let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
//    for (dx, dy) in directions {
//        dfs(&board, x + dx, y + dy)
//    }
//}
