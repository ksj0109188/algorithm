//
//  LIS5.swift
//  BakJoon
//
//  Created by 김성준 on 1/17/25.
//

import Foundation

class ACMCrafft_1005 {

//    10 40 50 30 의 경우 정상적으로 출력 안됨 -> 이미 해가 구해졌는데 계속 연산이 실행됨
//    private func findLIS(sequence: [Int]) -> [Int] {
//        let n = sequence.count
//        var lis: [Int] = [] // LIS 배열
//
//        for num in sequence {
//            let index = lowerBound(lis, value: num)
//
//            if index == lis.count {
//                lis.append(num)
//            } else {
//                lis[index] = num
//            }
//        }
//
//        return lis
//    }
    // 역추적 배열을 하나 만들어서 추적하면 됨
    func findLIS(sequence: [Int]) -> (Int, [Int]) {
        let n = sequence.count
        var lis: [Int] = [] // LIS 배열
        var indices: [Int] = Array(repeating: -1, count: n) // LIS 원소의 원본 인덱스
        var prevIndices: [Int] = Array(repeating: -1, count: n) // 역추적을 위한 이전 인덱스
        
        for i in 0..<n {
            // 이진 탐색을 통해 LIS 배열에서 현재 원소가 들어갈 위치 찾기
            let pos = lowerBound(lis, value: sequence[i])
//            print("Step \(i + 1): Current element = \(sequence[i]), Position in LIS = \(pos)")
            
            if pos == lis.count {
                // 새로운 원소를 추가하는 경우
                lis.append(sequence[i])
//                print("Appended \(sequence[i]) to LIS")
            } else {
                // 기존 위치의 값을 대체하는 경우
//                print("Replaced LIS[\(pos)] = \(lis[pos]) with \(sequence[i])")
                lis[pos] = sequence[i]
            }
            
            indices[pos] = i // 현재 위치의 원본 배열 인덱스 저장
            if pos > 0 {
                prevIndices[i] = indices[pos - 1] // 이전 원소의 인덱스 연결
                print("Updated prevIndices[\(i)] = \(indices[pos - 1])")
            }
            
            print("Current LIS: \(lis)", "Currentindices: \(indices)")
        }

        print("out of for loop")
        print("lis: \(lis)")
        print("indices: \(indices)")
        print("prevIndices: \(prevIndices)")
//
        // LIS 복원
        let lisLength = lis.count
        var result: [Int] = []
        var currentIndex = indices[lisLength - 1]
        
//        print("Reconstructing LIS:")
        while currentIndex != -1 {
            print("currentIndex", currentIndex)
            result.append(sequence[currentIndex])
            print("Added \(sequence[currentIndex]) to result")
            currentIndex = prevIndices[currentIndex]
        }
        
        return (lisLength, result.reversed())
    }

    // lowerBound: LIS 배열에서 이진 탐색으로 삽입 위치를 찾음
    private func lowerBound(_ array: [Int], value: Int) -> Int {
        var low = 0
        var high = array.count
        
        while low < high {
            let mid  = (low + high) / 2
    
            if array[mid] < value {
                low = mid + 1
            } else {
                high = mid
            }
        }
        
        return low
    }

    func solution() {
        // 입력 받기
        let n = Int(readLine()!)!
        let sequence = readLine()!.split(separator: " ").map { Int($0)! }
        
        let (length, lis) = findLIS(sequence: sequence)
        
        // 출력
        print(length)
        print(lis.map { String($0) }.joined(separator: " "))
    }
}


