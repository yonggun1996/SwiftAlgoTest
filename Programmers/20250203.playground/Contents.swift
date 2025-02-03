import UIKit

func solution(_ ingredient:[Int]) -> Int {
    var answer = 0
    
    // 스택에 값 넣기
    // 4개 이상이면 4개 꺼내서 "1321" 순서인지 확인
    // 맞으면 스택에서 answer 1 추가
    
    var array: [String] = []
    for i in ingredient.indices {
        array.append(String(ingredient[i]))
        
        if array.count >= 4 {
            var str = ""
            
            for i in 1...4 {
                str += array.removeLast()
            }
            
            if str == "1321" {
                answer += 1
                continue
            }
            
            let strArr = Array(str)
            for i in strArr.reversed() {
                array.append(String(i))
            }
        }
    }
    
    return answer
}

let result = solution([2, 1, 1, 2, 3, 1, 2, 3, 1])
print(result)
