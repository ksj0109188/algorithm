//
//  LV2_과제진행하기.swift
//  BakJoon
//
//  Created by 김성준 on 7/28/24.
//

import Foundation

class LV2_과제진행하기 {
    // IDE 툴 없이도 풀 수 있을까... 디버깅 툴 도움으로 꾸역꾸역 풀긴 했는데
    func timeToMinutes(_ time: String) -> Int {
        let parts = time.split(separator: ":").map { Int($0)! }
        return parts[0] * 60 + parts[1]
    }
    
    func solution(_ plans:[[String]]) -> [String] {
        // Convert plans to a tuple (name, startInMinutes, playtimeInMinutes)
        var tasks = plans.map { (plan) -> (name: String, start: Int, playtime: Int) in
            let name = plan[0]
            let start = timeToMinutes(plan[1])
            let playtime = Int(plan[2])!
            
            return (name, start, playtime)
        }
        
        tasks.sort { $0.start < $1.start }
        
        var result: [String] = []
        var currentTime = 0
        var availableTime = 0
        var pausedStack: [(name: String, start: Int, remain: Int)] = []
        var isNewTask = false
        for task in tasks {
            let (name, start, playtime) = task
            // 작업 시작전에, 현재 시작 시간에 맞게 일시정지인 큐들의 남은 시간들을 최근 순서대로 감소해나간다.
            while !pausedStack.isEmpty && isNewTask {
                let lastPaused = pausedStack.last!
                
                if availableTime == 0 {
                    availableTime = start - lastPaused.start
                }
                // 남은시간 : 30 - 이용가능시간 : 40
                var newRemainTime = 0
                if availableTime < 0 {
                    newRemainTime = lastPaused.remain + availableTime
                } else {
                    newRemainTime = lastPaused.remain - availableTime
                }
                var updateTask = lastPaused
               
                pausedStack.removeLast()
                // 남은시간이 양수이면 진행해야 할 작업이 남아있다 판단
                if newRemainTime > 0 {
                    updateTask.remain = newRemainTime
                    pausedStack.append(updateTask)
                    isNewTask = false
                    availableTime = 0
                } else if newRemainTime == 0 {
                    isNewTask = false
                    availableTime = 0
                    result.append(lastPaused.name)
                } else {
                    availableTime = newRemainTime
                    result.append(lastPaused.name)
                }
            }
            
            // 새로운 작업을 시작
            if currentTime < start {
                pausedStack.append((name: name, start: start, remain: playtime))
                currentTime = start
                isNewTask = true
            }
        }
        
        while !pausedStack.isEmpty {
            result += [pausedStack.removeLast().name]
        }
        
        return result
    }
    
//    func solution(_ plans: [[String]]) -> [String] {
//        // 과제를 (이름, 시작시간(분), 소요시간(분)) 형태로 변환
//        var sortedPlans = plans.map { plan -> (name: String, start: Int, duration: Int) in
//            let name = plan[0]
//            let start = timeToMinutes(plan[1])
//            let duration = Int(plan[2])!
//            return (name, start, duration)
//        }.sorted { $0.start < $1.start }
//        
//        var result: [String] = []
//        var stack: [(name: String, remainingTime: Int)] = []
//        var currentTime = 0
//        
//        for i in 0..<sortedPlans.count {
//            let currentPlan = sortedPlans[i]
//            
//            // 현재 시간부터 다음 과제 시작 시간까지 일시 중지된 과제 처리
//            while !stack.isEmpty && currentTime < currentPlan.start {
//                let availableTime = currentPlan.start - currentTime
//                var (name, remainingTime) = stack.removeLast()
//                
//                if remainingTime <= availableTime {
//                    result.append(name)
//                    currentTime += remainingTime
//                } else {
//                    stack.append((name, remainingTime - availableTime))
//                    currentTime = currentPlan.start
//                    break
//                }
//            }
//            
//            // 새 과제 시작
//            currentTime = currentPlan.start
//            
//            // 마지막 과제가 아니라면 스택에 추가
//            if i < sortedPlans.count - 1 {
//                let nextStart = sortedPlans[i + 1].start
//                let availableTime = nextStart - currentTime
//                
//                if currentPlan.duration <= availableTime {
//                    result.append(currentPlan.name)
//                    currentTime += currentPlan.duration
//                } else {
//                    stack.append((currentPlan.name, currentPlan.duration - availableTime))
//                    currentTime = nextStart
//                }
//            } else {
//                // 마지막 과제는 바로 완료
//                result.append(currentPlan.name)
//            }
//        }
//        
//        // 남은 과제 처리
//        while !stack.isEmpty {
//            result.append(stack.removeLast().name)
//        }
//        
//        return result
//    }
}
//name: "music", start: 740, playtime: 40)
//(name: "computer", start: 750, playtime: 100)
//(name: "science", start: 760, playtime: 50) 760 - 840 = 80
//(name: "history", start: 840, playtime: 30)
