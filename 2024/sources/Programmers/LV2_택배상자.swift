//
//  LV2_택배상자.swift
//  BakJoon
//
//  Created by 김성준 on 4/27/24.
//

import Foundation

class LV2_택배상자 {
    func solution(_ order: [Int]) -> Int {
        let n = order.count
        var stack: [Int] = [] // 보조 컨테이너 벨트 역할을 하는 스택
        var loadedCount = 0 // 트럭에 실린 상자의 수
        var currentBox = 1 // 컨테이너 벨트에서 다음으로 나올 상자 번호

        for desiredBox in order {
            while currentBox < desiredBox {
                stack.append(currentBox)
                currentBox += 1
            }

            if currentBox == desiredBox {
                loadedCount += 1
                currentBox += 1
            } else if !stack.isEmpty && stack.last == desiredBox {
                stack.removeLast()
                loadedCount += 1
            } else {
                break // 스택의 top 또는 컨테이너 벨트에 원하는 상자가 없으면 중단
            }
        }

        return loadedCount
    }
}
