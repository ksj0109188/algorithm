//
//  14502.swift
//  BakJoon
//
//  Created by 김성준 on 11/21/24.
//

import Foundation

class 연구소_14502 {
    private let wallLimitCount = 3
    private var result: Int = 0
    
    func solve() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let n = input[0]
        let m = input[1]
        var arr: [[Int]] = []
        
        for _ in 0..<n {
            arr.append(readLine()!.split(separator: " ").map({ Int($0)! }))
        }
        
        solution(n: n, m: m, arr: &arr)
    }
    
    private func solution(n: Int, m: Int, arr: inout [[Int]]) {
        markWall(arr: &arr, markCount: 0)
        
        print(result)
    }
    
    private func markWall(arr: inout [[Int]], markCount: Int) {
        guard markCount < wallLimitCount else {
            let newArr = markVirus(arr: arr)
            result = max(result, countEmpty(arr: newArr))
            
            return
        }
        
        for i in 0..<arr.count {
            for j in 0..<arr.first!.count {
                if arr[i][j] == 0 {
                    arr[i][j] = 1
                    markWall(arr: &arr, markCount: markCount + 1)
                    arr[i][j] = 0
                }
            }
        }
    }
    
    private func markVirus(arr: [[Int]]) -> [[Int]]{
        var queue = findVirusPosition(arr: arr)
        let dicts = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        var newArr = arr
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            for dict in dicts {
                let nx = current.0 + dict.0
                let ny = current.1 + dict.1
                
                if (nx >= 0 && nx < newArr.count) && (ny >= 0 && ny < newArr.first!.count) {
                    if newArr[nx][ny] == 0 {
                        newArr[nx][ny] = 2
                        queue.append((nx, ny))
                    }
                }
            }
        }
        
        return newArr
    }
    
    private func findVirusPosition(arr: [[Int]]) -> [(Int, Int)] {
        var queue: [(Int,Int)] = []
        
        for i in 0..<arr.count {
            for j in 0..<arr.first!.count {
                if arr[i][j] == 2 {
                    queue.append((i, j))
                }
            }
        }
        
        return queue
    }
    
    private func countEmpty(arr: [[Int]]) -> Int {
//        return arr.map { $0.count(where: { $0 == 0 })}.reduce(0) { $0 + $1 }
        return arr.map { $0.filter { $0 == 0 }.count}.reduce(0){ $0 + $1 }
    }
    
}
