//
//  baekjoon_1333.swift
//  BakJoon
//
//  Created by 김성준 on 3/16/24.
//

import Foundation

class baekjun1333{
    // TODO
    // failed
    func solve1() -> Int {
        // N앨범 갯수
        // L앨범 길이
        // D전화벨 초단위
        // 곡이 끝난 후 다음 곡까지 5초동안 벨소리 들을 수 있지.
        //        [N][L] 배열에 [N][5]배열 을 추가(대기시간)
        //        for문을 돌면서 D를 하나씩 감소 여기서 중요
                // D가 만약에 곡이 끝나고 계속 울리고 있는가?
        
        let input = readLine()!.split(separator: " ")
        let n = Int(input[0])!
        let l = Int(input[1])!
        let d = Int(input[2])!
        let callingTime = d
        var result = 0
        
        // 배열의 요소가 1이면 음악 실행중, 0일경우 벨소릴 들을 수 있음
        var timeList = Array(repeating: Array(repeating: 1, count: l), count: n)
        
        for i in 0..<timeList.count {
            if i != timeList.count - 1 {
                timeList[i] += [0,0,0,0,0]
            }
        }
        print(timeList)
        var playTime = 0
        for i in 0..<timeList.count {
            for j in 0..<timeList[i].count {
                if playTime % callingTime == 0 {
                    if timeList[i][j] == 0 {
                        return playTime
                    } else {
                        result = playTime
                    }
                }
                playTime += 1
            }
        }
        // 노래 시점에 안 들렸으면, 전화주기에 맞춰 받을 수 있지 않나
        return result + callingTime
    }
    
    // solve
    func solve2() -> Int {
        let input = readLine()!.split(separator: " ")
        let N = Int(input[0])!
        let L = Int(input[1])!
        let D = Int(input[2])!
        
         var totalTime = 0
         var ringTime = 0
         
         // 전체 앨범의 길이 계산 (노래 길이 + 조용한 구간, 마지막 노래 후 조용한 구간 제외)
         totalTime = N * (L + 5) - 5
         
         // 전화벨이 울 수 있는 시간 계산
         while ringTime <= totalTime {
             // 밸이 울리고 있는지 확인
             let checkValue = ringTime % (L + 5)
             // 노래가 나오는 중이 아닌 시간에 전화벨이 울리는지 확인
             if ringTime % (L + 5) < L {
                 // 노래가 나오는 시간에는 전화벨을 들을 수 없으므로, 다음 전화벨 시간으로 이동
                 ringTime += D
             } else { // ringTime % (L + 5) > L || ringTime % (L + 5) == L
                 // 전화벨을 들을 수 있는 시간 발견
                 return ringTime
             }
         }
         
         // 전체 앨범을 들은 후 첫 번째 전화벨 시간 반환
         return ringTime
     }
}
