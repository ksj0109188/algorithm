//
//  22043.swift
//  BakJoon
//
//  Created by 김성준 on 1/19/25.
//

import Foundation


class 사이클게임_20040 {
    class UnionFind {
        private var parents: [Int]
        private var ranks: [Int]
        
        init(size: Int) {
            self.parents = Array(0...size - 1)
            self.ranks = .init(repeating: 0, count: size)
        }
        
        private func find(_ parent: Int) -> Int {
            if parents[parent] != parent {
                parents[parent] = find(parents[parent])
            }
            
            return parents[parent]
        }
        
        func union(x: Int, y: Int) -> Bool {
            let leftRoot = find(x)
            let rightRoot = find(y)
            
            if leftRoot == rightRoot {
                return false
            }
            
            if ranks[leftRoot] < ranks[rightRoot] {
                parents[leftRoot] = rightRoot
            } else if ranks[leftRoot] > ranks[rightRoot] {
                parents[rightRoot] = leftRoot
            }  else {
                parents[leftRoot] = rightRoot
                ranks[rightRoot] += 1
            }
            
            return true
        }
    }
    
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let n = input[0]
        let m = input[1]
        
        let unionFind = UnionFind(size: n)
        var result = 0
        
        for i in 0..<m {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let left = input[0]
            let right = input[1]
            
            if !unionFind.union(x: left, y: right) {
                result = i + 1
                break
            }
        }
        
        print(result)
    }
}
