//
//  13_Roman To Integer.swift
//  BakJoon
//
//  Created by 김성준 on 2/1/24.
//

import Foundation

func romanToInt(_ s: String) -> Int {
    let romanNumerals: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]
    var total = 0
    var previousValue = 0
      
    for symbol in s {
        if let value = romanNumerals[symbol] {
            total += value
            if previousValue < value {
                total -= 2 * previousValue
            }
            previousValue = value
        }
    }
    
    return total
}
