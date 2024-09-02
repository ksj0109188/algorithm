//
//  CourseSchedule2.swift
//  BakJoon
//
//  Created by 김성준 on 6/18/24.
//

import Foundation

class CourseSchedule2 {
    func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
        guard numCourses > 0 && prerequisites.count > 0 else { return Array(0..<numCourses) }
        var indegrees = Array(repeating: 0, count: numCourses)
        var graph: [[Int]] = Array(repeating: [], count: numCourses)
        var result: [Int] = []
        
        for prerequisite in prerequisites {
            let course = prerequisite[0]
            let preCourse = prerequisite[1]
            graph[preCourse].append(course)
            indegrees[course] += 1
        }
        
        print(graph)
        
        var queue = [Int]()
        for i in 0..<numCourses where indegrees[i] == 0 {
            queue.append(i)
        }
        
        while !queue.isEmpty {
            let course = queue.removeFirst()
            result.append(course)
            
            for nextCourse in graph[course] {
                indegrees[nextCourse] -= 1
                if indegrees[nextCourse] == 0 {
                    queue.append(nextCourse)
                }
            }
        }
        
        return result.count == numCourses ? result : []
    }
}
