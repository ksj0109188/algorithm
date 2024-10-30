//
//  SegmentTree.swift
//  BakJoon
//
//  Created by 김성준 on 10/27/24.
//

import Foundation

class SegmentTree {
    var tree: [Int]
    var n: Int
    
    init(_ arr: [Int]) {
        n = arr.count
        tree = Array(repeating: 0, count: 2 * n)
        build(arr)
    }
    
    // 1. 트리 구성
    private func build(_ arr: [Int]) {
        // 리프 노드에 배열 원소 배치
        for i in 0..<n {
            tree[n + i] = arr[i]
        }
        // 내부 노드를 구성
        for i in stride(from: n - 1, to: 0, by: -1) {
            tree[i] = tree[2 * i] + tree[2 * i + 1]
        }
    }
    
    // 2. 구간 합 쿼리
    func query(_ left: Int, _ right: Int) -> Int {
        var l = left + n
        var r = right + n
        var sum = 0
        
        while l <= r {
            if l % 2 == 1 {
                sum += tree[l]
                l += 1
            }
            if r % 2 == 0 {
                sum += tree[r]
                r -= 1
            }
            l /= 2
            r /= 2
        }
        return sum
    }
    
    // 3. 업데이트
    func update(_ index: Int, _ value: Int) {
        var i = index + n
        tree[i] = value
        
        while i > 1 {
            i /= 2
            tree[i] = tree[2 * i] + tree[2 * i + 1]
        }
    }
}
