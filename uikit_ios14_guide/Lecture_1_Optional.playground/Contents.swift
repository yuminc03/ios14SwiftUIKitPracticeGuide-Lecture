import UIKit

//optionals (옵셔널)
//값이 있을 수도 있고 없을 수도 있다.

//그냥 사용할 수 없는 경우가 많다
var a: Int? = 10
var b: Int? = 20

//unwrapped, unwrap
//unwrapping

//Int? -> Int
//String? -> String

//coalesce
var sum = (a ?? 0) + (b ?? 0) //a가 값이 있으면 사용, 값이 없으면 0으로 대체하여 사용한다


// force unwrap -> 강제로, 힘으로
// 주의사항 -> 강제로 무조건 값이 있는 형태로 변형한다
var d = a! + b! //값이 없으면 앱이 죽음...

//--------------------------------------

if a != nil {
    print(a!) //console창에 값을 띄우는데, 앱과는 관련 없다
}

//값이 있을 때만 실행하고 언래핑!
//if let
//if var
//if let hasNumber = a {//a라는 값이 있으면 값을 unwrapping해서 받아옴
//    print(hasNumber)
//}
//
//if var hasNumber2 = a {//값을 변경해서 사용하고 싶을 때
//    hasNumber2 = hasNumber2 * 2
//    print(hasNumber2)
//}

//guard let
//guard var

func testFunc() {
    guard let hasNumber = a else {
        return
    }
    print(hasNumber)
    print("end")
}

testFunc()

func testFunc2() {
    guard var hasNumber2 = a else {
        return
    }
    hasNumber2 = hasNumber2 * 2
    print(hasNumber2)
    print("end")
}
testFunc2()
