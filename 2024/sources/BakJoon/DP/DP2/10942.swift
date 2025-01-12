//
//  10942.swift
//  BakJoon
//
//  Created by 김성준 on 1/10/25.
//

import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        do {
            guard let fileData = try fileHandle.readToEnd() else {
                debugPrint("Empty Data")
                exit(0)
            }
            buffer = Array(fileData) + [UInt8(0)] // 인덱스 범위 초과 방지
        } catch {
            debugPrint("Error reading data: \(error.localizedDescription)")
            exit(0)
        }
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

class 팰린드롬 {
    let file = FileIO()
    
    func solution() {
        let n = file.readInt()
        var nums: [Int] = []
        
        for _ in 0..<n {
            nums.append(file.readInt())
        }
        
        let m = file.readInt()
        var dp: [[Int]] = .init(repeating: .init(repeating: 0, count: n), count: n)
        
        for i in 0..<n {
            dp[i][i] = 1
        }
        
        for i in 0..<n - 1 {
            if nums[i] == nums[i + 1] {
                dp[i][i + 1] = 1
            }
        }
        
        if n > 2 {
            for length in 3...n {
                for i in 0...n - length {
                    let j = i + length - 1
                    if nums[i] == nums[j] && dp[i + 1][j - 1] == 1 {
                        dp[i][j] = 1
                    }
                }
            }
        }
    
        var result = ""
              for _ in 0..<m {
                  let (S, E) = (file.readInt(), file.readInt())
                  result += "\(dp[S-1][E-1])\n" // 인덱스 변환
              }
              print(result)
    }
}
