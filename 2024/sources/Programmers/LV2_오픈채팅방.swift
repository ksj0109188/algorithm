//
//  LV2_오픈채팅방.swift
//  BakJoon
//
//  Created by 김성준 on 9/25/24.
//

import Foundation

class LV2_오픈채팅방 {
    func solution(_ record:[String]) -> [String] {
        var names: [String: String] = [:]
        var uuids: [String] = []
        var commands: [String] = []
        var results: [String] = []
        
        for item in record {
            let item = item.split(separator: " ").map{String($0)}
            
            let command = item[0]
            let uuid = item[1]
            var name = ""
            
            if command != "Leave" {
                name = item[2]
            }
            
            if (command == "Change" || command == "Enter") && name.count != 0 {
                names[uuid, default: ""] = name
            }
            
            uuids.append(uuid)
            commands.append(command)
        }
        
        for i in 0..<uuids.count {
            if commands[i] == "Enter" {
                results.append("\(names[uuids[i]] ?? "")님이 들어왔습니다.")
            } else if commands[i] == "Leave" {
                results.append("\(names[uuids[i]] ?? "")님이 나갔습니다.")
            }
        }
        
        return results
    }
}
