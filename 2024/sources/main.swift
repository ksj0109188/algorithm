//
//  main.swift
//  BakJoon
//
//  Created by 김성준 on 2023/09/05.
//
import Foundation
import Combine

// 733_FloodFill
//print(floodFill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2))

// 559
//let node1 = Node([1,nil,2,3,4,5,nil,nil,6,7,nil,8,nil,9,10,nil,nil,11,nil,12,nil,13,nil,nil,14])
//let node1 = Node([44])
//print(maxDepth(node1))

// 783.
//let node = TreeNode([1,0,48,nil,nil,12,49])

// 965
//let node = TreeNode([1,1,1,1,1,nil,1])
//
//print(isUnivalTree(node))

// 993
//let node = TreeNode([1,2,3,4,5,6,7,8])
//print(isCousins(node, 2, 6))

// 116
//let node = ConnecTreeNode([-1,0,1,2,3,4,5,6,7,8,9,10,11,12,13])
//print(connect(node))

// 119
//let node = TreeNode([1,2,3,4,5,6,7,8])
//print(isCousins(node, 2, 6))

// 117
//let node = ConnecTreeNode([1,2,3,4,5,nil,7])
//print(connect2(node))

// 130 (pause)
//var inputData = [["O","X","X","O","X"],["X","O","O","X","O"],["X","O","X","O","X"],["O","X","O","O","O"],["X","X","O","X","O"]]
//solve(&inputData)

// 207
//print(canFinish(2, [[1,0], [0,1]] ))

// 1
//print(twoSum([1,2,4], 6))

//print(romanToInt("MCMXCIV"))

// 2024/02/07
// Priroirty Queue easy
// 2099
//print(maxSubsequence([2,1,3,3], 2))

//var nums = [5,2,4,1,3,6,0]

//print(Solution215().findKthLargest(nums, 4))

// 373
// 2/21 11:40
//var nums1 = [0,0,0,0,0,2,2,2,2]
//var nums2 = [-3,22,35,56,76]
//var k = 22
//print(Solution373().kSmallestPairs(nums1, nums2, k))

// 502(2/23 12:25)
//let k = 2
//let w = 1
//let profits = [3,5,10]
//let capital = [0,0,0]
//
//print(Solution502().findMaximizedCapital(k, w, profits, capital))

// 295(2/25)
//
//var medianfinder = MedianFinder()
//
//print(medianfinder.findMedian())
//medianfinder.addNum(-1)
//print(medianfinder.findMedian())
//medianfinder.addNum(-2)
//print(medianfinder.findMedian())
//medianfinder.addNum(-3)
//print(medianfinder.findMedian())
//medianfinder.addNum(-4)
//print(medianfinder.findMedian())
//medianfinder.addNum(-5)
//print(medianfinder.findMedian())

// 977(3/2)
//let nums = [-5,-3,-2,-1]
//print(Solution977().sortedSquares(nums))


// 743(3/4)
//let times = [[2,1,1],[2,3,1],[3,4,1]]
//let n = 4
//let k = 2
//print(Solution743().networkDelayTime(times, n, k))
//print(Solution743_minimumRuntime().networkDelayTime(times, n, k))

// FiboNacci
//print(Soltion_509().fib(0))

// 3/10
//let coins = [1]
//let amount = 1
//print(Solution322().coinChange(coins, amount))

// 3/10
//print(grid_paths(n: 18, m: 6))

// 3/10
//print(Solution70().climbStairs(2))

// 3/10
//print(Solution118().generate(5))

// 3/12
//print(Naver02().solve(k: 7))
//print(Naver03().solve(k: 7))
//print(Naver03().solve(k: 7).count)

// 3/12
//print(Solution119().getRow(3))

// 3/14 - DP
//let input1 = "babad"
//let input2 = "cbbd"
//
//print(Solution5().longestPalindrome("babad"))

// 3/15 - Implemention
//print(bakjun1015().solve())

// 3/16
//print(baekjun1333().solve1())

// 3/17
//let nums = [3,2,1,0,4]
//print(Solution55().canJump(nums))
//print(Solution198().rob([1,2,3,1]))
//print(Solution198.ImprovedSolution().rob([1,2,3,1]))



