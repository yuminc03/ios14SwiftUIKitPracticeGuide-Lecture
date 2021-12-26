import UIKit

//initializer
//생성자
//init

class MyInfo {
    var name: String
    var myId: String
    var age: Int?
    var isAdult: Bool
    
    //designated initializer
    init(name: String, id: String) {
        self.name = name
        self.myId = id
        self.isAdult = ((age ?? 0) > 19) ? true : false
    }
    
//    init() {//멤버변수에 초기값이 있으면 init 해주지 않아도 된다
//        self.name = ""
//        self.myId = ""
//        self.isAdult = (age > 19) ? true : false
//    }
    
//    init(id: String) {
//        self.name = ""
//        self.myId = id
//        self.isAdult = (age > 19) ? true : false
//    }
    
    //convenience initializer //필수조건 - 다른 init을 반드시 실행해야 한다
    //designated init 파라미터 중 일부를 기본값으로 설정해서 초기화를 진행할 수 있다
    convenience init() {
        self.init(name: "", id: "")//init이 많을 때 효율적이다
    }

    convenience init(id: String) {
        self.init(name: "", id: id)
    }
    
}

var myInfo1 = MyInfo(name: "kim", id: "abcde")//MyInfo.init(name: id:)를 생략한 것
//var myInfo2 = MyInfo()
//var myInfo3 = MyInfo(id: "someId")

myInfo1.name //kim
myInfo1.myId //abcde


struct MyConfig {
    var conf: String
}

var myCon = MyConfig(conf: "") //struct는 자동으로 initializer가 만들어진다
