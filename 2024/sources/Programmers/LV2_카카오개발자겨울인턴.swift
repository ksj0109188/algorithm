//
//  LV2_카카오개발자겨울인턴.swift
//  BakJoon
//
//  Created by 김성준 on 7/8/24.
//

import Foundation

class LV2_카카오개발자겨울인턴 {
    func solution(_ s:String) -> [Int] {
        var s = s
        var answer = [Int]()
        s.removeFirst(2)
        s.removeLast(2)
        
        s.components(separatedBy: "},{")
            .map{$0.split(separator: ",").map{Int($0)!}}
            .sorted(by: {$0.count < $1.count})
            .forEach {
                $0.forEach {
                    if !answer.contains($0) {
                        answer.append($0)
                    }
                }
            }
        
            
        
        return answer
    }
}
