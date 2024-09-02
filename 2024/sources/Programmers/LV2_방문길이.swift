//
//  LV2_방문길이.swift
//  BakJoon
//
//  Created by 김성준 on 5/2/24.
//

import Foundation

class LV2_방문길이 {
    //MARK: 오답 -> 좌표계를 해결하지 못함 해당 문제는 무방향 그래프로, 다음 좌표계 이동시 원래 있던 좌표계가 어디서 다시 들어 오면 새로 방문했다는 카운트를 +1할지에 대한 이슈가 있었고 이를 해결하지 못함
    //MARK:  오답풀이법
    func solution(_ dirs:String) -> Int {
        var coordinate = Array<[Bool]>(repeating: [], count: 11)
        let dict: [Character: (Int, Int)] = ["U": (-1, 0), "D": (1, 0), "L": (0, -1), "R": (0, 1)]
        var currentPosition = (5, 5)
        var result = 0
        var visitedPaths: [(Int,Int)] = []
        
        for i in 0..<coordinate.count {
            coordinate[i] = [Bool](repeating: false, count: 11)
        }
        
        for command in dirs {
            var reverse: (Int, Int)?
            switch command {
                case "U":
                    reverse = dict["D"]!
                case "D":
                    reverse = dict["U"]!
                case "L":
                    reverse = dict["R"]!
                case "R":
                    reverse = dict["L"]!
                default:
                    break
            }
            
            let nx = currentPosition.0 + dict[command]!.0
            let ny = currentPosition.1 + dict[command]!.1
            let rnx = nx + reverse!.0
            let rny = ny + reverse!.1
            
            if (nx >= 0 && ny >= 0) && (nx < coordinate.count && ny < coordinate.first!.count) {
                //이 부분에서 좌표계가 다시 들어왔을 때 어디서 다시 들어오는지 체크를 하지 못함 예를들어
                // 다음 스탭이 L -> (4, 5) 일 때 , 원래 있던 (5,5)가 이미 방문 했다면, (4,5) -> (5, 5)는 안되지만 (5,6) -> (5,5) 는 카운트 가능
                if !visitedPaths.contains(where: {$0 == (nx, ny) }) {
                    result += 1
                    visitedPaths.append((nx, ny))
                    visitedPaths.append((rnx, rny))
                }
                currentPosition = (nx, ny)
            }
        }
        
        return result
    }
    
//    func solution(_ dirs: String) -> Int {
//        var currentPosition = (x: 5, y: 5)
//        var result = 0
//        var visitedPaths: [Int: Set<Int>] = [:]
//
//        let dict: [Character: Int] = ["U": 0, "D": 1, "L": 2, "R": 3]
//        let dx = [-1, 1, 0, 0]
//        let dy = [0, 0, -1, 1]
//        
//        for command in dirs {
//            let direct = dict[command]!
//            let nx = currentPosition.x + dx[direct]
//            let ny = currentPosition.y + dy[direct]
//            
//            // 좌표 범위를 확인
//            if nx >= 0 && nx < 11 && ny >= 0 && ny < 11 {
//                let currentKey = currentPosition.x * 11 + currentPosition.y
//                let nextKey = nx * 11 + ny
//
//                if visitedPaths[currentKey, default: Set<Int>()].insert(nextKey).inserted {
//                    result += 1
//                }
//
//                // 양방향 경로를 저장
//                visitedPaths[nextKey, default: Set<Int>()].insert(currentKey)
//                
//                // 현재 위치 업데이트
//                currentPosition = (nx, ny)
//            }
//        }
//        
//        return result
//    }
}
