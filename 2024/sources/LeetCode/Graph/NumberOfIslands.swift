//
//  NumberOfIslands.swift
//  BakJoon
//
//  Created by 김성준 on 6/10/24.
//

import Foundation

class Solution200 {
    func numIslands(_ grid: [[Character]]) -> Int {
        var result = 0
        var visitList = Array(repeating: Array(repeating: false, count: grid.first!.count), count: grid.count)
        let directs = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        // 1이 이어진 걸 dfs로 탐색하고
        func dfs( _ x: Int, _ y: Int) {
            // 방향 좌표가 유효한 좌표가 되는지 체크 후
            for direct in directs {
                let nx = x + direct.0
                let ny = y + direct.1
                
                visitList[x][y] = true
                // 유효하면 visited 체크 후, 1이 이어진 부분 전부 dfs로 탐색해
                if (nx >= 0 && nx < grid.count) && (ny >= 0 && ny < grid.first!.count) {
                    if grid[nx][ny] == "1" && !visitList[nx][ny] {
                        dfs(nx, ny)
                    }
                }
            }
        }
        
        for (rowIndex, row) in grid.enumerated() {
            for (colIndex, grid) in row.enumerated() {
                if grid == "1" && !visitList[rowIndex][colIndex] {
                    result += 1
                    dfs(rowIndex, colIndex)
                }
            }
        }
        
        return result
    }
    
    func improvedNumIslands(_ grid: [[Character]]) -> Int {
        var grid = grid // grid를 변경 가능하게 복사
        var result = 0
        let directs = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        // DFS 함수
        func dfs(_ x: Int, _ y: Int) {
            // 유효한 좌표인지 확인하고 방문한 경우 종료
            if x < 0 || x >= grid.count || y < 0 || y >= grid[0].count || grid[x][y] == "0" {
                return
            }
            // 방문 표시 (0으로 변경)
            grid[x][y] = "0"
            // 네 방향 탐색
            for direct in directs {
                dfs(x + direct.0, y + direct.1)
            }
        }
        
        // 그리드 전체를 순회하며 섬 찾기
        for (rowIndex, row) in grid.enumerated() {
            for (colIndex, cell) in row.enumerated() {
                // 새로운 섬을 발견하면 DFS로 탐색 시작
                if cell == "1" {
                    result += 1
                    dfs(rowIndex, colIndex)
                }
            }
        }
        
        return result
    }
}
