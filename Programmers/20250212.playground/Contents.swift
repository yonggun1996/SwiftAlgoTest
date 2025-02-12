import UIKit

func solution(_ schedules:[Int], _ timelogs:[[Int]], _ startday:Int) -> Int {
    var answer = 0
    
    for i in schedules.indices {
        var dayNum = startday
        var giftFlag = true
        var flagTime = getFlagTime(beforeTime: schedules[i])
        
        for j in 0...6 {
            if dayNum == 6 {
                dayNum += 1
            } else if dayNum == 7 {
                dayNum = 1
            } else {
                if timelogs[i][j] > flagTime {
                    giftFlag = false
                    break
                }
                dayNum += 1
            }
        }
        
        if giftFlag {
            answer += 1
        }
    }
    
    return answer
}

func getFlagTime(beforeTime: Int) -> Int {
    var afterTime = String(beforeTime + 10).compactMap{ $0.wholeNumberValue }
    if afterTime.count == 3 {
        afterTime.insert(0, at: 0)
    }
    
    if afterTime[2] == 6 {
        afterTime[2] = 0
        afterTime[1] += 1
        
        if afterTime[0] == 2 && afterTime[1] == 4 {
            afterTime[0] = 0
            afterTime[1] = 0
        }
    }
    
    var newAfter = (afterTime[0] * 1000) + (afterTime[1] * 100) + (afterTime[2] * 10) + afterTime[3]
    return newAfter
}

let result = solution([700, 800, 1100], [[710, 2359, 1050, 700, 650, 631, 659], [800, 801, 805, 800, 759, 810, 809], [1105, 1001, 1002, 600, 1059, 1001, 1100]], 5)

print(result)
