//
//  LV4_자동완성.swift
//  BakJoon
//
//  Created by 김성준 on 8/7/24.
//

import Foundation

class 자동완성 {
    class TrieNode {
        var children: [Character: TrieNode] = [:]
        var count = 0
    }

    func solution(_ words: [String]) -> Int {
        let root = TrieNode()
        
        // 트라이 구축
        for word in words {
            var node = root
            for char in word {
                if node.children[char] == nil {
                    node.children[char] = TrieNode()
                }
                node = node.children[char]!
                node.count += 1
            }
        }
        
        var result = 0
        
        // 필요한 문자 수 계산
        for word in words {
            var node = root
            for (index, char) in word.enumerated() {
                node = node.children[char]!
                result += 1
                if node.count == 1 {
                    break
                }
            }
        }
        
        return result
    }
}
