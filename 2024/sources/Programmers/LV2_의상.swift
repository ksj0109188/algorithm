//
//  LV2_의상.swift
//  BakJoon
//
//  Created by 김성준 on 4/15/24.
//

import Foundation

class LV2_의상 {
    func solution(_ clothes:[[String]]) -> Int {
        var result = clothes.count
        var catergories: [String:[String]] = [:]
        
        for cloth in clothes {
            catergories[cloth[1], default: []].append(cloth[0])
        }
        
        var additive = 1
        
        if catergories.count > 1 {
            for key in catergories.keys {
                additive *= catergories[key]!.count
            }
            
            result += additive
        }

        return result
    }
}
// Solution
//func solution(_ clothes:[[String]]) -> Int {
//    var catergories: [String:Int] = [:]
//    
//    for cloth in clothes {
//        catergories[cloth[1], default: 0] += 1
//    }
//    
//    var combinations = 1
//    for count in catergories.values {
//        combinations *= (count + 1)
//    }
//    
//    return combinations - 1
//}
