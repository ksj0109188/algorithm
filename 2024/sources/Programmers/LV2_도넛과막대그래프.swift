//
//  LV2_도넛과막대그래프.swift
//  BakJoon
//
//  Created by 김성준 on 8/23/24.
//

import Foundation
// MARK: 진출, 진입 차수를 추가로 활용하면 쉽게 풀 수 있음.
class LV2_도넛과막대그래프 {
    //1. 도넛과 8자 모양은 사이클이 생기면 정점과 간선의 갯수로 판별한다.
    //2. 임의의 생성 노드는 각 모양의 그래프 시작점들을 연결한 것으로, 자기 자신이 아닌 다른 노드 a != b이며 다른 노드를 가르키는 갯수가 2개 이상 노드가 생성 노드이다. (input 조건 각 모양 그래프의 수의 합은 2이상) -> 이 논리는 틀림. 8자 그래프에도 다른 노드를 가르키는 갯수가 2 이상.
        // 그렇다면 갯수가 2 이상이고, 자기 자신을 가르키는 노드가 없다는 것을 타겟
    //3.  막대모양의 그래프의 경우,
    // 3- 1. 임의의 생성 노드가 아니고 사이클이 아니면서 간선이 가르키는 방향이 없을 떄 막대모형 그래프로 간주한다.
//    func solution(_ edges:[[Int]]) -> [Int] {
//        var graph: [Int: [Int]] = [:]
//        
//        for edge in edges {
//            graph[edge[0], default: []].append(edge[1])
//        }
//        
//        // 생성 노드찾기
//        var startNode = findCreatedNode(graph: graph)
//        
//        func dfs(node: Int, edges: [Int], _ visitedNodeCount: Int, _ vistedEdgeCount: Int) {
//            // 더이상 탐지할 곳이 없다면, 맨 처음 dfs 호출부 node와 같다면,
//            // 노드와 간선의 갯수로 각 도형을 판별한다.
//        }
//        
//        print(startNode.first!.key)
//        
//        
//        return []
//    }
//    
//    func findCreatedNode(graph: [Int:[Int]]) -> [Int: [Int]] {
//        var candidates = graph.filter { node, edges in
//            edges.count >= 2
//        }
//        
//        for (_, edges) in graph {
//            for edge in edges {
//                if candidates[edge] != nil {
//                    candidates[edge] = nil
//                }
//            }
//        }
//        
//        return candidates
//    }
    
    func solution(_ edges: [[Int]]) -> [Int] {
        var graph: [Int: [Int]] = [:]
        var inDegree: [Int: Int] = [:]
        var outDegree: [Int: Int] = [:]
        
        // 그래프 구성 및 차수 계산
        for edge in edges {
            let from = edge[0], to = edge[1]
            graph[from, default: []].append(to)
            outDegree[from, default: 0] += 1
            inDegree[to, default: 0] += 1
        }
        
        // 생성 노드 찾기
        let createdNode = outDegree.filter { $0.value >= 2 && inDegree[$0.key, default: 0] == 0 }.first!.key
        
        // 그래프 유형 카운팅
        var donutCount = 0, barCount = 0, eightCount = 0
        
        for node in graph[createdNode, default: []] {
            let (nodeCount, edgeCount) = dfs(node: node, graph: graph)
            
            if nodeCount == edgeCount {
                donutCount += 1
            } else if nodeCount == edgeCount + 1 {
                barCount += 1
            } else if nodeCount == edgeCount - 1 {
                eightCount += 1
            }
        }
        
        return [createdNode, donutCount, barCount, eightCount]
    }
    
    // 각 도형의 모형 단위로 탐색시엔 dfs
    func dfs(node: Int, graph: [Int: [Int]]) -> (Int, Int) {
        var visited = Set<Int>()
        var stack = [node]
        var nodeCount = 0
        var edgeCount = 0
        
        //각 도형을 그릴 때에는 bfs(8모양의 그래프와 도넛 때문에)
        while !stack.isEmpty {
            let current = stack.removeLast()
            if visited.contains(current) { continue }
            
            visited.insert(current)
            nodeCount += 1
            
            for next in graph[current, default: []] {
                edgeCount += 1
                if !visited.contains(next) {
                    stack.append(next)
                }
            }
        }
        
        return (nodeCount, edgeCount)
    }
}