// 예제 실행
//print(solution_Programmers2_icon().solution([[40, 10000], [25, 10000]], [7000, 9000])) // 예상 결과: [1, 5400]
//print(solution([[40, 2900], [23, 10000], [11, 5200], [5, 5900], [40, 3100], [27, 9200], [32, 6900]], [1300, 1500, 1600, 4900])) // 예상 결과: [4, 13860]


//baekjun10451().solve()


//3/25

//Programmers_lv2_짝지어().solution("cdcd")

// 3/ 27
//print(Lv2_영어끝말잇기().solution(2, ["hello", "one", "even", "never", "now", "world", "draw"]))
//print(LV2_N개최소공배수().solution([2,6,8,14]))
//print(LV2_N개최소공배수().solution([3,7]))
//print(LV2_N개최소공배수().solution([1,5]))

// 3/29
//LV3_깊이너비우선탐색().solution(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]])


// 3/30
//print(LV2귤고르기().solution(6, [1, 3, 2, 5, 4, 5, 2, 3]))
//print(LV2귤고르기().solution(7, [1, 3, 2, 5, 4, 5, 2, 3]))
//print(LV2귤고르기().solution(2, [1, 1, 1, 1, 2, 2, 2, 3]))

// 4/1
//print(LV2연속부분수열합().solution([7,9,1,1,4]))

// 4/2
//print(LV2괄호회전하기().solution("[](){}"))
//print(LV2괄호회전하기().solution("[](){}"))
//print(LV2괄호회전하기().solution("[({})]"))
//print(LV2_할인행사().solution(["banana", "apple", "rice", "pork", "pot"], [3, 2, 2, 2, 1], ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]))


// 4/3
//print(LV3_단어변환().solution("hit", "cog", ["hot", "dot", "dog", "lot", "log", "cog"]))
//print(LV2_배열자르기().solution(1, 2, 5))
//print(LV2_배열자르기().solution(2, 2, 5))
//print(LV2_배열자르기().solution(3, 2, 5))
//print(LV2_배열자르기().solution(4, 7, 14))

// 4/4
//print(LV2_HIndex().solution([1, 2, 4, 5, 6]))
//print(LV2_HIndex().solution([3, 0, 6, 1, 5]))

// 4/12
//print(LV2_요격시스템().solution([[4,5],[4,8],[10,14],[11,13],[5,12],[3,7],[1,4]]))
//print(LV2_행렬곱셈().solution([[2, 3, 2], [4, 2, 4], [3, 1, 4]], [[5, 4, 3], [2, 4, 1], [3, 1, 1]]))
//print(LV2_행렬곱셈().solution([[1, 4], [3, 2], [4, 1]], [[3, 3], [3, 3]]))


// 4/15
/** 벨만포드 알고리즘 테스트
 // 0:S / 1:E / 2:A / 3:D / 4:B / 5:C
 let graph = [(u: 0, v: 1, weight: 8), (u: 0, v: 2, weight: 10),
 (u: 1, v: 3, weight: 1),
 (u: 2, v: 5, weight: 2),
 (u: 3, v: 2, weight: -4), (u: 3, v: 5, weight: -1),
 (u: 4, v: 2, weight: 1),
 (u: 5, v: 4, weight: -2)
 ]
 let vertices = 6
 let source = 0x
 
 let distances = BellmanFord().bellmanFord(graph: graph, vertices: vertices, source: source)
 
 if !distances.isEmpty {
 for (index, distance) in distances.enumerated() {
 print("Distance from node \(source) to node \(index) is \(distance)")
 }
 }
 */

//print(LV2_의상().solution([["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]))
//print(LV2_의상().solution([["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]]))

// 4/17
//print(LV2_소수찾기().solution("123"))

// 4/18
//print(LV2_전력망둘로나누기().solution(9, [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]]))

// 4/19
//print(LV2_피로도().solution(80, [[80,20],[50,40],[30,10]]))

// 4/21
//print(LV2_모음사전().solution("AAAAE"))
//print(LV2_모음사전().solution("AAAE"))
//print(LV2_모음사전().solution("I"))
//print(LV2_모음사전().solution("UUUUU"))
//print(LV2_모음사전().solution("EIO"))

