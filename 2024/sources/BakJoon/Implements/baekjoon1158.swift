//
//  baekjoon_1158.swift
//  BakJoon
//
//  Created by 김성준 on 6/7/24.
//

import Foundation



class baekjun1158 {
    ///notes: 백준 채점할 때 기존에 작성했던 solution 함수의 논리는 맞지만, 출력형식이 달라서 2% 진행 이후에 틀렸다고 나왔음
    func solution1() -> [Int] {
        let firstLine = readLine()!
        let parts = firstLine.split(separator: " ").compactMap { Int($0) }
        let n = parts[0]
        let k = parts[1]
        var targetIndex = k - 1
        var items: [Int] = [Int](repeating: 0, count: n)
        var result: [Int] = []
        
        for i in 1...n {
            items[i-1] = i
        }
        
        while items.count != 0 {
            let num = items.remove(at: targetIndex)
            result.append(num)
            guard !items.isEmpty else { return result }
            targetIndex = (targetIndex + k - 1) % items.count
        }
        
        return result
    }
    
    ///notes: 개선안
    func solution2() {
        // readLine을 사용하여 입력을 받음
        guard let input = readLine() else { return }
        let parts = input.split(separator: " ").compactMap { Int($0) }
        let n = parts[0]
        let k = parts[1]
        
        // 초기 설정
        var targetIndex = 0
        var items = Array(1...n) // MARK: 초기화 부분 이렇게 개선하면 좋겠다
        var result: [Int] = []
        
        // 요세푸스 순열 계산
        while !items.isEmpty {
            targetIndex = (targetIndex + k - 1) % items.count
            result.append(items.remove(at: targetIndex))
        }
        
        // 결과 출력
        let resultString = result.map { String($0) }.joined(separator: ", ")
        print("<\(resultString)>")
    }
}

// 3, 6, 2, 7, 5, 1, 4
