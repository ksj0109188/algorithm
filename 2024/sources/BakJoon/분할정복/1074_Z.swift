//
//  1074_Z.swift
//  BakJoon
//
//  Created by 김성준 on 10/6/24.
//

import Foundation

class Z_1074 {
    func solution() {
         let input = readLine()!.split(separator: " ").map { Int($0)! }
         let n = input[0]
         let r = input[1]
         let c = input[2]
         
         // 전체 배열 크기
         let size = 1 << n  // 2^n
         
         // 재귀 함수 정의
         func dfs(r: Int, c: Int, size: Int, count: Int) -> Int {
             // Base case: size가 2x2로 작아질 때
             if size == 2 {
                 if r == 0 && c == 0 { return count }
                 if r == 0 && c == 1 { return count + 1 }
                 if r == 1 && c == 0 { return count + 2 }
                 if r == 1 && c == 1 { return count + 3 }
             }
             
             // 현재 배열을 4등분
             let halfSize = size / 2
             let areaSize = halfSize * halfSize
             
             // 좌상 (1사분면)
             if r < halfSize && c < halfSize {
                 return dfs(r: r, c: c, size: halfSize, count: count)
             }
             // 우상 (2사분면)
             if r < halfSize && c >= halfSize {
                 return dfs(r: r, c: c - halfSize, size: halfSize, count: count + areaSize)
             }
             // 좌하 (3사분면)
             if r >= halfSize && c < halfSize {
                 return dfs(r: r - halfSize, c: c, size: halfSize, count: count + 2 * areaSize)
             }
             // 우하 (4사분면)
             return dfs(r: r - halfSize, c: c - halfSize, size: halfSize, count: count + 3 * areaSize)
         }
         
         // 초기 호출
         let result = dfs(r: r, c: c, size: size, count: 0)
         print(result)
     }
}