// 4/22
//print(LV2_기능개발().solution([93, 30, 55], [1, 30, 5]))
//print(LV2_기능개발().solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1]))
//print(LV2_뒤에있는큰수찾기().solution([2, 3, 3, 5]))
//print(LV2_뒤에있는큰수찾기().solution([9, 1, 5, 3, 6, 2]))

// 4/23
//print(LV2_숫자변환하기().solution2(10, 40, 5))
//print(LV2_숫자변환하기().solution2(10, 40, 30))
//print(LV2_숫자변환하기().solution2(2, 5, 4))

//print(LV2_땅따먹기().solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]]))
// 4/24
//print(LV2_프로세스().solution([2, 1, 3, 2], 2))
//print(LV2_프로세스().solution([1, 1, 9, 1, 1, 1], 0))


// 4/27
//print(LV2_택배상자().solution([4, 3, 1, 2, 5]))

// 5/2
//print(LV2_삼각달팽이().solution(5))
//print(LV2_방문길이().solution("ULURRDLLU"))
//print(LV2_방문길이().solution("LULLLLLLU"))


// 5/8
//print(Medium_Letter_Solution().letterCombinations("23"))

// 5/11
//print(Medium_Subsets().subsets([1, 2, 3]))

// 5/12
//print(Medium_permutations().permute([1,2,3]))
//print(Medium_Combination().combine(4, 2))
//print(Medium_CombinationSum().combinationSum([2,3,6,7], 7))
//print(Medium_wordSearch().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED"))
//print(Medium_wordSearch().exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE"))
//print(Medium_wordSearch().exist([["C","A","A"],["A","A","A"],["B","C","D"]], "AAB"))



// 5/13
//print(danawha_01().solution("execute"))
//print(danawha_03().solution(4, [1000000,490000, 700000, 290000]))
//print(danawha_03().solution(6, [30000,70000, 10000]))
//danawha_04().solution(4, 5, 5, 10, [])
//print(danawha_05().solution(30, 10, ["1 enter", "5 enter", "8 cancel 0", "22 enter", "24 cancel 2", "27 enter" ])) //[1,3 출력되야하고]
//print(danawha_05().solution(23, 5, ["2 enter", "4 enter", "12 enter", "14 cancel 2", "21 enter" ])) //[0,1] 출력


// 5/30

//print(Solution_generateParenthesis().generateParenthesis(3))

// 6/3
//print(Solution_NQueens2().totalNQueens(4))

//let n = 5
//var possibleList = Array(repeating: [Bool](repeating: false, count: n), count: n)
//print(possibleList)
//
//let i = 2
//let newValues =  Array(repeating: [Bool](repeating: true, count: n), count: n - i)
//
//possibleList.replaceSubrange(i..<n, with: newValues)
//
//print(possibleList)

// 6/7
//let tickets1 = [["ICN", "JFK"], ["HND", "IAD"], ["JFK", "HND"]]
//let tickets2 = [["ICN", "SFO"], ["ICN", "ATL"], ["SFO", "ATL"], ["ATL", "ICN"], ["ATL", "SFO"]]

//print(LV3_여행경로().solution(tickets2))
//print(baekjun1158().solution1())
//print(baekjun1158().solution2())


// 6/10
//print(Solution200().numIslands([["1","1","0","0","0"],["1","1","0","0","0"],["0","0","1","0","0"],["0","0","0","1","1"]]))

// 6/11
//var Node1 = Node(1)
//Node1.neighbors = [Node(2), Node(3)]
//SolutionCloneGraph().cloneGraph(Node1)

// 6/17
//let equations = [["a","b"],["b","c"]]
//let values = [2.0,3.0]
//let queries = [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]
//
//print(EvaluateDivision().calcEquation(equations, values, queries))

// 6/18
//let numCourses = 3
//let prerequisites:[[Int]] = [[0,1],[0,2],[1,2]]
//print(0...numCourses)
//print(CourseSchedule2().findOrder(numCourses, prerequisites))
//print(LV3_가장먼노드().solution(6, [[3, 6], [4, 3], [3, 2], [1, 3], [1, 2],
//                                      [2, 4], [5, 2]]))

// 6/21
//let board = [[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,-1,-1,-1,-1,-1],[-1,35,-1,-1,13,-1],[-1,-1,-1,-1,-1,-1],[-1,15,-1,-1,-1,-1]]
//
//print(SnakesAndLadders().snakesAndLadders(board))
//print(ParallelCoursesII().minNumberOfSemesters(5, [[2,1],[3,1],[4,1],[1,5]], 2))

