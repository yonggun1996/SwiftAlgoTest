import UIKit

func solution(_ book_time:[[String]]) -> Int {
    var size = 24*60
    var checkArr = Array(repeating: 0, count: size)
    var intArr:[[Int]] = []
    
    book_time.forEach { it in
        let startTime = it[0]
        let endTime = it[1]
        
        let startIdx = getIdx(time: startTime)
        var endIdx = getIdx(time: endTime) + 10
        
        intArr.append([startIdx, endIdx])
    }
    
    intArr.sort {
        $0[0] > $1[0]
    }
    
    intArr.forEach { it in
        let startTime = it[0]
        var endTime = it[1]
        
        if endTime >= size {
            endTime -= size
            checkArr[0] = 1
        }
        
        checkArr[startTime] += 1
        checkArr[endTime] -= 1
    }
    
    for i in 0 ..< size - 1 {
        checkArr[i + 1] += checkArr[i]
    }
    
    let answer = checkArr.max()!
    return answer
}

func getIdx(time: String) -> Int {
    let timeArr = time.split(separator: ":")
    var idx = Int(timeArr[0])! * 60 + Int(timeArr[1])!
    return idx
}

let result = solution([["23:50","23:59"],["00:00","00:30"]])

print(result)
