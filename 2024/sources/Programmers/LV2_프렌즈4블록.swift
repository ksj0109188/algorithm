//
//  LV2_프렌즈4블록.swift
//  BakJoon
//
//  Created by 김성준 on 10/2/24.
//

import Foundation

struct LV2_프렌즈4블록 {
    func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
        var isWork = true
        var paths = [(1, 0), (-1, 0), (0, -1), (0, 1)]
        var arr: [String] = .init(repeating: "", count: board.count)
        
        for i in 0..<board.count {
            let swpeIndex = (board.count - 1) - i
            arr[i] = board[swpeIndex]
        }
        
        while isWork {
            for i in 0..<m {
                for j in 0..<n {
                    var isComputeCount = 0
                    
                    for path in paths {
                        let nx =  i + path.0
                        let ny = j + path.1
                        
                        if (ny >= 0 && ny < arr[i].count ) {
                            
                        }
                    }
                }
            }
        }
        
        
        return 0
    }
}
