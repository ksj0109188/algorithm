//
//  KMP.swift
//  BakJoon
//
//  Created by 김성준 on 10/18/24.
//

import Foundation

class KMP {
    func makeLPS(substring: String) -> [Int]? {
        guard substring.count > 0 else { return nil }
        let substring = Array(substring)
        var lps: [Int] = .init(repeating: 0, count: substring.count)
        
        var prevLPS = 0
        var i = 1
        
        while i < substring.count {
            if substring[i] == substring[prevLPS] {
                lps[i] = prevLPS + 1
                prevLPS += 1
                i += 1
            } else if prevLPS == 0 {
                lps[i] = 0
                i += 1
            } else {
                prevLPS = lps[prevLPS - 1]
            }
        }
        
        return lps
    }
}