// 6/24
//print(Solution_롤케이크자르기().solution([1, 2, 1, 3, 1, 4, 1, 2]))
//print(CountSubArrSumOfX().soltion1(arr: [1, 3, 6, 5, 2, 7, 9], x: 9))
//let arr2 = [2, 4, 5, 7, 11, 15]
//let x2 = 15
//print(CountSubArrSumOfX().solution2(arr: arr2, x: x2))

//print(Soca().solution([1, 13, 15, 12, 3, 1, 10], 4))
//print(Soca().solution([0, 10, 0, 8,0 , 12], 1))
//print(Soca().solution([11, 3, 1, 6, 20, 7, 1, 0, 0], 6))
//print(Soca().solution2([0, 10, 0, 8,0 , 12], 1))
//print(Soca().solution2([1, 13, 15, 12, 3, 1, 10], 4))
//print(Soca().solution2([11, 3, 1, 6, 20, 7, 1, 0, 0], 6))
//print(LV2_2개이하로다른비트().solution([9]))

// 6/28
//print(Solution70().climbStairs(2))

//func Hyundai_solution() {
//    let n = 5
//    let k = 2
//    let m = 5
//
//    let items = [[4,5], [3,4], [2, 1], [5, 7], [1,1]] // 13
//    var usedSupplys: [Bool] = [Bool](repeating: false, count: items.count)
//
//    func dfs(_ list: [[Int]], _ currentWeight: Int, _ currentValue: Int, _ value: Int) -> Int {
//        if currentWeight > m {
//            return currentValue
//        }
//
//        let currentValue = currentValue + value
//        var result = 0
//
//        for item in list {
//            let w = item[0]
//            let v = item[1]
//
//            // 최대 값의 경로 인덱스를 저장해야 할거 같은데?
//            // 매 dfs마다 최대 값의 인덱스를 변경해줘야 한다면, 그 전에 있던 것들은 어떻게 해야할까?
//            // 2차원 배열을 활용하면 어떨까
//            result = max(result, dfs(currentWeight + w, currentValue, v))
//        }
//
//        return result
//    }
//
//    var returnValue = 0
//    var remainItems = items
//
//    for _ in 0..<k {
//        let removedItem = remainItems.removeFirst()
//        returnValue += dfs(remainItems, removedItem[0], removedItem[1], 0)
//    }
//
//}

//let n = 10
//let k = 3
//let n = 7
//let items = [[4,5], [5,7], [8,6], [5, 4], [3,4], [1,1], [3,3], [2,1], [7,8], [4,3]]

//Hyundai_solution()

// 7/1
//print(wordBreak("leetcode", ["leet", "code"]))  true
//print(Medium_wordBreak().wordBreak("applepenapple", ["apple", "pen"]))  //true
//print(Medium_wordBreak().wordBreak("catsandog", ["cats", "dog", "sand", "and", "cat"])) // false


//7/6
//let cities = ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]
//print(LV2_캐시().solution(0, cities))

// 7/8
//print(Unique_Paths().uniquePaths(3, 7))


// 7/9
//print(LV2_카카오개발자겨울인턴().solution("{{2},{2,1},{2,1,3},{2,1,3,4}}"))
//print(Medium_Longest_Common_Subsequence().longestCommonSubsequence("abcde", "ace"))  // 3
//print(Medium_Longest_Common_Subsequence().longestCommonSubsequence("abc", "abc"))  // 3
//print(Medium_Longest_Common_Subsequence().longestCommonSubsequence("abc", "def"))  // 0
//print(LV2_뉴스클러스터링().solution("ab+", "AAAA12"))


// 7/10
//N진수게임().solution(2, 4, 2, 1) // "0111"
//print(N진수게임().solution(16, 16, 2, 1)) // "02468ACE11111111"
//print(N진수게임().solution(16, 16, 2, 2)) // "13579BDF01234567"

// 7/10
//print(Medium_309().maxProfit([1,2,3,0,2]))
//print(Medium_309().maxProfit([999,2,3,0,2]))


// 7/15
//LV2_skillTree().solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"])

