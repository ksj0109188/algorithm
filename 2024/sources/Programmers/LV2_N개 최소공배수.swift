//
//  LV2_N개 최소공배수.swift
//  BakJoon
//
//  Created by 김성준 on 3/27/24.
//

import Foundation

class LV2_N개최소공배수 {
    func gcd(_ a: Int, _ b: Int) -> Int{
        return b == 0 ? a : gcd(b, a % b)
    }

    func lcm(_ a: Int, _ b: Int) -> Int {
        return a * b / gcd(a,b)
    }

    func solution(_ arr: [Int]) -> Int {
        return arr.reduce(1) {
            print("$0",$0)
            print("$1",$1)
            print(lcm($0, $1))
            return lcm($0, $1)
        }
    }
}
