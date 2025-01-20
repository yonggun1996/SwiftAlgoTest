import UIKit

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    // skip에 나오는 알파벳은 HashSet에 저장
    var hashSet = Set<String>()
    Array(skip).forEach { char in
        hashSet.insert(String(char))
    }
    
    let charDictionary = [
        "a" : 0,"b" : 1,"c" : 2,"d" : 3,"e" : 4,
        "f" : 5,"g" : 6,"h" : 7,"i" : 8,"j" : 9,
        "k" : 10,"l" : 11,"m" : 12,"n" : 13,"o" : 14,
        "p" : 15,"q" : 16,"r" : 17,"s" : 18,"t" : 19,
        "u" : 20,"v" : 21,"w" : 22,"x" : 23,"y" : 24,"z" : 25
    ]
    
    let charArray = [
        "a","b","c","d","e",
        "f","g","h","i","j",
        "k","l","m","n","o",
        "p","q","r","s","t",
        "u","v","w","x","y","z"
    ]
    
    var answer = ""
    
    // s문자열을 순회해서 index만큼 늘린다
    // 이 때 'z'까지 돌면 다시 a를 조회해야한다
    Array(s).forEach { char in
        var cnt = 0
        var i = charDictionary[String(char)]!
        
        while cnt < index {
            i += 1
            if i == 26 {
                i = 0
            }
            
            if !hashSet.contains(charArray[i]) {
                cnt += 1
            }
        }
        
        answer += charArray[i]
    }
    
    return answer
}

let result = solution("aukks", "wbqd", 5)
print(result)
