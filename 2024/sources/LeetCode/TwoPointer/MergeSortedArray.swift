//
//  mergeSortedArray.swift
//  BakJoon
//
//  Created by 김성준 on 11/4/24.
//

import Foundation

class mergeSortedArray {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        guard n > 0 else { return }
        var singleArr = [Int]()
        var num1Pointer = 0
        var num2Pointer = 0
        
        while singleArr.count < m + n  {
            guard num2Pointer < n else {
                singleArr.append(nums1[num1Pointer])
                num1Pointer += 1
                continue
            }
            
            guard num1Pointer < m else  {
                singleArr.append(nums2[num2Pointer])
                num2Pointer += 1
                continue
            }
            
            if nums1[num1Pointer] < nums2[num2Pointer] {
                singleArr.append(nums1[num1Pointer])
                num1Pointer += 1
            } else {
                singleArr.append(nums2[num2Pointer])
                num2Pointer += 1
            }
        }
        
        nums1 = singleArr
    }
}
