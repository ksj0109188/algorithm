//
//  NQueen.swift
//  BakJoon
//
//  Created by 김성준 on 12/1/24.
//

import Foundation

class NQueen_9663 {
    var result = 0
    
    func solution() {
        let n = Int(readLine()!)!
        var arr: [[Int]] = []
        
        for _ in 0..<n {
            arr.append(.init(repeating: 0, count: n))
        }
        
        dfs(queens: [], count: 0, n: n)
        
        print(result)
    }
    
    private func dfs(queens: [(i: Int, j: Int)], count: Int, n: Int) {
        if count == n {
            result += 1
            return
        }

        for j in 0..<n {
            if isPossible(i: count, j: j, queens: queens) {
                dfs(queens: queens + [(i: count, j: j)], count: count + 1, n: n)
            }
        }
    }
    
    private func isPossible(i: Int, j: Int, queens: [(i: Int, j: Int)]) -> Bool {
        guard !queens.isEmpty else { return true}
        print("i, j = ", i, j)
        print("queens", queens)
        
        for queen in queens {
            
            if queen.i == i || queen.j == j { //수직 , 수평 체크
                return false
            }
//            이 부분은 틀림, 예를 들어 크기가 4일때, 1,3에 퀸이 있고 2,0에 놓을 수 있는지 체크할 때 못놓은다고 판별함
//            if abs(queen.i + queen.j) == abs(i + j) {
//                print("check 1")
//            }
//            if abs(queen.i - queen.j) == abs(i - j) {
//                print("check 2")
//            }
            
            if abs(queen.i - i) == abs(queen.j - j) {
                return false
            }
        }
        
        return true
    }
}


