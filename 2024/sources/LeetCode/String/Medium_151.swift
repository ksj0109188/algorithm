//
//  Medium_151.swift
//  BakJoon
//
//  Created by 김성준 on 2/18/25.
//

import Foundation

class Medium_151 {
    func reverseWords(_ s: String) -> String {
        let words = s.split(separator: " ")
        var reverseWords:[String] = []

        for i in stride(from: words.count - 1, through: 0, by: -1) {
            reverseWords.append(String(words[i]))
        }

        return reverseWords.joined(separator: " ")
    }
}
