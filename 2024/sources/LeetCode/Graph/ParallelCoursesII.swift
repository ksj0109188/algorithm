//
//  ParallelCoursesII.swift
//  BakJoon
//
//  Created by 김성준 on 6/22/24.
//

import Foundation

class ParallelCoursesII {
    func minNumberOfSemesters(_ n: Int, _ relations: [[Int]], _ k: Int) -> Int {
        // 진입 차수가 0인 것들을 시작을 한다.
        // k는 한 학기당 들을 수 있는 과목으로 preCourse를 처리할 수 있는 최대의 수이다.
        // 스택에 다 쌓아두고 그 스택을 2개씩 처리하면 어떻게 될까?
        var indegrees: [Int] = [Int](repeating: 0, count: n + 1)
        var visited: [Bool] = [Bool](repeating: false, count: n + 1)
        var result = 0
        var graph: [Int:[Int]] = [:]
        var orders: [(coruse: Int, semester: Int)] = []
        var queue: [Int] = []
        indegrees[0] = -1
        visited[0] = true
        
        for relation in relations {
            let preCourse = relation[0]
            let nextCourse = relation[1]
            
            indegrees[nextCourse] += 1
            graph[preCourse, default: []] += [nextCourse]
        }
        
        for (index,indegree) in indegrees.enumerated() {
            if indegree == 0 {
                queue.append(index)
            }
        }
        
        print(graph)
        print(indegrees)
        print(queue)
        
        // 큐에 있는 갯수를 최대 k 번 방문처리
        while !queue.isEmpty {
            var nextQueue: [Int] = []
            for i in 0..<k {
                guard !queue.isEmpty else { continue }
                let course = queue.removeFirst()
                
                if graph[course] == nil {
                    continue
                }
                
                for nextCourse in graph[course]! {
                    indegrees[nextCourse] -= 1
                    if indegrees[nextCourse] <= 0 {
                        nextQueue.append(nextCourse)
                    }
                }
            }
            queue += nextQueue
            result += 1
        }
        
        return result
    }
}


