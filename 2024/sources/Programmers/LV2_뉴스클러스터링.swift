//
//  LV2_뉴스클러스터링.swift
//  BakJoon
//
//  Created by 김성준 on 7/9/24.
//

import Foundation

class LV2_뉴스클러스터링 {
    func createMultiSet(_ str: String) -> [String] {
        var multiset = [String]()
        let upperStr = str.lowercased()
        let characters = Array(upperStr)
        
        for i in 0..<(characters.count - 1) {
            let first = characters[i]
            let second = characters[i + 1]
            
            if first.isLetter && second.isLetter {
                let pair = "\(first)\(second)"
                multiset.append(pair)
            }
        }
        
        return multiset
    }

    func calculateJaccardIndex(_ set1: [String], _ set2: [String]) -> Int {
        var dict1 = [String: Int]()
        var dict2 = [String: Int]()
        
        // set1의 다중집합 구성
        for element in set1 {
            dict1[element, default: 0] += 1
        }
        
        // set2의 다중집합 구성
        for element in set2 {
            dict2[element, default: 0] += 1
        }
        
        var intersectionCount = 0
        var unionCount = 0
        
        // 교집합 계산
        for (key, count) in dict1 {
            if let countInSet2 = dict2[key] {
                intersectionCount += min(count, countInSet2)
            }
        }
        
        // 합집합 계산
        for key in Set(dict1.keys).union(Set(dict2.keys)) {
            let countInSet1 = dict1[key] ?? 0
            let countInSet2 = dict2[key] ?? 0
            unionCount += max(countInSet1, countInSet2)
        }
        
        if unionCount == 0 {
            return 65536 // 두 집합이 모두 공집합인 경우
        }
        
        let jaccardIndex = Double(intersectionCount) / Double(unionCount)
        return Int(jaccardIndex * 65536)
    }

    func solution(_ str1: String, _ str2: String) -> Int {
        let multiSet1 = createMultiSet(str1)
        let multiSet2 = createMultiSet(str2)
        
        return calculateJaccardIndex(multiSet1, multiSet2)
    }
}
