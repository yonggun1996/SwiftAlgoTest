import UIKit

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    // 사과점수 내림차순 정렬
    let newScore:[Int] = score.sorted().reversed()
    
    // m개씩 묶어서 m번째 원소가 최소 점수
    var answer = 0
    var idx = m - 1
    while idx < newScore.count {
        answer += newScore[idx] * m
        idx += m
    }
    
    return answer
}

let result = solution(5, 7, [3,4,5,2,4,3,2,3,4,3,2,2,4,3,2,2,3,4,2,1,2,1,1,1,1,3])
print(result)
