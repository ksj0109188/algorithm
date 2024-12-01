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
          for queen in queens {
              if queen.i == i || queen.j == j { // 수직, 수평 체크
                  return false
              }
              if abs(queen.i - i) == abs(queen.j - j) { // 대각선 체크
                  return false
              }
          }
          return true
      }
}
