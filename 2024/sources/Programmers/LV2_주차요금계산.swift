//
//  LV2_주차요금계산.swift
//  BakJoon
//
//  Created by 김성준 on 9/11/24.
//

import Foundation

class 주차요금계산 {
    func solution(_ fees:[Int], _ records:[String]) -> [Int] {
        let basicMinute = fees[0]
        let basicFee = fees[1]
        let costMinute = fees[2]
        let cost = fees[3]
            
        var inDict: [Int: [Int]] = [:]
        var outDict: [Int: [Int]] = [:]
        
        for record in records {
            let input = record.split(separator: " ")
            let recordTime = input[0].split(separator: ":").map{String($0)}
            let recordMinute = transToMunute(recordTime.first!, recordTime.last!)
            let recordCarNumber = Int(input[1])!
            let recordInOut = input[2]

    //             // 입차와 출차는 쌍으로 이어진다 단, 입차만 있는경우 23:59분에 출차 한것으로 판별한다.
            if recordInOut == "IN" {
                inDict[recordCarNumber, default: []].append(recordMinute)
            } else if recordInOut == "OUT" {
                outDict[recordCarNumber, default: []].append(recordMinute)
            }
        }
        
//    print(inDict)
//    print(outDict)
        // 요금계산
//        for {
//            
//        }
        
            
            
            
            return []
        }
        
    func transToMunute(_ hour: String, _ minute: String) -> Int {
        return Int(hour)! * 60 + Int(minute)!
    }}
