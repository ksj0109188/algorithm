//
//  Graph.swift
//  BakJoon
//
//  Created by 김성준 on 1/31/24.
//

import Foundation

enum VisitState: Int {
    case ready
    case visiting
    case complete
    
}

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var graph: [Int : [Int]] = [:]
    var visited = Array(repeating: VisitState.ready, count: numCourses)
    
    for item in prerequisites {
//        if var edge = edges[item[0]] {
//            if !edge.contains(where: { target in target == item[1]}) {
//                edge.append(item[1])
//            } else {
//                return false
//            }
//        } else {
//            edges[item[0]] = [item[1]]
//        }
        graph[item[0], default: []].append(item[1])
    }
    
    for step in 0..<numCourses {
        if visited[step] == VisitState.ready {
            if isCycle(step: step, visited: &visited, graph: &graph) {
                return false
            }
        }
    }
    
    return true
}

func isCycle(step: Int, visited: inout [VisitState], graph: inout [Int: [Int]]) -> Bool{
    if visited[step] == VisitState.visiting {
        return true
    }
    
    if visited[step] == VisitState.complete {
        return false
    }
    
    visited[step] = VisitState.visiting
    
    if let nextStep = graph[step] {
        for next in nextStep {
            if isCycle(step: next, visited: &visited, graph: &graph) {
                return true
            }
        }
    }
    
    visited[step] = VisitState.complete
    
    return false
}

