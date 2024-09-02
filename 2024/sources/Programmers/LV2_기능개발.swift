//
//  LV2_기능개발.swift
//  BakJoon
//
//  Created by 김성준 on 4/22/24.
//

import Foundation

// 프로그래머스 스택/큐 문제
class LV2_기능개발 {
    func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
        var queue = Array(zip(progresses, speeds))
        var dayCount = 0
        var result: [Int:Int] = [:]
        
        while !queue.isEmpty {
            let (progress, speed) = queue.removeFirst()
            var curProgress = progress + speed * dayCount
            
            while curProgress < 100 {
                dayCount += 1
                curProgress = progress + speed * dayCount
            }
            
            result[dayCount, default: 0] += 1
        }
        
        return result.sorted(by: {$0.key < $1.key}).map{$0.value}
    }
}
