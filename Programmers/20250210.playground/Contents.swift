import UIKit

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    // 내림차준 정렬 & removeLast
    var array: [Int] = []
    var answer: [Int] = []
    for i in score.indices {
        array.append(score[i])
        var newArray = Array(array.sorted().reversed())
        if newArray.count > k {
            newArray.removeLast()
        }
        answer.append(newArray.last!)
        array = newArray
    }
    return answer
}

let result = solution(4, [0, 300, 40, 300, 20, 70, 150, 50, 500, 1000])
print(result)

