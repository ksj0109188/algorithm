//
//  Medium_gasStation.swift
//  BakJoon
//
//  Created by 김성준 on 1/20/25.
//

import Foundation

class Medium_gasStation {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
          let n = gas.count
          var totalGas = 0
          var totalCost = 0
          var tank = 0
          var startIndex = 0

          for i in 0..<n {
              totalGas += gas[i]
              totalCost += cost[i]
              tank += gas[i] - cost[i]
              print("totalGas: \(totalGas), totalCost: \(totalCost), tank: \(tank), startIndex: \(startIndex)")
              // If tank is negative, the current start index is invalid
              if tank < 0 {
                  startIndex = i + 1
                  tank = 0
              }
          }

          // Check if total gas is enough to complete the circuit
          return totalGas >= totalCost ? startIndex : -1
      }
//      MARK: [5,8,2,8], [6,5,6,6]의 경우 오답. 해당 함수는 항상 옳은 답을 찾을 수 없음
//        func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
//            var startIndex = -1
//            var maxCapacity = 0
//            let n = gas.count
//
//            for i in 0..<n {
//                let val = gas[i] - cost[i]
//
//                if maxCapacity < val {
//                    startIndex = i
//                    maxCapacity = val
//                }
//            }
//            print("startIndex", startIndex)
//            guard startIndex > -1 else { return -1}
//
//            var queue = [startIndex]
//            var currentCapacity = gas[startIndex]
//            var isVisited: [Bool] = .init(repeating: false, count: n)
//            isVisited[startIndex] = true
//
//
//            while !queue.isEmpty {
//                let step = queue.removeFirst()
//                let nextStep = (step + 1) % n
//
//                if nextStep == startIndex {
//                    break
//                }
//
//                currentCapacity -= cost[step]
//
//                if currentCapacity <= 0 {
//                    return -1
//                }
//
//                currentCapacity += gas[nextStep]
//
//                if !isVisited[nextStep] {
//                    queue.append(nextStep)
//                }
//            }
//
//            return startIndex
//        }
}
