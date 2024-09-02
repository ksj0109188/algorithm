//
//  LV2_캐시.swift
//  BakJoon
//
//  Created by 김성준 on 7/6/24.
//

import Foundation

class LV2_캐시 {
    func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
        var cache = [String]()
        var result = 0
        
        if cacheSize == 0 {
            return cities.count * 5
        }
        
        for city in cities {
            let city = city.lowercased()
            
            if cache.contains(where: { $0 == city }) {
                let index = cache.firstIndex {$0 == city}!
                cache.remove(at: index)
                cache.append(city)
                result += 1
            } else {
                if cache.count == cacheSize {
                    cache.removeFirst()
                }
                cache.append(city)
                result += 5
            }
        }
        
        return result
    }
}
