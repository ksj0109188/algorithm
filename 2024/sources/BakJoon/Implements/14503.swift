//
//  14503.swift
//  BakJoon
//
//  Created by 김성준 on 11/22/24.
//

import Foundation

class 로봇청소기_14503 {
    private var result = 0
    ///Note:  북, 동, 남, 서 방향
    private let nextDicts = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    
    func solve() {
        let firstInput = readLine()!.split(separator: " ").map{ Int($0)! }
        let n = firstInput[0]
        let m = firstInput[1]
        
        let secondInput = readLine()!.split(separator: " ").map{ Int($0)! }
        let r = secondInput[0]
        let c = secondInput[1]
        let d = secondInput[2]
        
        var arr: [[Int]] = []
        
        for _ in 0..<n {
            arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
        }
        
        solution(n: n, m: m, r: r, c: c, d: d, arr: &arr)
    }
    
    func solution(n: Int, m: Int, r: Int, c: Int, d: Int, arr: inout [[Int]]) {
        var queue: [(Int, Int, Int)] = [(r, c, d)]
        
        while !queue.isEmpty {
            let position = queue.removeFirst()
            let curRow = position.0
            let curCol = position.1
            let curDict = position.2
            
            if arr[curRow][curCol] == 0 { //청소되지 않은 경우 청소처리
                arr[curRow][curCol] = 2
                result += 1
            }

            if let nextStep = nextStep(r: curRow, c: curCol, d: curDict, arr: arr) {
                queue.append(nextStep)
            } else { // 청소할 수 없을경우 그 방향대로 후진한다
                let nextStep = moveReverse(r: curRow, c: curCol, d: curDict)

                if checkPossiblePostion(r: nextStep.0, c: nextStep.1, n: n, m: m) {
                    if arr[nextStep.0][nextStep.1] != 1 {
                        queue.append((nextStep.0,nextStep.1, curDict))
                    }
                }
            }
        }
        
        print(result)
    }
    
    private func nextStep(r: Int, c: Int, d: Int, arr: [[Int]]) -> (Int, Int, Int)? {
        var curDict = d
        
        for _ in 0..<nextDicts.count {
            let rotatedDict = rotation(d: curDict)
            let nextDict = nextDicts[rotatedDict]
            let nr = r + nextDict.0
            let nc = c + nextDict.1
            
            if checkPossiblePostion(r: nr, c: nc, n: arr.count, m: arr.first!.count) {
                if arr[nr][nc] == 0 {
                    return (nr, nc, rotatedDict)
                }
            }
            
            curDict = rotatedDict
        }
        
        return nil
    }
    
    private func rotation(d: Int) -> Int {
        var nd = d
        
        if d - 1 < 0 {
            nd = 3
        } else {
            nd -= 1
        }
        
        return nd
    }
    
    private func moveReverse(r: Int, c: Int, d: Int) -> (Int, Int) {
        var nr = r
        var nc = c
        
        if d == 0 { // 북 -> 남
            nr += 1
        } else if d == 1 { // 동 -> 서
            nc -= 1
        } else if d == 2 { // 남 -> 북
            nr -= 1
        } else if d == 3 { // 서 -> 동
            nc += 1
        }
        
        return (nr, nc)
    }
    
    private func checkPossiblePostion(r: Int, c: Int, n: Int, m: Int) -> Bool {
        return (r >= 0 && r < n) && (c >= 0 && c < m) ? true : false
    }
    
}
