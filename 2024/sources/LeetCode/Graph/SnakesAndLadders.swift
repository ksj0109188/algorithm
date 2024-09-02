//
//  SnakesAndLadders.swift
//  BakJoon
//
//  Created by 김성준 on 6/20/24.
//

import Foundation

class SnakesAndLadders {
    //notes: 어떻게 해야할지 감이 안잡혔음, 그래프를 그려야 할까 생각도 했음 -> 문제 카테고리가 그래프라 이런 생각을 한듯....
    ///notes: 포인트는 좌표계를 변환한 다음에 차례대로 접근하면 됐었음
    func snakesAndLadders(_ board: [[Int]]) -> Int {
        /// notes: 홀/ 짝에 따라 진행 할 수 있는 방향이 왼쪽, 오른쪽인지 알 수 있다.
        /// board를 1차원 배열로 표현 할 수도 있고 이를, 나눈 값으로 행의 값을 구할 수 있다
        /// 한 행에서 같은
        let n = board.count
        var flatBoard = board.flatMap{$0}
        var queue = [(board.count - 1, 0)]
        var isVisited = Set<Int>()
        var result = 0
        
        while !queue.isEmpty {
            let (row, col) = queue.removeFirst()
            
            if row % 2 == 0 {
                // row 인덱스가 짝수일 경우에는 <-방향 (오른쪽 -> 왼쪽)
                for j in stride(from: n - 1, through: col, by: -1) {
                    
                }
            } else {
                // 홀수일 경우에는 -> 방향 (왼쪽 -> 오른쪽)
                for j in col...n {
                    if board[row][j] != -1 && !isVisited.contains(row * col){
                        isVisited.insert(row * col)
                        queue.append((board[row][j], j))
                    }
                    // -1이 아닌 경우 해당 위치로 이동
                    // 만약 이미 이동했던 경우엔 무시
                }
            }
                
            
        }
        
        print(flatBoard)
        
        return 0
    }
}
