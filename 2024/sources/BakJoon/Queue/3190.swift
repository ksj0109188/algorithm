//
//  3190.swift
//  BakJoon
//
//  Created by 김성준 on 3/28/25.
//

import Foundation
// MARK: 뱀의 길이와 위치를 어떻게 관리할지 생각 안나 시간초과됨.
class 뱀_3190 {
    // 방향: 상(0), 하(1), 좌(2), 우(3)
    let directions: [Int: (dx: Int, dy: Int)] = [
        0: (-1, 0), 1: (1, 0), 2: (0, -1), 3: (0, 1)
    ]

    struct Position: Hashable {
        var x: Int
        var y: Int
    }

    func exec() {
        let n = Int(readLine()!)!  // 보드 크기
        let k = Int(readLine()!)!  // 사과 개수

        var board = Array(repeating: Array(repeating: 0, count: n), count: n)
        for _ in 0..<k {
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            board[input[0] - 1][input[1] - 1] = 2  // 사과 위치
        }

        let l = Int(readLine()!)!  // 방향 변환 횟수
        var commands: [(time: Int, direction: String)] = []
        for _ in 0..<l {
            let input = readLine()!.split(separator: " ")
            commands.append((Int(input[0])!, String(input[1])))
        }

        var time = 0
        var direction = 3  // 초기 방향: 오른쪽
        var snake: [Position] = [Position(x: 0, y: 0)]  // 뱀의 몸을 저장하는 큐
        var snakeSet: Set<Position> = [Position(x: 0, y: 0)]  // 몸이 위치한 좌표를 빠르게 조회하기 위한 Set
        board[0][0] = 1  // 뱀의 시작 위치

        var commandIndex = 0

        while true {
            time += 1
            let head = snake.last!  // 머리 위치
            let nx = head.x + directions[direction]!.dx
            let ny = head.y + directions[direction]!.dy

            // 벽에 닿거나, 자기 자신과 부딪히면 종료
            if nx < 0 || nx >= n || ny < 0 || ny >= n || snakeSet.contains(Position(x: nx, y: ny)) {
                break
            }

            // 이동
            snake.append(Position(x: nx, y: ny))
            snakeSet.insert(Position(x: nx, y: ny))

            // 사과가 있는 경우 -> 길이 유지
            if board[nx][ny] == 2 {
                board[nx][ny] = 0  // 사과 제거
            } else {  // 사과가 없으면 꼬리 제거
                let tail = snake.removeFirst()
                snakeSet.remove(tail)
            }

            // 방향 전환
            if commandIndex < commands.count && commands[commandIndex].time == time {
                direction = rotate(direction, commands[commandIndex].direction)
                commandIndex += 1
            }
        }

        print(time)
    }

    func rotate(_ direction: Int, _ command: String) -> Int {
        if command == "L" {  // 왼쪽 회전 (반시계)
            let result =  [0: 2, 1: 3, 2: 1, 3: 0][direction]!
            return result
        } else {  // 오른쪽 회전 (시계 방향)
            return [0: 3, 1: 2, 2: 0, 3: 1][direction]!
        }
    }
}
// MARK: 요게 원래 풀던거
//class 뱀_3190 {
//    //상: 0, 하: 1, 좌: 2, 우 : 3
//    var dicts: [Int: (x: Int, y: Int)] = [0: (-1, 0), 1: (1, 0), 2: (0, -1), 3: (0, 1)]
//    func exec() {
//        let n = Int(readLine()!)!
//        let k = Int(readLine()!)!
//        var commands: [(time: Int, direct: String)] = []
//        // arr element 0 -> 아무것도 없음, 1 -> 뱀이 위치함, 2 -> apple 위치
//        var arr: [[Int]] = .init(repeating: .init(repeating: 0, count: n), count: n)
//
//        arr[0][0] = 1
//        for _ in 0..<k {
//            let input = readLine()!.split(separator: " ").map{ Int($0)! }
//            let (x,y) = (input[0] - 1, input[1] - 1)
//            arr[x][y] = 2
//        }
//
//        let l = Int(readLine()!)!
//
//        for _ in 0..<l {
//            let input = readLine()!.split(separator: " ")
//            commands.append((Int(input[0])!, String(input[1])))
//        }
//
//        var time = 0
//        var position = (0, 0)
//        var currentDict = 3
//        var command = commands.removeFirst()
//
//        while true {
//            let (x, y) = (position.0, position.1)
//            let (nx, ny) = ((x + dicts[currentDict]!.x), (y + dicts[currentDict]!.y))
//
//            if (nx >= 0 && nx < n) && (ny >= 0 && ny < n) {
//                time += 1
//                // 자기 몸통에 부딪히면 게임 끝
//                if arr[nx][ny] == 1 { break}
//                // 만약 이동한 칸에 사과가 있다면, 그 칸에 있던 사과가 없어지고 꼬리는 움직이지 않는다.
//                if arr[nx][ny] == 2 {
//
//                } else {  // 만약 이동한 칸에 사과가 없다면, 몸길이를 줄여서 꼬리가 위치한 칸을 비워준다. 즉, 몸길이는 변하지 않는다.
//                    arr[x][y] = 0
//                }
//
//                if command.time == time {
//                    currentDict = rotation(currentDict, command.direct)
//                    command = commands.removeFirst()
//                }
//
//                position = (nx, ny)
//            } else { // 벽에 부딪힐 때 게임끝
//                break
//            }
//        }
//
//        print(time)
//
//        func rotation(_ direction: Int, _ command: String) -> Int {
//            if direction == 0 {
//                return command == "L" ? 2 : 3
//            } else if direction == 1 {
//                return command == "L" ? 3 : 2
//            } else if direction == 3 {
//                return command == "L" ? 0 : 1
//            } else {
//                return command == "L" ? 1 : 0
//            }
//        }
//
//    }
//}
