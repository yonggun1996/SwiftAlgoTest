import UIKit

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var numberArr = Array(repeating: 0, count: number + 1)
    if number == 1 {
        return 1
    }
    numberArr[0] = 0
    numberArr[1] = 1
    
    // 1. 약수 개수 구하기
    for i in 2...number {
        let sqrtNumber = Int(sqrt(Double(i)))
        var set = Set<Int>()
        
        for j in 1...sqrtNumber {
            if i % j == 0 {
                set.insert(j)
                set.insert(i / j)
            }
        }
        
        numberArr[i] = set.count
    }
    
    // 2. 약수 for문 돌면서 limit보다 큰 수는 power로 변경
    for i in 1...number {
        if numberArr[i] > limit {
            numberArr[i] = power
        }
    }
    print(numberArr)
    
    // 3. 배열의 합 반환
    return numberArr.reduce(0, +)
}

let result = solution(100000, 3, 2)
print(result)
