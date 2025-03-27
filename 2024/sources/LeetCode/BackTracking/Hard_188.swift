//
//  Hard_188.swift
//  BakJoon
//
//  Created by 김성준 on 3/27/25.
//

import Foundation

class Hard_188 {
    func maxProfit(_ k: Int, _ prices: [Int]) -> Int {
        var cache: [String: Int] = [:]

        func makeKey(_ isBought: Bool ,_ position: Int, _ trans: Int) -> String {
            return "\(isBought)-\(position)-\(trans)"
        }

        func dfs(_ isBought: Bool ,_ position: Int, _ trans: Int) -> Int {
            if position >= prices.count || trans == 0 {
                return 0
            }

            let key = makeKey(isBought, position, trans)
            if let cachedResult = cache[key] {
                return cachedResult
            }

            // Case 1: Skip the current day
            var result = dfs(isBought, position + 1, trans)

            // Case 2: Buy or Sell
            if isBought {
                result = max(result, dfs(false, position + 1, trans - 1) + prices[position])  // Sell
            } else {
                result = max(result, dfs(true, position + 1, trans ) - prices[position])   // Buy
            }

            cache[key] = result
            return result
        }

        return dfs(false, 0, k)
    }
}
