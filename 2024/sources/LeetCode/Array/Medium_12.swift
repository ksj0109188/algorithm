//
//  Medium_12.swift
//  BakJoon
//
//  Created by 김성준 on 1/23/25.
//

import Foundation

class Medium_12 {
func intToRoman(_ num: Int) -> String {
    // Roman numeral symbols and their corresponding values
    let romanSymbols = [
        (value: 1000, symbol: "M"),
        (value: 900, symbol: "CM"),
        (value: 500, symbol: "D"),
        (value: 400, symbol: "CD"),
        (value: 100, symbol: "C"),
        (value: 90, symbol: "XC"),
        (value: 50, symbol: "L"),
        (value: 40, symbol: "XL"),
        (value: 10, symbol: "X"),
        (value: 9, symbol: "IX"),
        (value: 5, symbol: "V"),
        (value: 4, symbol: "IV"),
        (value: 1, symbol: "I")
    ]
    
    var result = ""
    var number = num
    result.split
    // Iterate through the Roman numeral values
    for roman in romanSymbols {
        while number >= roman.value {
            result += roman.symbol
            number -= roman.value
        }
    }
    
    return result
}
}
