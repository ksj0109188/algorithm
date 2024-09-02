//
//  EvaluateDivision.swift
//  BakJoon
//
//  Created by 김성준 on 6/12/24.
//

import Foundation

class EvaluateDivision {
    // bfs를 활용한 풀이
    func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
           var graph = [String: [String: Double]]()
           var results = [Double]()
           
           // 그래프 구축
           for (index, equation) in equations.enumerated() {
               let (A, B) = (equation[0], equation[1])
               let value = values[index]
               if graph[A] == nil {
                   graph[A] = [String: Double]()
               }
               if graph[B] == nil {
                   graph[B] = [String: Double]()
               }
               graph[A]![B] = value
               graph[B]![A] = 1.0 / value
           }
           
           for query in queries {
               let (C, D) = (query[0], query[1])
               if C == D {
                   if graph[C] != nil {
                       results.append(1.0)
                   } else {
                       results.append(-1.0)
                   }
               } else {
                   results.append(bfs(C, D))
               }
           }
           
           // BFS 탐색
           func bfs(_ start: String, _ end: String) -> Double {
               guard let _ = graph[start], let _ = graph[end] else {
                   return -1.0
               }
               var queue = [(start, 1.0)]
               var visited = Set<String>()
               
               while !queue.isEmpty {
                   let (current, product) = queue.removeFirst()
                   if current == end {
                       return product
                   }
                   visited.insert(current)
                   
                   for (neighbor, value) in graph[current]! {
                       if !visited.contains(neighbor) {
                           queue.append((neighbor, product * value))
                       }
                   }
               }
               return -1.0
           }
           
           return results
       }
    // dfs를 활용한 풀이
    func calcEquation2(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
        //1. 그래프를 만든다.
        var graph: [String: [String: Double]] = [:]
        
        for i in 0..<equations.count {
            //정방향
            let source = equations[i][0]
            let target = equations[i][1]
            let value = values[i]
            
            if graph[source] == nil {
                graph[source] = [String:Double]()
            }
            if graph[target] == nil {
                graph[target] = [String:Double]()
            }
            
            graph[source]![target] =  value
            graph[target]![source] =  1.0 / value
        }
        
        var result: [Double] = []
        var visited: [String: Bool] = [:]
        //2. 탐색을 시작한다 -> dfs로
        func dfs(currentPath: String, target: String, additive: Double) -> Double {
            
            if currentPath == target {
                return additive
            }
            // source에 해당하는 target들을 dfs한다.
            for item in graph[currentPath]! {
                let path = item.key
                let value = item.value

                if !visited[path, default: false] {
                    visited[path] = true
                    var pathValue = dfs(currentPath: path, target: target, additive: additive * value)
                    
                    if pathValue != -1 {
                        return pathValue
                    }
                }
            }
            
            return -1
        }
        
        for query in queries {
            let source = query[0]
            let target = query[1]
            
            if graph[source] == nil {
                result.append(-1)
            } else {
                visited = [:]
                visited[source] = true
                result.append(dfs(currentPath: source, target: target, additive: 1))
            }
        }
        
        return result
    }
}
