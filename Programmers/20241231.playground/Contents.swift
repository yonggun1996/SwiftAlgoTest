import UIKit

/*
 프로그래머스 Lv1 달리기 경주 문제
 https://school.programmers.co.kr/learn/courses/30/lessons/178871
 */

// players : 선수들의 이름이 1등부터 현재 등수 순서대로 담긴 문자열 배열
// callings : 해설진이 부른 이름을 담은 문자열 배열
// callings에 따라 최종 결과를 반환하는 문제

var result: [String]? = nil // 최종 정답이 될 배열
var playerData: [String:Int] = [:] // 각 플레이어의 순위를 저장한 Dictionary

func solution(_ players:[String], _ callings:[String]) -> [String] {
    
    result = players
    
    // 각 플레이어의 순위를 저장하는 로직
    var rank = 0
    for player in players {
        playerData[player] = rank
        rank += 1
    }
    
    // 호명된 선수와 앞의 선수를 바꾸는 과정
    for callPlayer in callings {
        var nowRank = playerData[callPlayer]
        var changeRank = nowRank! - 1
        swap(rank1: nowRank!, rank2: changeRank)
    }
    
    return result!
}

// 값을 실제로 바꾸는 함수
// 현재 진행상황과 각 선수의 순위를 바꿈
func swap (rank1: Int, rank2: Int) {
    var player1 = result![rank1]
    result![rank1] = result![rank2]
    result![rank2] = player1
    
    playerData[result![rank1]] = rank1
    playerData[result![rank2]] = rank2
}

let answer = solution(["mumu", "soe", "poe", "kai", "mine"], ["kai", "kai", "mine", "mine"])
print(answer)
