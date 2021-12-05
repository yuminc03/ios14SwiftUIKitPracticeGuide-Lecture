import UIKit

//변수, 상수

var str = "Hello, playground"

var age = 10

age = 20
age = 30
age = 35

str = "hello"
str = "swift"

//Swift 언어 특징
//Safe type : 타입이 안전한, 강타입, 타입이 엄격
//age = "hi" //error: cannot assign value of type 'string' to type 'int'(타입이 다르면 대입할 수 없음)


//상수
let guestName = "name"
//guestName = "kim"//error: (초기값에서 더이상 바뀌지 않는다)



//Type Annotations
/* 여러 줄 주석입니다!!
 ...
 ...
 */
var myAge: Int = 0
var screenHeight: Float = 560
//var sum = myAge + Int(screenHeight)


//Boolean
var isOpen = false

if !isOpen {//!는 반전 isOpen == false와 같다
    
}
else {
    
}


//Tuple (n짝, n쌍)

var topTitle = ("메인화면", "mainIcon.png")

topTitle.0
topTitle.1

//http status code
var httpError = (statusCode: 404, description: "page not found") //200은 success

httpError.statusCode
httpError.description


//optionals
//개념: 값이 있을 수도, 없을수도 있다
//값이 있다

//값이 없다 -> nil

//0 -> 다 쓴 상태인 값
//null -> 값을 setting을 안한 건지, 다 쓴 건지 모르지만 아무튼 값이 없음

var optionalAge : Int? = 0//nil을 받을 수 있는 optional 상태

optionalAge = nil

//값이 없는 상태 체크 -> 틀린 로직 (Swift 언어 스펙)
//틀린 로직의 예
if optionalAge == 0 {//0과 nil을 구분해야 한다
    //0을 값이 없는 상태로 사용하면 안됨
    //alert - 나이를 입력해 주세요.
}

if optionalAge == nil {
    //alert - 나이를 입력해 주세요.
}

var myName : String? = "" //빈 스트링

//틀린 로직 - 값이 없는 상태 체크
if myName == "" {
    // 이름을 입력해주세요.
}

//값이 없는 상태 체크
if myName == nil {
    //이름값이 없음
}

//optional 설명 2

