import UIKit

//Closure (클로저)

// func과 유사
//차이점
//closure - 이름이 없다

//function
func myScore(a: Int) -> String {
    return "\(a)점"
}

let score = myScore //func 자체
score(50)//func 이 어떻게 구성되었는지 알림

var myName: String = "kim"
myName

// closure
let myScore2 = {(a: Int) -> String in
    return "\(a)점"
}//변수나 상수에 담아주어야 error가 나지 않는다
//func 과 달리 이름이 없어서 담지 않으면 사용할 수 없다

myScore2(20)


//Closure 실전
//조건 -> 찾는다 -> 특정한 글자가 포함된 것을 찾는다
//조건 -> 찾는다 -> 입력한 글자로 시작하는 첫 글자를 찾는다
let names = ["apple", "air", "brown", "red", "orange", "blue", "candy", "hobby"]
let containsSomeText: (String, String) -> Bool = { name, find in
    if name.contains(find) {
        return true
    }
    return false
}

let isStartSomeText: (String, String) -> Bool = {name, find in
    if name.first?.description == find {
        return true
    }
    return false
}

func find(findString: String, condition: (String, String) -> Bool) -> [String] {
    var newNames = [String]()
    
    for name in names {
        if condition(name, findString) {
            newNames.append(name)
        }
    }
    return newNames
}

find(findString: "a", condition: containsSomeText)
find(findString: "a", condition: isStartSomeText)


func someFund(find: String) -> [String] {
    var newNames = [String]()
    
    for name in names {
        if name.contains(find) {
            newNames.append(name)
        }
    }
    
    return newNames
}

someFund(find: "a")



//Closure의 형태 사용
var arr = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

// sort
arr.sort { (lhs, rhs) -> Bool in
    return lhs < rhs
}
arr.sort() //sort는 return 없음, sorted는 return 있음 //값 자체를 변경함
//arr.sorted()// 값 자체를 변경안함
arr.sort { //(lhs, rhs) -> Bool in 생략가능
    $0 < $1 //return 생략가능
}
arr.sort(by: {$0 < $1})
arr.sort() {$0 < $1}
arr.sort{ $0 < $1 } //받는 값이 하나면 by와 파라미터를 감싼 구조 자체를 사라지게 할 수 있다
arr.sort(by: < ) //우리가 사용하는 +, -, =같은 것들도 기호에 대해 프로그래밍 되어 있어서 자체가 closure이다
