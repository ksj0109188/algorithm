//
//  LV2_요격시스템.swift
//  BakJoon
//
//  Created by 김성준 on 4/12/24.
//

import Foundation

class LV2_요격시스템 {
    func solution(_ targets:[[Int]]) -> Int {
        let sortedTargets = targets.sorted { $0[1] < $1[1] }
        var lastIntercept = sortedTargets[0][1] // 첫 번째 요격 미사일의 위치를 첫 번째 폭격 미사일의 종료 지점으로 설정
        var result = 1 // 첫 번째 요격 미사일로 시작
        
        for i in 1..<sortedTargets.count {
            let currentTarget = sortedTargets[i]
            let start = currentTarget[0]
            
            // 현재 폭격 미사일의 시작점이 마지막으로 발사된 요격 미사일 위치보다 큰 경우, 새로운 요격 미사일 발사 필요
            if start >= lastIntercept {
                lastIntercept = currentTarget[1] // 새로운 요격 미사일의 위치를 현재 폭격 미사일의 종료 지점으로 업데이트
                result += 1
            }
        }
        return result
    }
}
