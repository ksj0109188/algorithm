//
//  Easy_14.swift
//  BakJoon
//
//  Created by 김성준 on 1/23/25.
//

import Foundation

class Easy_14 {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        
        var prefix = strs[0]
        
        for str in strs {
            while !str.hasPrefix(prefix) {
                prefix.removeLast()
                
                if prefix.isEmpty {
                    return ""
                }
            }
        }
        
        return prefix
    }
}
