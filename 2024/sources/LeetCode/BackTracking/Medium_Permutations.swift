//
//  Medium_permutations.swift
//  BakJoon
//
//  Created by 김성준 on 5/11/24.
//

import Foundation

class Medium_permutations {
    // time: O(n*n!) / sapce: o(n)
//    func permute(_ nums: [Int]) -> [[Int]]{
//        var result: [[Int]] = []
//        
//        var letters: [Int] = []
//        func dfs(_ index: Int, _ letters: inout [Int]) {
//            if index == nums.count {
//                result.append(letters)
//            }
//            
//            for num in nums {
//                if letters.contains(num) { continue }
//                
//                letters.append(num)
//                dfs(index+1, &letters)
//                letters.removeLast()
//            }
//        }
//        
//        dfs(0, &letters)
//        
//        return result
//    }
    
    // time: O(n!) / sapce: o(n)
    func permute(_ nums: [Int]) -> [[Int]] {
          var result: [[Int]] = []
          var nums = nums  // 이렇게 하면 배열을 수정할 수 있습니다.

          func backtrack(_ first: Int) {
              if first == nums.count {
                  result.append(nums)
                  return
              }

              for i in first..<nums.count {
                  nums.swapAt(first, i)
                  backtrack(first + 1)
                  nums.swapAt(first, i) //배열을 원 상태로 복구
              }
          }

          backtrack(0)
          return result
      }
}
