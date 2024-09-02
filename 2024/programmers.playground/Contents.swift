import Foundation

//let inputRoute1 = ["E 2","S 2","W 1"]
//
//for route in inputRoute1 {
//    let command = route.split(separator: " ")
//    print(command)
//}


let inputPark1 = ["SOO","OOO","OOO"]

let path = inputPark1.enumerated().flatMap{i, row in row.enumerated().compactMap { j, char in
     char == "S" ? (i,j) : nil
}}

var (row, column) = path[0]
print(inputPark1[row][column])


let park = ["SOO","OOO","OOO"]
if let (currentRow, currentColumn) = park
    .enumerated()
    .flatMap { i, row in
        row.enumerated()
            .compactMap { j, char in
                char == "S" ? (i,j) : nil
            }
    }.first {
    print(currentRow, currentColumn)  // 출력: 0 0
}