// 7/16
//print(LV2_가장큰수().solution([3, 30, 34, 51, 9])) // 9 51 34 3 30
//print(LV2_가장큰수().solution([3, 305, 34, 51, 9])) // 9 51 34 3 305
let arr2 = [
    [1, 1, 1, 1, 1, 1, 1, 1],
    [0, 1, 1, 1, 1, 1, 1, 1],
    [0, 0, 0, 0, 1, 1, 1, 1],
    [0, 1, 0, 0, 1, 1, 1, 1],
    [0, 0, 0, 0, 0, 0, 1, 1],
    [0, 0, 0, 0, 0, 0, 0, 1],
    [0, 0, 0, 0, 1, 0, 0, 1],
    [0, 0, 0, 0, 1, 1, 1, 1]
]
// 7/23
//print(LV2_쿼드압축().solution(arr2))

// 7/24
//let nums = [1,1,1,1,1]
//let target = 3
//
//print(TargetSum().findTargetSumWays(nums, target))

// 7/27
//print(마법의엘리베이터().solution2(226))

// 7/29
//print(LV2_과제진행하기().solution([["korean", "11:40", "30"], ["english", "12:10", "20"], ["math", "12:30", "40"]]))
//print(LV2_과제진행하기().solution([["science", "12:40", "50"], ["music", "12:20", "40"], ["history", "14:00", "30"], ["computer", "12:30", "100"]]))
//print(LV2_과제진행하기().solution([["aaa", "12:00", "20"], ["bbb", "12:10", "30"], ["ccc", "12:40", "10"]]))


//print(EvaluateDivision().calcEquation2([["a","b"],["b","c"],["bc","cd"]], [1.5,2.5,5.0], [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]))
//print(EvaluateDivision().calcEquation2([["a","b"],["b","c"]], [2.0,3.0], [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]))



//print(problem1().solve(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]))
//print(problem1().solve(5, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]))
//자동완성().solution(["word", "war", "warrior", "world"])

// 8/19
//print(LV3_이중우선순위큐().solution(["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333", "D -1", "D -1"]))

// 8/20 ~ 22
//print(LV2_K진수에서소수개수구하기().solution(1_000_000, 4))
//print(LV2_K진수에서소수개수구하기().solution(1_000_000, 4))
//print(LV2_K진수에서소수개수구하기().solution(4, 4))

//print(LV2_도넛과막대그래프().solution([[4, 11], [1, 12], [8, 3], [12, 7], [4, 2], [7, 11], [4, 8], [9, 6], [10, 11], [6, 10], [3, 5], [11, 1], [5, 3], [11, 9], [3, 8]]))
//print(LV2_도넛과막대그래프().solution([[2, 3], [4, 3], [1, 1], [2, 1]]))

// 8/27
//print(LV2_3차압축().solution("TOBEORNOTTOBEORTOBEORNOT"))

// 8/31
//print(InterLeavingString().isInterleave("a", "b", "ab"))

// 9/3
//print(LongestIncreasingPath().longestIncreasingPath([[9,9,4],[6,6,8],[2,1,1]]))
//print(LongestIncreasingPath().longestIncreasingPath([[3,4,5],[3,2,6],[2,2,1]]))

// 9/4
//Baekjoon_11659_구간합구하기4().main()

// 9/5
//baekjoon_11726_2n타일링().solution()

// 9/6
//baekjoon_1012_유기농배추().solution()

// 9/8
//Programmers_LV2_쿼드압축().solution([[1,1,0,0],[1,0,0,0],[1,0,0,1],[1,1,1,1]])
//Programmers_LV2_쿼드압축().solution([[1,1,1,1,1,1,1,1],[0,1,1,1,1,1,1,1],[0,0,0,0,1,1,1,1],[0,1,0,0,1,1,1,1],[0,0,0,0,0,0,1,1],[0,0,0,0,0,0,0,1],[0,0,0,0,1,0,0,1],[0,0,0,0,1,1,1,1]])
//Programmers_LV2_쿼드압축().solution([[1,1,0,0],[1,1,1,1],[1,1,1,1],[1,1,1,1]])

// 9/10
//baekjoon_1260_DFS와BFS().solution()
//Baekjoon_1927_MinHeap().solution()

