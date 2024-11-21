//
//  13549.swift
//  BakJoon
//
//  Created by 김성준 on 11/20/24.
//

import Foundation

class 숨바꼭질13549 {
    func solve() {
        let input = readLine()!.split(separator: " ").map{Int($0)!}
        let n = input[0]
        let k = input[1]
        
        print(숨바꼭질13549(n: n, k: k))
    }
    
    private func 숨바꼭질13549(n: Int, k: Int) -> Int {
        let limitCount = 100_000
        var visited = [Int](repeating: -1, count: limitCount + 1)
        var queue: [Int] = [n]
        visited[n] = 0
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            
            if current == k {
                return visited[current]
            }
            
            if current * 2 <= limitCount && visited[current * 2] == -1 {
                visited[current * 2] = visited[current]
                queue.insert(current * 2, at: 0)
            }
            
            if current - 1 >= 0 && visited[current - 1] == -1 {
                visited[current - 1] = visited[current] + 1
                queue.append(current - 1)
            }
            
            if current + 1 <= limitCount && visited[current + 1] == -1 {
                visited[current + 1] = visited[current] + 1
                queue.append(current + 1)
            }
        }
        
        return Int.max
    }
}
