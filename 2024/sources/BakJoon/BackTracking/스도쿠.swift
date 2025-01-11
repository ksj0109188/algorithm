//
//  스도쿠.swift
//  BakJoon
//
//  Created by 김성준 on 1/11/25.
//

import Foundation

class 스도쿠_2239 {
    private let size = 9
    
    func solution() {
        var arr = makeSudoku()
        var (rows, cols, boxes) = makeSets(arr: arr)
        
        dfs(&arr, startX: 0, startY: 0, rows: &rows, cols: &cols, boxes: &boxes)
    }
    
    func dfs(_ arr: inout [[Int]], startX: Int, startY: Int, rows: inout [Set<Int>], cols: inout [Set<Int>], boxes: inout [Set<Int>]) {
        if startX >= size {
            if arr[size - 1][size - 1] != 0 {
                // arr 1차원 배열에 있는 요소들 문자열로 출력
                arr.forEach {
                    print($0.map{String($0)}.joined())
                }
            }
            exit(0) // 프로그램 종료
        }
        
        var nextX = startX
        var nextY = startY + 1
        
        if nextY >= size {
            nextX += 1
            nextY = 0
        }
        
        if arr[startX][startY] == 0 {
            let boxIndex = (startX / 3) * 3 + (startY / 3)
            let rowIndex = startX
            let colIndex = startY
            
            for k in 1...9 {
                if !boxes[boxIndex].contains(k)
                    && !rows[rowIndex].contains(k)
                    && !cols[colIndex].contains(k) {
                    arr[startX][startY] = k
                    boxes[boxIndex].insert(k)
                    rows[rowIndex].insert(k)
                    cols[colIndex].insert(k)
                    
                    dfs(&arr, startX: nextX, startY: nextY, rows: &rows, cols: &cols, boxes: &boxes)
                    
                    arr[startX][startY] = 0
                    boxes[boxIndex].remove(k)
                    rows[rowIndex].remove(k)
                    cols[colIndex].remove(k)
                }
            }
        } else {
            dfs(&arr, startX: nextX, startY: nextY, rows: &rows, cols: &cols, boxes: &boxes)
        }
    }
 
    func makeSudoku() -> [[Int]] {
        var arr: [[Int]] = []
        
        for _ in 0..<9 {
            let inputString = Array(readLine()!)
            arr.append(inputString.map{ Int(String($0))! })
        }
        
        return arr
    }
    
    func makeSets(arr: [[Int]]) -> (rows: [Set<Int>], cols: [Set<Int>], boxes: [Set<Int>]) {
        var rows: [Set<Int>] = .init(repeating: [], count: 9)
        var cols: [Set<Int>] = .init(repeating: [], count: 9)
        var boxes: [Set<Int>] = .init(repeating: [], count: 9)
        
        // make the row sets
        for i in 0..<arr.count {
            arr[i].forEach{ rows[i].insert($0) }
        }
        
        // make the cols sets
        for i in 0..<arr.first!.count {
            for j in 0..<arr.count {
                cols[i].insert(arr[j][i])
            }
        }
        
        // make the boxes
        for i in 0..<arr.count {
            for j in 0..<arr[i].count {
                // Row sets
                rows[i].insert(arr[i][j])
                
                // Column sets
                cols[j].insert(arr[i][j])
                
                // Box sets
                let boxIndex = (i / 3) * 3 + (j / 3) // Calculate box index
                boxes[boxIndex].insert(arr[i][j])
            }
        }
            
        return (rows, cols, boxes)
    }
}
