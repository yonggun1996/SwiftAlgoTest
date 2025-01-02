import UIKit

/*
 프로그래머스 Lv1 추억점수
 https://school.programmers.co.kr/learn/courses/30/lessons/176963
 */

// name : 그리워하는 사람의 이름을 담은 문자열 배열
// yearning : 사람별 그리움점수
// photo : 사진에 찍힌 인물

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var scoreDict: [String:Int] = [:]
    
    for i in 0...name.count-1 {
        scoreDict[name[i]] = yearning[i]
    }
    
    var answer: [Int] = []
    for photoPeople in photo {
        var score = 0
        for people in photoPeople {
            score += scoreDict[people] ?? 0
        }
        answer.append(score)
    }
    
    return answer
}

let _name = ["may", "kein", "kain", "radi"]
let _yearning = [5, 10, 1, 3]
let _photo = [["may", "kein", "kain", "radi"],["may", "kein", "brin", "deny"], ["kon", "kain", "may", "coni"]]
let answer = solution(_name, _yearning, _photo)

print(answer)
