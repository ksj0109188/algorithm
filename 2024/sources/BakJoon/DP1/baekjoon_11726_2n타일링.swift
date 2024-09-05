//
//  baekjoon_11726_2n타일링.swift
//  BakJoon
//
//  Created by 김성준 on 9/4/24.
//

import Foundation

///url: https://www.acmicpc.net/problem/11726
class baekjoon_11726_2n타일링 {
    func solution() {
        let n = Int(readLine()!)!
        
        var dp = [0]
        dp.append(1)
        dp.append(2)
        
        if n < 3 {
            print(dp[n] % 10007)
            return
        }
        
        for i in 3...n {
            dp.append((dp[i-1] + dp[i-2]) % 10007)
        }
        
        print(dp[n])
    }
}
