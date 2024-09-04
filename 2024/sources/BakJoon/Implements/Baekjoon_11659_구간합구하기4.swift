//
//  Baekjoon_11659_구간합구하기4.swift
//  BakJoon
//
//  Created by 김성준 on 9/4/24.
//

import Foundation


///notes: 1부터 nums의 크기만큼 dp를 활용해 누적결과 값을 저장
///1부터 누적된 결과값이 dp에 저장되어 있으니, 범위의 끝에는 1부터 범위까지 값이 저장되어 있으 ex) start: 2 / end 5일때 nums가 [5, 4, 3, 2, 1]이라면 end는 15
///이 때 start가 3이라면, 5부터 4까지 누적합인 9를  end값이 15에서 빼버리면 특정 구간의 합을 도출할 수 있음
class Baekjoon_11659_구간합구하기4 {
    func main() {
        let input = readLine()!.split(separator: " ")
        let nums = readLine()!.split(separator: " ").map{Int($0)!}
        let m = Int(input[1])!
        
        var dp = [0]
        for i in 0..<nums.count {
            dp.append(dp[i] + nums[i])
        }
        
        for i in 0..<m {
            let rangeInput = readLine()!.split(separator: " ")
            let start = Int(rangeInput[0])!
            let end = Int(rangeInput[1])!
            
            print(dp[end] - dp[start - 1])
        }
    }
}
