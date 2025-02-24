//
//  7453.swift
//  BakJoon
//
//  Created by 김성준 on 2/24/25.
//

import Foundation

class 합이0_7453 {
    func exec() {
        let n = Int(readLine()!)!
        var A = [Int](), B = [Int](), C = [Int](), D = [Int]()
        
        for _ in 0..<n {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            A.append(input[0])
            B.append(input[1])
            C.append(input[2])
            D.append(input[3])
        }
        
        var sumAB: [Int: Int] = [:]
        
        for a in A {
            for b in B {
                sumAB[a + b, default: 0] += 1
            }
        }
        
        var result = 0
        
        for c in C {
            for d in D {
                let target = -(c + d)
                if let freq = sumAB[target] {
                    result += freq
                }
            }
        }
        
        print(result)
    }
}
