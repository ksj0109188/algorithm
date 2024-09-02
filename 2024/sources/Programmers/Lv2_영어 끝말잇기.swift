//
//  Lv2_영어 끝말잇기.swift
//  BakJoon
//
//  Created by 김성준 on 3/27/24.
//

import Foundation

class Lv2_영어끝말잇기 {
    
//    func solution(_ n:Int, _ words:[String]) -> [Int] {
//        var usedWords: [String] = []
//        var person = 0
//        var record : [Int:Int] = [:]
//        var result = -1
//        
//        for (index, word) in words.enumerated() {
//            guard result == -1 else {
//                break
//            }
//            
//            //  마지막 문자로 시작하는 단어가 맞는지
//            if index - 1 >= 0 {
//                if word.first != words[index - 1].last {
//                    result = person
//                }
//            }
//            
//            //  이미 이전에 언급된 단어인지
//            if usedWords.contains(where: {$0 == word}) {
//                result = person
//            }
//            
//            usedWords.append(word)
//            record[person, default: 0] += 1
//            
//            if person + 1 > n - 1 {
//                person = 0
//            } else {
//                person += 1
//            }
//        }
//        
//        return [result + 1, record[result] ?? 0]
//    }
    // Refacotring
    func solution(_ n:Int, _ words:[String]) -> [Int] {
        var usedWords: Set<String> = []
        var currentPlayer = 0

        for (index, word) in words.enumerated() {
            if index > 0 && word.first != words[index-1].last || usedWords.contains(where: {$0 == word}) {
                let turn = index / n + 1
                return [currentPlayer+1 , turn]
            }
            usedWords.insert(word) // 사용된 단어 등록
            currentPlayer = (currentPlayer + 1) % n // 다음 플레이어로 이동
        }
        
        return [0, 0]
    }
    
   
}
//        0 1 0
//        1 1 1
//        0 2 2
//        1 2 3
//        0 3 4
//        1 3 5
