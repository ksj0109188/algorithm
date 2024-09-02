//
//  Lv2_Carfat.swift
//  BakJoon
//
//  Created by 김성준 on 3/25/24.
//

import Foundation

func solutionLV2_Carpet(_ brown:Int, _ yellow:Int) -> [Int] {
    let totalCount = brown + yellow
    var result = [Int]()
    for i in 1...totalCount {
        if totalCount % i == 0 {
            if i >= totalCount / i {
                result.append(i)
                result.append(totalCount / i)
                break
            }
        }
    }
    
    return result
}
