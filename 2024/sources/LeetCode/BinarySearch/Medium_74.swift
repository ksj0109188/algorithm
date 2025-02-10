//
//  Medium_74.swift
//  BakJoon
//
//  Created by 김성준 on 2/7/25.
//

import Foundation

class Medium_74 {
    //MARK: [[1]] target: 1 일때 out of range index 발생
    func searchMatrix1(_ matrix: [[Int]], _ target: Int) -> Bool {
          var targetRows = matrix.map{ $0.last } // 7 , 20, 60

          var left = 0
          var right = targetRows.count
          
          while left <= right {
              let mid = (left + right) / 2
              
              if targetRows[mid]! <= target {
                  left = mid + 1
              } else {
                  right = mid - 1
              }
          }
          
          
          let rowIndex = left
          left = 0
          right = matrix[rowIndex].count
          
          while left <= right {
              let mid = (left + right) / 2

              if matrix[rowIndex][mid] == target {
                  return true
              }

              if matrix[rowIndex][mid] < target {
                  left = mid + 1
              } else {
                  right = mid - 1
              }
          }
          
          return false
      }
    
    func searchMatrix2(_ matrix: [[Int]], _ target: Int) -> Bool {
        let m = matrix.count
        let n = matrix[0].count
        var left = 0
        var right = m - 1
        
        while left <= right {
            let mid = (left + right) / 2
            
            if matrix[mid][0] <= target && target <= matrix[mid][n - 1] {
                left = mid
                break
            } else if matrix[mid][0] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        if right < 0 || left >= m {
            return false
        }
        
        let rowIndex = left
        left = 0
        right = n - 1
        
        while left <= right {
            let mid = (left + right) / 2
            
            if matrix[rowIndex][mid] == target {
                return true
            } else if matrix[rowIndex][mid] < target {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return false
    }
}
