//
//  Easy_58.swift
//  BakJoon
//
//  Created by 김성준 on 1/23/25.
//

import Foundation

class Easy_58 {
    func lengthOfLastWord(_ s: String) -> Int {
        let words = s.split(separator: " ")

        return words.last?.count ?? 0
    }
}
