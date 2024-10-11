//
//  N과M(2).swift
//  BakJoon
//
//  Created by 김성준 on 10/11/24.
//

import Foundation

class N과M_2 {
    func solution() {
         let input = readLine()!.split(separator: " ").map { Int($0)! }
         let n = input[0]
         let m = input[1]
         var result: [Int] = []
         
         func backtrack(_ start: Int) {
             if result.count == m {
                 print(result.map { String($0) }.joined(separator: " "))
                 return
             }
             
             if start > n {
                 return
             }
             
             for i in start...n {
                 result.append(i)
                 backtrack(i + 1)
                 result.removeLast()
             }
         }
         
         backtrack(1)
     }
}
