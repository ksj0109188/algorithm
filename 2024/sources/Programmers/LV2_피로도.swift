//
//  LV2_피로도.swift
//  BakJoon
//
//  Created by 김성준 on 4/19/24.
//

import Foundation

class LV2_피로도 {
    func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
        var result = 0
        
        for i in 0..<dungeons.count {
            var newDungones = dungeons
            newDungones.remove(at: i)
            
            result = max(dfs(dungeons[i], newDungones, k, 0), result)
        }
        
        return result
    }
    
    func dfs(_ current: [Int], _ remainDungeons: [[Int]], _ k: Int , _ count: Int) -> Int {
        var k = k
        var count = count
        
        if k <= 0 || remainDungeons.isEmpty {
            return count
        }
        
        if k >= current[0] {
            k -= current[1]
            count += 1
        }
        
        for i in 0..<remainDungeons.count {
            var newDungones = remainDungeons
            newDungones.remove(at: i)
            
            count = max(dfs(remainDungeons[i], newDungones, k, count), count)
        }
        
        return count
    }
    
}

//solution
//func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
//    var result = 0
//    
//    for i in 0..<dungeons.count {
//        var newDungeons = dungeons
//        newDungeons.remove(at: i)
//        result = max(dfs(dungeons[i], newDungeons, k, 0), result)
//    }
//    
//    return result
//}
//
//func dfs(_ current: [Int], _ remainDungeons: [[Int]], _ k: Int , _ count: Int) -> Int {
//    if k < current[0] {  // 최소 필요 피로도를 충족하지 못하면 현재까지 카운트 반환
//        return count
//    }
//
//    let newK = k - current[1]  // 던전 탐험 후 남은 피로도
//    let newCount = count + 1   // 던전 탐험 횟수 증가
//    var maxCount = newCount    // 최대 탐험 횟수를 현재 탐험 횟수로 초기화
//
//    for i in 0..<remainDungeons.count {
//        var newDungeons = remainDungeons
//        newDungeons.remove(at: i)
//        maxCount = max(dfs(remainDungeons[i], newDungeons, newK, newCount), maxCount)
//    }
//
//    return maxCount
//}
