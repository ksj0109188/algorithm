//
//  1629.swift
//  BakJoon
//
//  Created by 김성준 on 10/25/24.
//

import Foundation

class 곱셈1629 {
    func modularExponentiation(_ A: Int, _ B: Int, _ C: Int) -> Int {
        if B == 0 {
            return 1
        }
        
        let half = modularExponentiation(A, B / 2, C)
        
        if B % 2 == 0 {
            return  ( half * half ) % C
        } else {
            return (half * half * A) % C
        }
    }

    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let A = input[0]
        let B = input[1]
        let C = input[2]
        
        print(modularExponentiation(A, B, C))
    }
}
