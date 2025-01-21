import UIKit

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    // terms를 Dictionary로 변경
    var termsDict: [String : Int] = [:]
    terms.forEach { it in
        let key = String(it.split(separator: " ")[0])
        let value = Int(it.split(separator: " ")[1])
        termsDict[key] = value
    }
    
    var answer = Array<Int>()
    
    // privacies 순회
    // 시작날짜를 정수로 변환 (2000.01.01이 0 부터 시작)
    for i in privacies.indices {
        let type = String(privacies[i].split(separator: " ")[1])
        let startDateInt = convertDateToInt(date: String(privacies[i].split(separator: " ")[0]))
        let endDateInt = startDateInt + (termsDict[type]! * 28)
        let todayInt = convertDateToInt(date: today)
        
        print(endDateInt)
        print(todayInt)
        if endDateInt <= todayInt {
            answer.append(i + 1)
        }
    }
    
    return answer
}

// 날짜를 정수로 변환하는 함수
func convertDateToInt(date:String) -> Int{
    var year = Int(date.split(separator: ".")[0])!
    var month = Int(date.split(separator: ".")[1])!
    var day = Int(date.split(separator: ".")[2])! - 1
    
    let yearInt = 336 * (year - 2000)
    let monthInt = 28 * (month)
    let result = day + monthInt + yearInt
    return result
}

// 정수를 날짜로 변환하는 함수
func convertIntToDate(dateInt: inout Int) -> String{
    if dateInt == 0 {
        return "2000.01.01"
    }
    
    var result = ""
    let yearStr = "\(2000 + (dateInt / 336))"
    dateInt = dateInt % 336
    
    var monthStr = 1 + (dateInt / 28) >= 10 ? "\(1 + (dateInt / 28))" : "0\(1 + (dateInt / 28))"
    dateInt = dateInt % 12
    
    result.appending(yearStr).appending(monthStr).appending("\(dateInt)")
    return result
}

let result = solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"])
print("최종정답 : \(result)")