// 9/11
//print(Hard115().numDistinct("rabbbit", "rabbit"))
//print(주차요금계산().solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]))
//print(주차요금계산().solution([120, 0, 60, 591], ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]))
//print(주차요금계산().solution([1, 461, 1, 10], ["00:00 1234 IN"]))

//색종이만들기().solution()

// 9/16
//ConnectedComponent().solution()
// 9/19
//TreesCutting().solution()
//SearchInsertPosition().searchInsert([1,3,5,6], 5)
//SearchInsertPosition().searchInsert([1,3,5,6], 2)
//SearchInsertPosition().searchInsert([1,3,5,6], 7)

// 9/20
//CompressPoint().solution()

// 9/24
//print(BurstBallons().maxCoins([3,1,5,8]))

// 9/27
//print(LV2_파일명정렬().solution(["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]))
//LV2_파일명정렬().solution(<#T##files: [String]##[String]#>)

// 9/28
//print(숨바꼭질().solution())
//print(쉬운최단거리().solution())
//print(회의실배정().solution())

// 10/1
//Z_recursive().solve()


//print(LV2_프렌즈4블록().solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"]))
//tomato1().solution()

//baekjoon_7569_tomato2().solution()

// 10 / 6
//baekjoon_AC().solution()

// 10/9

//LIS_Solution().lengthOfLIS_BinarySearch([10,9,2,5,3,7,101,18])
//LIS_Solution().lengthOfLIS_DP([10,9,2,5,3,7,101,18])

// 10/11
//N과M_2().solution()

// 10/12
//N과M_4().solution()
//N과M_5().solution()

// 10/13
//친구비().solution()

// 10/16
//_11053().solution2()
//C1001().solution(5, 8) // 2
//C1001().solution(4, 10) // 4
//C1001().solution(1, 2) // -1
//C1001().solution(10, 5) // 1
//C1001().solution(666666, 1_000_000_000) // 1

//print(C1001().imporveSolution(5, 8) )// 2
//print(C1001().imporveSolution(5, 9) )// 2
//print(C1001().imporveSolution(5, 10) )// 2
//print(C1001().imporveSolution(5, 11) )// 2
//print(C1001().imporveSolution(5, 12) )// 2
//print(C1001().imporveSolution(5, 13) )// 2
//print(C1001().imporveSolution(5, 14) )// 2
//print(C1001().imporveSolution(5, 15) )// 2
//print(C1001().imporveSolution(5, 16) )// 2
//var s1 = "011100"
//var s2 = "111"
//var s3 = "1111010101111"
//
//print(C1002().solution(&s1))
//print(C1002().solution(&s2))
//print(C1002().solution(&s3))
//print(C1002().solution2(&s1))
//print(C1002().solution2(&s2))
//print(C1002().solution2(&s3))

// 10/17
//트리의부모찾기_11725().solution()

// 10 / 18
//N과M_15663().solution()
//print(KMP().makeLPS(substring: "AAACAAAA"))
//print(KMP().makeLPS(substring: "abcbca"))

// 10 /19
//N과M12_15666().solution()

// 10/24
//RGB1149().solution()
//곱셈1629().solution()


// 10/25
//IntTriangle_1932().solution()
//TSP_2098().solution()
//TSP_2098_2().solution()


// 11/4
//mergeSortedArray().merge(<#T##nums1: &[Int]##[Int]#>, <#T##m: Int##Int#>, <#T##nums2: [Int]##[Int]#>, <#T##n: Int##Int#>)
// 11/5
//solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"])
//solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"])
//solution(6, 6, ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMM", "TMMTMM"])

// 11/6
//LV4_호텔방배정().solution(10, [1,3,4,1,3,1])


// 11/7
//트리순회_1991().solution()
//solution9465()

// 11/10
//트리순회_1991().solution()
//solution11660()
//LCS9251().solution()

// 11/20
//숨바꼭질13549().solve()

// 11/21
// 연구소_14502().solve()
//로봇청소기_14503().solve()

// 11/24
//평범한배낭_12865().solution()

// 11/26
//최단경로_1753().solution()

//11/29
//트리의지름_1967().solution()
//트리의지름2_1967().solution()
//12/1
//NQueen_9663().solution()

// 12/6
Ployd_11404().solution()
