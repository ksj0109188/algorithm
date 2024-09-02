//
//  CloneGraph.swift
//  BakJoon
//
//  Created by 김성준 on 6/11/24.
//

import Foundation

public class Node {
    public var val: Int
    public var neighbors: [Node?] // -> [Node(2), Node(3)]
    public init(_ val: Int) {
        self.val = val
        self.neighbors = []
    }
}

//TODO: 다시 풀어보기
class SolutionCloneGraph {
//    func cloneGraph(_ node: Node?) -> Node? {
//        guard let node = node else { return nil }
//        var visited = [Bool](repeating: false, count: 100)
//        visited[1] = true
//        let copiedNode = Node(1)
//        var queue = node.neighbors
//        // 새로운 Node 클래스를 만들어야 하고, Neighbor들 노드도 새로 만들어야함
//        // 그렇다면 Neighbor들을 bfs방식으로 타고 들어가야 하는데, 새로 만들면 연결이 끊기는데...
//        // 만들고 연결이 끊기기 전에 queue에 넣는 방법은 어떨까.
//        while !queue.isEmpty {
//            let node = queue.removeFirst()!
//            let val = node.val
//            let neighbors = node.neighbors
//            
//            let newNode = Node(node.val)
//            
//            queue += node.neighbors
//        }
//        
//        return copiedNode
//    }
    
//    func cloneGraph(_ node: Node?) -> Node? {
//           guard let node = node else { return nil }
//           
//           var visited = [Int: Node]()
//           var queue = [Node]()
//           
//           // 시작 노드를 복사하고 큐에 추가
//           let clonedNode = Node(node.val)
//           visited[node.val] = clonedNode
//           queue.append(node)
//           
//           while !queue.isEmpty {
//               let currentNode = queue.removeFirst()
//               
//               for neighbor in currentNode.neighbors {
//                   guard let neighbor = neighbor else { continue }
//                   if visited[neighbor.val] == nil {
//                       // 이웃 노드를 복사하고 큐에 추가
//                       let clonedNeighbor = Node(neighbor.val)
//                       visited[neighbor.val] = clonedNeighbor
//                       queue.append(neighbor)
//                   }
//                   // 현재 노드의 복사본에 이웃 노드의 복사본을 추가
//                   visited[currentNode.val]?.neighbors.append(visited[neighbor.val]!)
//               }
//           }
//           
//           return clonedNode
//       }
}
