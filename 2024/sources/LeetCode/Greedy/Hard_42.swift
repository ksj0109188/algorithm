//
//  Hard_42.swift
//  BakJoon
//
//  Created by 김성준 on 1/21/25.
//

import Foundation
class Hard_42 {
    func Referecetrap(_ heights: [Int]) -> Int {
        let totalCount = heights.count
        guard totalCount > 2 else { return 0 }
        
        var maxHeightsLeftHandSide = Array(repeating: 0, count: totalCount)
        var maxHeightsRightHandSide = Array(repeating: 0, count: totalCount)
        
        maxHeightsLeftHandSide[0] = heights[0]
        maxHeightsRightHandSide[totalCount - 1] = heights[totalCount - 1]
        
        for idx in 1..<totalCount {
            maxHeightsLeftHandSide[idx] = max(maxHeightsLeftHandSide[idx - 1], heights[idx])
        }
        
        // backwards traversal
        for idx in (0..<totalCount - 1).reversed() {
            maxHeightsRightHandSide[idx] = max(maxHeightsRightHandSide[idx + 1], heights[idx])
        }
        
        var totalWaterContained = 0
        
        for idx in 0..<totalCount {
            totalWaterContained += min(maxHeightsLeftHandSide[idx], maxHeightsRightHandSide[idx]) - heights[idx]
        }
        
        return totalWaterContained
    }
    // Time Complexity - O(N)
    // Space Complexity - O(N)
    
    
    func trap(_ height: [Int]) -> Int {
        var wallIndex = 0
        var trapCount = 0
        var waterAmount = 0
        var calculated: Set<Int> = []
        
        // base on leftSide
        for i in 0..<height.count {
            if i > 0 && height[i] >= height[wallIndex] {
                calculated.insert(wallIndex)
                waterAmount += trapCount
                wallIndex = i
                trapCount = 0
            } else {
                trapCount += height[wallIndex] - height[i]
            }
        }
        
        wallIndex = height.count - 1
        trapCount = 0
        
        // base on rightSide
        for i in stride(from: height.count - 1, through: 0, by: -1) {
            if height[i] >= height[wallIndex] {
                if !calculated.contains(i) { waterAmount += trapCount }
                wallIndex = i
                trapCount = 0
            } else {
                trapCount += height[wallIndex] - height[i]
            }
        }
        
        return waterAmount
    }
}
