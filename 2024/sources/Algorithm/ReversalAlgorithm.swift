//
//  ReversalAlgorithm.swift
//  BakJoon
//
//  Created by 김성준 on 12/26/24.
//

import Foundation

final class ReversalAlgorithm {
    class Solution {
        func rotate(_ nums: inout [Int], _ k: Int) {
            let stepCount = k % nums.count
            
            func reversal(start: Int, end: Int) {
                var start = start
                var end = end
                
                while start < end {
                    nums.swapAt(start, end)
                    start += 1
                    end -= 1
                }
            }
            
            //MARK: Step1 배열을 뒤집음
            reversal(start: 0, end: nums.count - 1)
            
            //MARK: Step2 뒤집은 배열을 기준으로 앞에서 K만큼 옮기면 첫번째 부터 다시 시작하는 요소돌을 정렬하는 메커니즘이 완성됨
            reversal(start: 0, end: stepCount - 1)
            
            //MARK: Step3 나머지를 원래대로 되돌림
            reversal(start: stepCount, end: nums.count - 1)
        }
    }

}
