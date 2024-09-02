//
//  295_Median from data stream.swift
//  BakJoon
//
//  Created by 김성준 on 2/25/24.
//

import Foundation

//class MedianFinder {
//    // minHeap
//    let rightHeap = GlobalPriorityQueue<Int>(compareOperator: {$0 < $1}, queue: [])
//    // maxHeap
//    let leftHeap = GlobalPriorityQueue<Int>(compareOperator: {$0 > $1}, queue: [])
//    
//    init() {
//        
//    }
//    
//    func addNum(_ num: Int) {
//        guard !leftHeap.isEmpty else {
//            leftHeap.enqueue(value: num)
//            return
//        }
//        
//        guard !rightHeap.isEmpty else {
//            rightHeap.enqueue(value: num)
//            return
//        }
//
//        if !rightHeap.isEmpty && !leftHeap.isEmpty {
//            let middleValue: Double = Double(Double(rightHeap.pick! + leftHeap.pick!) / 2.0)
//            if middleValue < Double(num) {
//                if rightHeap.count > leftHeap.count {
//                    if let tempValue = rightHeap.dequeue() {
//                        leftHeap.enqueue(value: tempValue)
//                    }
//                }
//                rightHeap.enqueue(value: num)
//            } else {
//                if leftHeap.count > rightHeap.count {
//                    if let tempValue = leftHeap.dequeue() {
//                        rightHeap.enqueue(value: tempValue)
//                    }
//                }
//                leftHeap.enqueue(value: num)
//            }
//        }
//    }
//    
//    func findMedian() -> Double {
//        var medianValue: Double = 0.0
//        
//        if leftHeap.isEmpty && !rightHeap.isEmpty {
//            return Double(rightHeap.pick!)
//        }
//        if rightHeap.isEmpty && !leftHeap.isEmpty{
//            return Double(leftHeap.pick!)
//        }
//        
//        if rightHeap.queue.count ==  leftHeap.queue.count{
//            if let minValue = rightHeap.pick, let maxValue = leftHeap.pick{
//                medianValue = Double(minValue + maxValue) / 2
//            }
//        } else {
//            if let value = rightHeap.pick {
//                medianValue = Double(value)
//            }
//        }
//        return medianValue
//    }
//}
