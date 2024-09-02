//
//  baekjoon1063.swift
//  BakJoon
//
//  Created by 김성준 on 3/15/24.
//

import Foundation

//TODO: need pass 
class baekjun1063 {
    func solve() {
        
        let colums = ["A", "B", "C", "D", "E", "F", "G", "H"]
        let convertedCommands = ["R": (0,1),
                                 "L": (0,-1),
                                 "B": (-1,0),
                                 "T": (1,0),
                                 "RT": (1,1),
                                 "LT": (1,-1),
                                 "RB":(-1,1),
                                 "LB":(-1,-1)]
        let n = 8, m = 8
        var matrix = Array(repeating: Array(repeating: 0, count: m), count: n)
        
        let input = readLine()!.split(separator: " ").compactMap { String($0) }
        let kingPosition = input[0]
        let rockPosition = input[1]
        let moveCount = Int(input[2])!
        
        var kingCol = colums.firstIndex(of: String(kingPosition.first!))!
        var kingRow = Int(kingPosition.dropFirst())! - 1
        var rockCol = colums.firstIndex(of: String(rockPosition.first!))!
        var rockRow = Int(rockPosition.dropFirst())! - 1
        
        var kingResult = input[0]
        var rockResult = input[1]
        
        // 1: 채스위치, 2: 돌위치
        matrix[kingRow][kingCol] = 1
        matrix[rockRow][rockCol] = 2
        
        for _ in 0..<moveCount {
            let command = readLine()!
            let nx = convertedCommands[command]!.0
            let ny = convertedCommands[command]!.1
            let knx = nx + kingRow
            let kny = ny + kingCol
            let rnx = nx + rockRow
            let rny = ny + rockCol
            
            
            // 돌이나 킹이 체스판에 나갈경우 체크
            // 돌이 체스 이동방향에 있을 때 돌이 떨어지지 않는지 체크해야함
            if (knx < n && knx >= 0) && (kny < m && kny >= 0) {
                // 돌이 있는 경우 돌이 나갈수 없는지 체크해 움직이고
                if matrix[knx][kny] == 2 && (rnx < n && rnx >= 0) && (rny < m && rny >= 0) {
                    matrix[rockRow][rockCol] = 0
                    matrix[rnx][rny] = 2
                    rockRow = rnx
                    rockCol = rny
                    
                    matrix[kingRow][kingCol] = 0
                    matrix[knx][kny] = 1
                    kingRow = knx
                    kingCol = kny
                    
                    rockResult = "\(colums[rny])\(rnx + 1)"
                    kingResult = "\(colums[kny])\(knx + 1)"
                }
                else if matrix[knx][kny] == 0 {
                    matrix[kingRow][kingCol] = 0
                    matrix[knx][kny] = 1
                    kingResult = "\(colums[kny])\(knx + 1)"
                }
            }
        }
        
        print("\n\(kingResult)")
        print(rockResult)
        input.filter{$0 == "dd"}
    }
    
}
