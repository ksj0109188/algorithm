//
//  LV2_모음사전.swift
//  BakJoon
//
//  Created by 김성준 on 4/18/24.
//

import Foundation

//https://school.programmers.co.kr/learn/courses/30/lessons/84512

// 시간복잡도 : 문자열 길이를 n이라 하면 각 문자위치마다 5가지 알파뱃 조합이 있으니 n^5가 시간복잡도와 공간복잡도라 생각함 -> dfs니까 둘이 똑같다고 생각했음
// 정답 : 시간복잡도는 문자열 길이인 5로 정해져 있으니 5^5는 맞지만 공간복잡도는 n -> 최대 스택에 쌓일 수 있는 크기는 문자열 길이인 n 즉 5임
class LV2_모음사전 {
    func solution(_ word:String) -> Int {
        let alphabats =  ["A", "E", "I", "O", "U"]
        var count = 0
        var isFind: Bool = false
        
        func dfs(_ currentString: String, _ index: Int) {
            if currentString == word {
                isFind = true
            }
            
            if index == 5 {
                return
            }
            
            for alphabat in alphabats {
                if isFind {
                    return
                }
                count += 1
                dfs(currentString + alphabat, index + 1)
            }
            
        }
        
        dfs("", 0)
        
        return count
    }
    
}
