//
//  Easy_108.swift
//  BakJoon
//
//  Created by 김성준 on 3/4/25.
//

import Foundation

class convert_108 {
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init() { self.val = 0; self.left = nil; self.right = nil; }
        public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }
    
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        let node = TreeNode()
        build(0, nums.count - 1, nums, node)
        
        return node
        
    }
    
    //MARK: 초기 생성시 left, right는 항상 nil이라 재귀함수 안에서 노드 생성해야됨
    private func build(_ leftIndex: Int, _ rightIndex: Int, _ nums: [Int], _ node: TreeNode?) {
        guard leftIndex != rightIndex else {
            node?.val = nums[leftIndex]
            return
        }
        guard leftIndex > -1 && rightIndex < nums.count else { return }
        
        let mid = leftIndex + (rightIndex - leftIndex) / 2
        
        node?.val = nums[mid]
        
        build(leftIndex, mid - 1, nums, node?.left)
        build(mid + 1, rightIndex, nums, node?.right)
    }
    
    //MARK: 해결책
    //    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    //        return build(0, nums.count - 1, nums)
    //    }
    //
    //    private func build(_ leftIndex: Int, _ rightIndex: Int, _ nums: [Int]) -> TreeNode? {
    //        if leftIndex > rightIndex {
    //            return nil
    //        }
    //
    //        let mid = leftIndex + (rightIndex - leftIndex) / 2
    //        let node = TreeNode(nums[mid]) // 노드 생성
    //
    //        node.left = build(leftIndex, mid - 1, nums)  // 왼쪽 서브트리 생성
    //        node.right = build(mid + 1, rightIndex, nums) // 오른쪽 서브트리 생성
    //
    //        return node
    //    }
    
}
