import UIKit

/*
 프로그래머스 Lv1 덧칠하기
 https://school.programmers.co.kr/learn/courses/30/lessons/161989?language=swift
 */

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var answer = 0
    var blankArray = Array(section.reversed())// 칠해지지 않은 구간을 큐로 보이는 배열로 세팅

    while !blankArray.isEmpty {
        let idx = blankArray.last!// 칠해지지 않은 부분을 하나씩 가져옴
        
        var start = idx
        if idx + m - 1 > n {
            start = n - m + 1
        }
        var end = start + m - 1
        
        while !blankArray.isEmpty && blankArray.last! >= start && blankArray.last! <= end {
            blankArray.removeLast() // 시작구간부터 종료구간까지 해당되면 큐에서 빼냄
        }
        answer += 1 // 색칠을 마치면 변수 증가
    }
    
    return answer
}


let result = solution(8, 4, [2,3,6])
print(result)
