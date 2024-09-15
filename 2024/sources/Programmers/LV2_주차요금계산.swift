//
//  LV2_주차요금계산.swift
//  BakJoon
//
//  Created by 김성준 on 9/11/24.
//

import Foundation

class 주차요금계산 {
    func solution(_ fees:[Int], _ records:[String]) -> [Int] {
        let basicMinute = fees[0] // 기본시간(분)
        let basicFee = fees[1] // 기본요금
        let costMinute = fees[2] // 단위시간
        let cost = fees[3] // 단위시간 요금
        let lastTime = transToTotalMunute(hour: "23", minute: "59")
        var inDict: [Int: [Int]] = [:]
        var outDict: [Int: [Int]] = [:]
        var parkingTimeDict: [Int: Int] = [:]
        
        // 입차, 출차를 구분지어 딕셔너리 생성한다. (키는 차 번호, 값은 입차, 출차 시간(분))
        for record in records {
            let input = record.split(separator: " ")
            let recordTime = input[0].split(separator: ":").map{String($0)}
            let recordMinute = transToTotalMunute(hour: recordTime.first!, minute: recordTime.last!)
            let recordCarNumber = Int(input[1])!
            let recordInOut = input[2]
            
            if recordInOut == "IN" {
                inDict[recordCarNumber, default: []].append(recordMinute)
            } else if recordInOut == "OUT" {
                outDict[recordCarNumber, default: []].append(recordMinute)
            }
        }
        
        // 입, 출차 별로 이용시간을 계산해 별도의 딕셔너리로 저장한다.
        for (key, Invalues) in inDict {
            for i in 0..<Invalues.count {
                // 입 출차 기록시간 갯수가 같지 않다면, 오늘 출차한 것이 아니므로 마지막 입차 기록에서 -23:59분 한 사용량을 계산한다.(입차 기록갯수와 출차 기록 갯수는 1이상 차이나지 않는다.)
                if inDict[key]!.count > outDict[key]?.count ?? 0 && inDict[key]!.count - 1 == i {
                    parkingTimeDict[key, default: 0] += lastTime - inDict[key]![i]
                } else {
                    parkingTimeDict[key, default: 0] += outDict[key]![i] - inDict[key]![i]
                }
            }
        }
        
        var results: [Int] = []
        
        // 주어진 계산식에 따라 이용요금을 처리한다.
        for (key, usageMinute) in parkingTimeDict.sorted(by: {$0.key < $1.key}) {
            // 이용시간이 기본시간 범위 이내면 기본요금만 받는다.
            if usageMinute <= basicMinute {
                results.append(basicFee)
            } else {
                let usagePercostMinute = ceil(Double(usageMinute - basicMinute) / Double(costMinute))
                
                results.append(basicFee + Int(usagePercostMinute) * cost)
            }
        }
        
        return results
    }
    
    func transToTotalMunute(hour: String, minute: String) -> Int {
        return Int(hour)! * 60 + Int(minute)!
    }
}
