import UIKit

func solution(_ s:String) -> [Int] {
    var map: [String : Int] = [:]
    var strArr = Array(s)
    
    var answer: [Int] = []
    
    for i in strArr.indices {
        answer.append(-1)
        if map[String(strArr[i])] != nil {
            answer.removeLast()
            answer.append(i - map[String(strArr[i])]!)
        }
        map[String(strArr[i])] = i
    }
    
    return answer
}

let result = solution("banana")
print("result : \(result)")
