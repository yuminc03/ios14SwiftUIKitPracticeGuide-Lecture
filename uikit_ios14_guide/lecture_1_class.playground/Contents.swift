import UIKit
import Security

//Class

class MyInfo {
    
    enum GenderType {
        case male
        case female
    }

    init(gender: GenderType) { //생성될 때 값 대입
        self.genderType = gender
    }
    
    private var genderType: GenderType
    var name = ""
    var age = 0
    
    func isAdult() -> Bool {
        if age > 19 {
            return true
        }
        return false
    }
}

//참조 (Class are reference type)
var myInfo = MyInfo(gender: .female)
myInfo.age = 20

var myInfo2 = myInfo
myInfo2.age = 100

var myInfo3 = myInfo2
myInfo3.age = 200

myInfo.age
myInfo3.age
myInfo2.age



//Class - Inheritance
//상속

//부모로 사용할 class를 만듦
class GameInfo {
    var homeScore = 0
    var awayScore =  0
    
    func presentScroe() -> String {
        return homeScore.description + ":" + awayScore.description.debugDescription
    }
}

class Soccer: GameInfo {
    var time = 0//더 필요한건 추가
}

class Baseball: GameInfo {
    override func presentScroe() -> String {
        return homeScore.description + " : " + awayScore.description
    }
    var round = 0
}

class Football: GameInfo {
    
}

let soccer = Soccer()
soccer.homeScore = 1
soccer.awayScore = 2
soccer.time = 5
soccer.presentScroe()

let baseball = Baseball()
baseball.homeScore = 3
baseball.awayScore = 2

