//
//  LV2_소수찾기.swift
//  BakJoon
//
//  Created by 김성준 on 4/16/24.
//

import Foundation

class LV2_소수찾기 {
    func solution(_ numbers:String) -> Int {
        var combinations = Set<Int>()
        let digits = Array(numbers)
        
        //모든 숫자 조합 생성
        combine("", digits, &combinations)
        let maxNumber = combinations.max() ?? 0
        
        //소수 리스트 생성
        var isPrime = [Bool](repeating: true, count: maxNumber+1)
        setPrimes(maxNumber, &isPrime)
        
        var count = 0
        for num in combinations {
            if num >= 2 && isPrime[num] {
                count += 1
            }
        }
        
        return count
    }
    
    func setPrimes(_ size: Int, _ isPrime : inout [Bool]) {
        if size >= 2 {
            isPrime[0] = false
            isPrime[1] = false
            
            for i in 2..<Int(sqrt(Double(size))) {
                if isPrime[i] {
                    for j in stride(from: i * i, through: size, by: i) {
                        isPrime[j] = false
                    }
                }
            }
        }
    }
    // time complex : n!
    // 첫번째 조합수는 n
    // 두번째 조합수는 n-1
    // 세번째 조합수는 n-2 ..
    func combine(_ current: String, _ remaining: [Character], _ combinations: inout Set<Int>) {
        if !current.isEmpty {
            combinations.insert(Int(current)!)
        }
       
        for i in 0..<remaining.count {
            var newRemaining = remaining
            newRemaining.remove(at: i)
            combine(current + String(remaining[i]), newRemaining, &combinations)
        }
    }
    

}
