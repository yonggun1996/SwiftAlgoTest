import UIKit

/*
 프로그래머스 Lv1 카드뭉치
 https://school.programmers.co.kr/learn/courses/30/lessons/159994
 */

// 원하는 카드 뭉치에서 카드를 순서대로 한 장씩 사용합니다.
// 한 번 사용한 카드는 다시 사용할 수 없습니다.
// 카드를 사용하지 않고 다음 카드로 넘어갈 수 없습니다. (카드를 무조건 사용해야 한다는 뜻)
// 기존에 주어진 카드 뭉치의 단어 순서는 바꿀 수 없습니다.

// 문자열 배열 card1,2
// 원하는 단어 goal
func solution(_ cards1:[String], _ cards2:[String], _ goal:[String]) -> String {
    var answer = "Yes"
    var pt1 = 0
    var pt2 = 0
    
    for word in goal {
        var word1 = ""
        if pt1 < cards1.count {
            word1 = cards1[pt1]
        }
        
        var word2 = ""
        if pt2 < cards2.count {
            word2 = cards2[pt2]
        }
        
        if word1 == word {
            pt1 += 1
        } else if word2 == word {
            pt2 += 1
        } else {
            answer = "No"
            break
        }
    }
    return answer
}

let result = solution(["i", "water", "drink"], ["want", "to"], ["i", "want", "to", "drink", "water"])
print(result)
