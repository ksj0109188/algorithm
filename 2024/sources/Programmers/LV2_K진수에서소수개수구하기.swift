//
//  LV2_K진수에서소수개수구하기.swift
//  BakJoon
//
//  Created by 김성준 on 8/20/24.
//

import Foundation

class LV2_K진수에서소수개수구하기 {
    func generatePrimes(_ n: Int) -> [Bool] {
         let MAX_SIEVE = 1_000_000  // 에라토스테네스의 체 최대 크기
        let size = min(n, MAX_SIEVE)
        var primes: [Bool] = Array(repeating: true, count: size + 1)
        primes[0] = false
        primes[1] = false
        
        var p = 2
        while p * p <= size {
            if primes[p] {
                for i in stride(from: p * p, through: size, by: p) {
                    primes[i] = false
                }
            }
            p += 1
        }
        
        return primes
    }
    
    func solution(_ n: Int, _ k: Int) -> Int {
         let MAX_SIEVE = 1_000_000  // 에라토스테네스의 체 최대 크기
        let kBaseNumber = String(n, radix: k).split(separator: "0").compactMap { Int($0) }
        let maxNumber = kBaseNumber.max() ?? MAX_SIEVE
        let primes = generatePrimes(maxNumber)
        
        print(kBaseNumber)
        print(String(n, radix: k))
        print("maxNumber \(maxNumber)")
        
        return kBaseNumber.filter { num in
            num > 1 && primes[num]
        }.count
    }
    
//    func isPrime(_ n: Int) -> Bool {
//        if n <= 1 { return false }
//        if n <= 3 { return true }
//        if n % 2 == 0 || n % 3 == 0 { return false }
//        
//        var i = 5
//        while i * i <= n {
//            if n % i == 0 || n % (i + 2) == 0 {
//                return false
//            }
//            i += 6
//        }
//        return true
//    }
//    
//    func solution(_ n: Int, _ k: Int) -> Int {
//        let kBaseNumber = String(n, radix: k).split(separator: "0")
//        return kBaseNumber.filter { num in
//            if let number = Int(num), number > 1 {
//                return isPrime(number)
//            }
//            return false
//        }.count
//    }
}
