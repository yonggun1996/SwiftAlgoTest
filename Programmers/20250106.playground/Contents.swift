import UIKit

//로봇 강아지가 해당 명령을 무시하고 다음 명령을 수행할 수 있는 조건
//주어진 방향으로 이동할 때 공원을 벗어나는지 확인합니다.
//주어진 방향으로 이동 중 장애물을 만나는지 확인합니다.

var x = 0 // 수직좌표
var y = 0 // 수평좌표
var map : [[Character]] = []

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    
    map = park.map { Array($0) }
    
    for i in 0..<map.count {
        for j in 0..<map[0].count {
            if map[i][j] == "S" {
                x = i
                y = j
                map[i][j] = "O"
            }
        }
    }
    
    routes.forEach{ route in
        let routeArr = route.split(separator: " ")
        let op = routeArr[0]
        let moveCnt = Int(routeArr[1]) ?? 0
        
        if op == "N" {
            moveNorth(cnt: moveCnt)
        } else if op == "S" {
            moveSouth(cnt: moveCnt)
        } else if op == "E" {
            moveEast(cnt: moveCnt)
        } else if op == "W" {
            moveWest(cnt: moveCnt)
        }
    }
    
    return [x,y]
}

func moveNorth(cnt: Int) {
    var newx = x
    var isChange = true
    for i in 0 ..< cnt {
        // 위에가 벽이거나 장애물일경우
        if newx - 1 < 0 || map[newx - 1][y] == "X" {
            isChange = false
            break
        }
        
        newx -= 1
    }
    
    if isChange {
        x = newx
    }
}

func moveSouth(cnt: Int) {
    var newx = x
    var isChange = true
    for i in 0 ..< cnt {
        // 아래가 벽이거나 장애물일 경우
        if newx + 1 >= map.count || map[newx + 1][y] == "X" {
            isChange = false
            break
        }
        
        newx += 1
    }
    
    if isChange {
        x = newx
    }
}

func moveEast(cnt: Int) {
    var newy = y
    var isChange = true
    for i in 0 ..< cnt {
        // 위에가 벽일경우
        if newy + 1 >= map[0].count || map[x][newy + 1] == "X" {
            isChange = false
            break
        }
        
        newy += 1
    }
    
    if isChange {
        y = newy
    }
}

func moveWest(cnt: Int) {
    var newy = y
    var isChange = true
    for i in 0 ..< cnt {
        // 위에가 벽일경우
        if newy - 1 < 0 || map[x][newy - 1] == "X" {
            isChange = false
            break
        }
        
        newy -= 1
    }
    
    if isChange {
        y = newy
    }
}

let result = solution(["OSO", "OOO", "OXO", "OOO"], ["E 2", "S 3", "W 2"])
print(result)
