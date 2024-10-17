//
//  11725.swift
//  BakJoon
//
//  Created by 김성준 on 10/17/24.
//

import Foundation

class 트리의부모찾기_11725 {
    func solution() {
        let n = Int(readLine()!)!
        let trees: [Int: [Int]] = makeTrees(n)
        let results = bfs(trees: trees, n)
        
        for i in 2...n {
            print(results[i])
        }
    }
    
    func makeTrees(_ n: Int) ->  [Int: [Int]] {
        var trees: [Int: [Int]] = [:]
        
        for _ in 1..<n {
            let path = readLine()!.split(separator: " ").map{ Int($0)! }
            let source = path[0]
            let target = path[1]
            
            trees[source, default: []].append(target)
            trees[target, default: []].append(source)
        }
        
        return trees
    }
    
    func bfs(trees: [Int: [Int]], _ n: Int) -> [Int] {
        var searchResult: [Int] = .init(repeating: -1, count: n + 1)
        var isVisited = [Bool](repeating: false, count: n + 1)
        var queue: [Int] = [1]
        
        while !queue.isEmpty {
            let rootNode =  queue.removeFirst()
        
            if !isVisited[rootNode], let childNodes = trees[rootNode] {
                isVisited[rootNode] = true
                
                for childNode in childNodes {
                    if !isVisited[childNode] {
                        searchResult[childNode] = rootNode
                        queue.append(childNode)
                    }
                }
            }
            
        }
        
        return searchResult
    }
    
}
