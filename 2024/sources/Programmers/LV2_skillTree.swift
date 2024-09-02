//
//  LV2_skillTree.swift
//  BakJoon
//
//  Created by 김성준 on 7/15/24.
//

import Foundation

class LV2_skillTree {
    func solution(_ skill:String, _ skill_trees:[String]) -> Int {
        func available(_ s: String, _ t: String) -> Bool {
            let alza = t.filter { s.contains($0) }
            return s.starts(with: alza)
        }

        return skill_trees.map { available(skill, $0) }.filter { $0 }.count
    }
}
