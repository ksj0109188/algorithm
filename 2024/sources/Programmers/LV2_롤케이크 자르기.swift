//
//  LV2_롤케이크 자르기.swift
//  BakJoon
//
//  Created by 김성준 on 6/24/24.
//

import Foundation

class Solution_롤케이크자르기 {
    //MARK: Sliding 윈도우 알고리즘으로 풀면 되는 거였음
//    func solution(_ topping:[Int]) -> Int {
//        var result = 0
//        
//        for i in 0..<topping.count {
//            let pivotIndex = i - 1
//            if pivotIndex < 0 {
//                continue
//            }
//            let leftItems = Set(topping[0...pivotIndex])
//            let rightItems = Set(topping[(pivotIndex + 1)...])
//            
//            if leftItems.count == rightItems.count {
//                result += 1
//            }
//        }
//        
//        return result
//    }
    func solution(_ topping: [Int]) -> Int {
        var result = 0
        let n = topping.count

        // 각 토핑의 왼쪽과 오른쪽에 있는 토핑 종류의 수를 저장할 배열
        var leftToppings = [Int: Int]()
        var rightToppings = [Int: Int]()

        // 처음에 모든 토핑을 오른쪽에 넣음
        for t in topping {
            rightToppings[t, default: 0] += 1
        }

        // 각 인덱스에서 왼쪽과 오른쪽의 토핑 종류 수를 비교
        for i in 0..<n - 1 {
            let t = topping[i]
            
            // 현재 토핑을 왼쪽으로 이동
            leftToppings[t, default: 0] += 1
            if rightToppings[t]! == 1 {
                rightToppings[t] = nil
            } else {
                rightToppings[t]! -= 1
            }
            
            // 왼쪽과 오른쪽의 토핑 종류 수가 같은지 확인
            if leftToppings.keys.count == rightToppings.keys.count {
                result += 1
            }
        }

        return result
    }
}
