//
//  LV2_파일명정렬.swift
//  BakJoon
//
//  Created by 김성준 on 9/27/24.
//

import Foundation

struct LV2_파일명정렬 {
    // print 짜증나서 GPT 사용함(귀찮음 )
    // func solution(_ files:[String]) -> [String] {
    // 문자와 숫자를 분리한다.
    // 문자 -> 숫자 순으로 정렬한다
    
    //    return files.sorted {
    //        // Number의 인덱스를 구한다
    //        var numberIndexs: [[Int]] = []
    //        var numberStartIndex = -1
    //        var numberEndIndex = -1
    //
    //        for (index, char) in $0.enumerated() {
    //            if numberStartIndex == -1, char.isNumber {
    //                numberStartIndex = index
    //            } else if numberStartIndex != -1, !char.isNumber {
    //                numberEndIndex = index - 1
    //                break
    //            }
    //        }
    //
    //        if numberEndIndex == -1 {
    //            numberEndIndex = $0.count - 1
    //        }
    //
    //        numberIndexs.append([numberStartIndex, numberEndIndex])
    //        numberStartIndex = -1
    //        numberEndIndex = -1
    //
    //        for (index, char) in $1.enumerated() {
    //            if numberStartIndex == -1, char.isNumber {
    //                numberStartIndex = index
    //            } else if numberStartIndex != -1, !char.isNumber {
    //                numberEndIndex = index - 1
    //                break
    //            }
    //        }
    //
    //        if numberEndIndex == -1 {
    //            numberEndIndex = $0.count - 1
    //        }
    //
    //        numberIndexs.append([numberStartIndex, numberEndIndex])
    //        // 문자와 숫자가 같다면 입력 순서대로 정렬하게 된다.
    //        // Number의 시작인덱스 전 인덱스는 Head부분이다. 0인 경우는 없다.
    //        // Head부분을 비교한다.
    //        if Array(String($0).lowercased())[0..<numberIndexs[0][0]] == Array(String($1).lowercased())[0..<numberIndexs[1][0]] {
    //            return Int(String($0)[numberIndexs[0][0]...numberIndexs[0][1]]) < Int(String($1)[numberIndexs[1][0]...numberIndexs[1][1]])
    //        } else {
    //            return Array(String($0).lowercased())[0..<numberIndexs[0][0]] < Array(String($1).lowercased())[0..<numberIndexs[1][0]]
    //        }
    //
    //    }
    //}
    
    func solution(_ files:[String]) -> [String] {
        
        // 파일명을 HEAD, NUMBER, TAIL로 나누는 함수
        func splitFile(_ file: String) -> (String, Int, String) {
            var head = ""
            var number = ""
            var tail = ""
            var isNumberPart = false
            
            for char in file {
                if char.isNumber && !isNumberPart {
                    // 숫자가 시작되는 순간
                    isNumberPart = true
                }
                
                if !isNumberPart {
                    head.append(char)
                } else if char.isNumber && number.count < 5 {
                    // 최대 5자리 숫자를 처리
                    number.append(char)
                } else {
                    // 숫자 이후는 tail
                    tail.append(char)
                }
            }
            
            // 숫자는 Int로 변환 (앞의 0을 무시)
            return (head, Int(number) ?? 0, tail)
        }
        
        // 실제 정렬
        return files.sorted {
            let (head0, num0, _) = splitFile($0)
            let (head1, num1, _) = splitFile($1)
            
            // HEAD 비교 (대소문자 구분 없이)
            if head0.lowercased() != head1.lowercased() {
                return head0.lowercased() < head1.lowercased()
            }
            
            // NUMBER 비교
            if num0 != num1 {
                return num0 < num1
            }
            
            // 원래 순서 유지
            return false
        }
    }
}
