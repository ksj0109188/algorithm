//
//  LV4_호텔방배정.swift
//  BakJoon
//
//  Created by 김성준 on 11/6/24.
//

import Foundation

class LV4_호텔방배정 {
    func solution(_ k: Int64, _ room_number: [Int64]) -> [Int64] {
        var roomParent = [Int64: Int64]()
        var answer = [Int64]()
        
        func findEmptyRoom(_ room: Int64) -> Int64 {
            // room이 비어 있으면 해당 방을 반환하고 다음 방을 가리키게 설정
            if roomParent[room] == nil {
                roomParent[room] = room + 1
                return room
            }
            // 이미 배정된 방이라면, 재귀적으로 다음 빈 방을 찾고 경로 압축
            let nextRoom = findEmptyRoom(roomParent[room]!)
            roomParent[room] = nextRoom
            return nextRoom
        }
        
        for room in room_number {
            let assignedRoom = findEmptyRoom(room)
            answer.append(assignedRoom)
        }
        
        
        return answer
    }
}
