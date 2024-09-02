//
//  LV2_3차압축.swift
//  BakJoon
//
//  Created by 김성준 on 8/27/24.
//

import Foundation

class LV2_3차압축 {
    func solution(_ msg: String) -> [Int] {
        let msg = Array(msg)
        var dict: [String: Int] = [:]
        var pointer = 27
        
        for i in 0..<26 {
            let ascii = UInt8(ascii: "A")
            dict[String(UnicodeScalar(ascii + UInt8(i)))] = i + 1
        }
        print(dict)
        
        var index = 0
        var result = [Int]()
        
        while index < msg.count {
            let (nextIndex, value) = dfs(index)
            index = nextIndex + 1
            result.append(value)
        }
        
        //MARK: 다음 글자가 사전에 있는지 체크한다. 없다면 dict에 추가후 현재 위치와 사전의 인덱스 번호를 반환한다.
        func dfs(_ index: Int) -> (nextIndex: Int, dictValue: Int) {
            var nextIndex = index
            var value = dict[String(msg[index])]!
            // 0 ... 1 2 3
            // 2 ... 3 4 5
            for i in index + 1..<msg.count{
                let target = String(msg[index...i])
                
                if dict[target] == nil {
                    dict[target] = pointer
                    pointer += 1
                    break
                } else {
                    nextIndex = i
                    value = dict[target]!
                }
            }
            
            return (nextIndex, value)
        }
        
        
        return result
    }
}

//1. 길이가 1인 모든 단어를 포함하도록 사전을 초기화한다.
//2. 사전에서 현재 입력과 일치하는 가장 긴 문자열 w를 찾는다. dfs
//3. w에 해당하는 사전의 색인 번호를 출력하고, 입력에서 w를 제거한다.
//4. 입력에서 처리되지 않은 다음 글자가 남아있다면(c), w+c에 해당하는 단어를 사전에 등록한다.
//5. 단계 2로 돌아간다.
