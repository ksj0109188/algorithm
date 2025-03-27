//
//  1966.swift
//  BakJoon
//
//  Created by 김성준 on 3/27/25.
//

import Foundation

class 프린터큐_1966 {
    func exec() {
        let t = Int(readLine()!)!
        
        for _ in 0..<t {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let (n, m) = (input[0], input[1])
            var result = 0
            let priorities = readLine()!.split(separator: " ").map{ Int($0)! }
            var queue = Array(zip(0..<n, priorities))
            
            while !queue.isEmpty {
                var maxPriority = queue.max(by: {$0.1 < $1.1})!
                var copyQueue = queue
                var removeCount = 0
                
                for (index,document) in copyQueue.enumerated() {
                    let target = document.0
                    let prioirty = document.1
                    
                    if prioirty == maxPriority.1 { break }
                    else { removeCount += 1 }
                }
                
                for _ in 0..<removeCount {
                    let document = queue.removeFirst()
                    queue.append(document)
                }
                
                let document = queue.removeFirst()
                result += 1
                
                if document.0 == m {
                    print(result)
                    break
                }
            }
            
        }
    }
}
