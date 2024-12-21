//
//  KMP.swift
//  BakJoon
//
//  Created by 김성준 on 10/18/24.
//

import Foundation

class KMP {
    func makeLPS(substring: String) -> [Int] {
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
    
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let lps = makeLPS(substring: needle)
        let haystackArr = Array(haystack)
        let needleArr = Array(needle)
        
        var i = 0 // haystack pointer
        var j = 0 // needle pointer
        
        while i < haystackArr.count {
            if haystackArr[i] == needleArr[j] {
                i += 1
                j += 1
            } else {
                if j == 0 {
                    i += 1
                } else {
                    j = lps[j - 1]
                }
            }
            
            if j == needleArr.count {
                return i - needleArr.count
            }
        }
        
        return -1
    }
}
