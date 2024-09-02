//
//  Programmers_LV2_KaKAo2023_Icon.swift
//  BakJoon
//
//  Created by 김성준 on 3/20/24.
//

import Foundation

class solution_Programmers2_icon {
    var users:[[Int]] = []
    var emoticons: [Int] = []
    let discounts = [10, 20, 30, 40] // 사용할 수 있는 할인율 목록
    var result = (0, 0) // 결과를 저장할 튜플: (가입자 수, 매출액)
    
    func solution(_ users: [[Int]], _ emoticons: [Int]) -> [Int] {
        self.users = users
        self.emoticons = emoticons
        
        // DFS 함수 정의: 현재 인덱스와 할인율을 적용한 상태를 매개변수로 받습니다.
        dfs(0, []) // DFS 탐색 시작
        return [result.0, result.1] // 최종 결과 반환
    }
    
    func dfs(_ index: Int, _ discountRates: [Int]) {
        // 모든 이모티콘에 대해 할인율을 적용했다면, 사용자별로 구매 여부와 서비스 가입 여부를 판단합니다.
        if index == emoticons.count {
            var subscribers = 0 // 가입자 수
            var sales = 0 // 매출액
            
            // 각 사용자별로 검사
            for user in users {
                let thresholdDiscount = user[0] // 사용자가 요구하는 최소 할인율
                let thresholdPrice = user[1] // 이 금액을 초과하면 서비스 가입
                var userSpent = 0 // 사용자가 지출할 금액
                
                // 각 이모티콘에 대해 할인율이 사용자의 요구를 충족하는지 확인하고, 충족한다면 구매 가격을 userSpent에 추가
                for (idx, originalPrice) in emoticons.enumerated() {
                    let priceAfterDiscount = originalPrice * (100 - discountRates[idx]) / 100
                    if discountRates[idx] >= thresholdDiscount {
                        userSpent += priceAfterDiscount
                    }
                }
                
                // 사용자가 지출한 금액에 따라 서비스 가입 여부를 결정
                if userSpent >= thresholdPrice {
                    subscribers += 1
                } else {
                    sales += userSpent
                }
            }
            
            // 최적의 결과(최대 가입자 수와 최대 매출액)를 갱신
            if subscribers > result.0 || (subscribers == result.0 && sales > result.1) {
                result = (subscribers, sales)
            }
            return
        }
        
        // 다음 이모티콘에 대해 모든 가능한 할인율을 적용해 보면서 DFS를 계속 진행
        for discount in discounts {
            dfs(index + 1, discountRates + [discount])
        }
    }
}
