import UIKit

/*
 프로그래머스 Lv1 카드뭉치
 https://school.programmers.co.kr/learn/courses/30/lessons/159994
 */

func solution(_ wallpaper:[String]) -> [Int] {
    // 순회를 하면서 가장 왼쪽 상단과 가장 오른쪽 하단의 좌표를 파악한다
    var lux = 51
    var luy = 51
    var rdx = -1
    var rdy = -1
    
    for i in wallpaper.indices {
        let displayLine = Array(wallpaper[i])
        for j in displayLine.indices {
            if displayLine[j] == "#" {
                lux = min(lux, i)
                luy = min(luy, j)
                rdx = max(rdx, i + 1)
                rdy = max(rdy, j + 1)
            }
        }
    }
    
    return [lux, luy, rdx, rdy]
}

let answer = solution(["...", "###","..."])
print(answer)
