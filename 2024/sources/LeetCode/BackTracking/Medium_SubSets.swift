//
//  Medium_SubSets.swift
//  BakJoon
//
//  Created by 김성준 on 5/10/24.
//

import Foundation

//TODO: 문자열 스트링을 값으로 넘기는 거랑 레퍼런스로 넘기는 거랑 성능 차이
class Medium_Subsets{
    
    func subsets(_ nums: [Int]) -> [[Int]]{
        var result: [[Int]] = []
        // paramters: call by value
//        func dfs(_ index: Int, _ letters: [Int]){
//            if index == nums.count {
//                result.append(letters)
//                return
//            }
//            
//            let num = nums[index]
//            
//            dfs(index + 1, letters + [num])
//            dfs(index + 1, letters)
//        }
        
        var letters: [Int] = []
        func dfs(_ index: Int, _ letters:  inout [Int]){
            if index == nums.count {
                result.append(letters)
                return
            }
            
            let num = nums[index]
            letters += [num]
            dfs(index + 1, &letters)
            letters.removeLast()
            dfs(index + 1, &letters)
        }
        
        dfs(0, &letters)
        
        return result
    }
}
