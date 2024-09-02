//
//  LV2_프로세스.swift
//  BakJoon
//
//  Created by 김성준 on 4/24/24.
//

import Foundation

class LV2_프로세스 {
    func solution(_ priorities:[Int], _ location:Int) -> Int {
        var queue = Array(zip(priorities, [Bool](repeating: false, count: priorities.count)))
        queue[location].1 = true
        
        var result = [(Int, Bool)]()
        
        while !queue.isEmpty {
            let process = queue.removeFirst()
            
            if queue.contains(where: { $0.0 > process.0}) {
                queue.append(process)
            } else {
                result.append(process)
                
                if process.1 == true {
                    break
                }
                
            }
        }
        
        return (result.firstIndex { $0.1 == true } ?? -1) + 1
    }
}
