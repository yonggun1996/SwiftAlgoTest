import UIKit

func solution(_ keymap:[String], _ targets:[String]) -> [Int] {
    var answer = Array(repeating: 0, count: targets.count)
    var charKey: [Character:Int] = [:]
    
    // 각 알파벳이 가장 적게 쳤을때 표현할 수 있는 수
    for key in keymap {
        let keyArray = Array(key)
        
        for i in 0..<key.count {
            if charKey.keys.contains(keyArray[i]) {
                if i + 1 < charKey[keyArray[i]]! {
                    charKey[keyArray[i]] = i + 1
                }
            } else {
                charKey[keyArray[i]] = i + 1
            }
        }
    }
    
    // 문자열별로 가장 짧은 타자를 기록하는 로직
    for i in 0..<targets.count {
        let targetArray = Array(targets[i])
        var count = 0
        var flag = true
        
        for char in targetArray {
            if !charKey.keys.contains(char) {
                // 존재하지 않는 경우는 loop문을 빠져나가고 -1로 설정
                flag = false
                break
            }
            
            count += charKey[char] ?? 0
        }
        
        if flag {
            answer[i] = count
        } else {
            answer[i] = -1
        }
    }
    
    return answer
}

let result = solution(["AA"], ["ABCD","AABB","B"])
print(result)
