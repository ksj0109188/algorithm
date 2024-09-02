//
//  LV2_마법의엘리베이터.swift
//  BakJoon
//
//  Created by 김성준 on 7/27/24.
//

import Foundation

class 마법의엘리베이터 {
//    func solution1(_ storey:Int) -> Int {
//        let digit = String(storey).count
//        let firstNumber = Int(String(String(storey).first!))!
//        
//        let num1 = firstNumber * NSDecimalNumber(decimal: pow(10, digit - 1)).intValue
//        let num2 = (firstNumber + 1) * NSDecimalNumber(decimal: pow(10, digit - 1)).intValue
//        
//        let soneList1 = Array(String(abs(storey - num1)))
//        let soneList2 = Array(String(abs(storey - num2)))
//            
//        var result = 0
//        
//        let usedStone1 = soneList1.map{Int(String($0))!}.reduce(into: 0, {$0 += $1}) + firstNumber
//        let usedStone2 = soneList2.map{Int(String($0))!}.reduce(into: 0, {$0 += $1}) + (firstNumber + 1 )
//        
//        result = min(usedStone1, usedStone2)
//        
//        return result
//    }
    
    func solution2(_ storey:Int) -> Int {
        var magicStones = 0
          var currentFloor = storey

          while currentFloor > 0 {
              // 현재 층의 마지막 자릿수 계산
              let lastDigit = currentFloor % 10
              
              // 올림과 내림을 비교하여 최소값 선택
              if lastDigit <= 5 {
                  magicStones += lastDigit
                  currentFloor -= lastDigit
              } else {
                  magicStones += 10 - lastDigit
                  currentFloor += 10 - lastDigit
              }
              
              // 10으로 나누어 다음 자리로 이동
              currentFloor /= 10
          }
          
          return magicStones
    }

}
