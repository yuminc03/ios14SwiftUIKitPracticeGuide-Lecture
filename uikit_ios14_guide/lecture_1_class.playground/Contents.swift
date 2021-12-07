import UIKit

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
class Soccer {
    var homeScore = 0
    var awayScroe =  0
    func presentScroe() -> String{
        return homeScore.description + " " + awayScroe.description.debugDescription
    }
    
}
let score = soccer: {
}

let aQfoo
-div oc]]
let R\
