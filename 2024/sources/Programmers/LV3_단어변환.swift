//
//  LV3_단어변환.swift
//  BakJoon
//
//  Created by 김성준 on 4/2/24.
//

import Foundation

class LV3_단어변환 {
    func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
        guard words.contains(target) else {
            return 0
        }
        
        var result = 0
        var queue = [(begin,0)]
        var visited : [String:Bool] = [:]
        
        while !queue.isEmpty {
            let (currentWord, step) = queue.removeFirst()
            
            if currentWord == target {
                result = step
            }
            
            for word in words where !visited[word, default: false] {
                var count = 0
                let differentLettersCount = zip(currentWord, word).filter { $0 != $1 }.count
                        
                if differentLettersCount == 1 {
                    queue.append((word, step+1))
                    visited[word] = true
                    
                }
            }
        }
        
        return result
    }
}
