//
//  Medium_wordSearch.swift
//  BakJoon
//
//  Created by 김성준 on 5/12/24.
//

import Foundation

class Medium_wordSearch {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var checkBoard = [[Bool]](repeating: [Bool](repeating: false, count: board.first!.count), count: board.count)
        let dicts = [(-1, 0), (1, 0), (0, -1) , (0, 1)]
        var currentWord: String = ""
        var result = false
        
        func bt(_ index: Int, _ currentPosition: (Int, Int)) {
            if word == currentWord {
                result = true
                return
            }
            
            if index == word.count {
                return
            }
            
            for dict in dicts {
                let x = currentPosition.0
                let y = currentPosition.1
                let nx = x + dict.0
                let ny = y + dict.1
                
                if (nx >= 0 && nx < board.count) && (ny >= 0 && ny < board.first!.count) {
                    let wordIndex = String.Index(utf16Offset: index, in: word)
                    if board[nx][ny] == word[wordIndex] && checkBoard[nx][ny] == false {
                        currentWord += String(word[wordIndex])
                        checkBoard[nx][ny] = true
                        bt(index + 1, (nx,ny))
                        currentWord.removeLast()
                        checkBoard[nx][ny] = false
                    }
                }
            }
        }
        
        for i in 0..<board.count {
            if result {
                break
            }
            for j in 0..<board[i].count {
                let wordIndex = String.Index(utf16Offset: 0, in: word)
                if board[i][j] == word[wordIndex] {
                    checkBoard = [[Bool]](repeating: [Bool](repeating: false, count: board.first!.count), count: board.count)
                    checkBoard[i][j] = true
                    currentWord = String(word[wordIndex])
                    bt(1, (i, j))
                }
            }
        }
        
        return result
    }
}


//[["C","A","A"],
// ["A","A","A"],
// ["B","C","D"]]
