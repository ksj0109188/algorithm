//
//  733_FloodFill.swift
//  BakJoon
//
//  Created by 김성준 on 1/16/24.
//

import Foundation


func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
    var image = image
    var queue = [(sr,sc)]
    var target = [(sr,sc)]
    while !queue.isEmpty {
        let coordinate = queue.removeFirst()
        let m = coordinate.0
        let n = coordinate.1
        
        // top
        if m - 1 >= 0 && !target.contains(where: {$0 == (m - 1, n)}) {
            if image[m - 1][n] ==  image[sr][sc] {
                queue += [(m - 1, n)]
                target += [(m - 1, n)]
            }
        }
        // bottom
        if m + 1 < image.count && !target.contains(where: {$0 == (m + 1, n)}) {
            if image[m + 1][n] ==  image[sr][sc] {
                queue += [(m + 1, n)]
                target += [(m + 1, n)]
            }
        }
        // left
        if n - 1 >= 0 && !target.contains(where: {$0 == (m, n - 1)}) {
            if image[m][n - 1] ==  image[sr][sc] {
                queue += [(m, n - 1)]
                target += [(m, n - 1)]
            }
        }
        //right
        if n + 1 < image.first!.count && !target.contains(where: {$0 == (m, n + 1)}) {
            if image[m][n + 1] ==  image[sr][sc] {
                queue += [(m, n + 1)]
                target += [(m, n + 1)]
            }
        }
    }
    
    for coordinate in target {
        let m = coordinate.0
        let n = coordinate.1
        image[m][n] = color
    }
    
    return image
}
