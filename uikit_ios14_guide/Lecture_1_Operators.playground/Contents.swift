import UIKit

//기초 연산자
//Basic Operators

// + - * / %(remainder Operator)

//let a = 20
//let b = 30

//Swift 언어 특징
//타입 엄격
//강타입
//type safe
//java script -> 약타입(타입에 느슨)

var a: Int = 20
let b: Double = 30
let c = a + Int(b) //swift에서는 서로 다른 타입끼리 연산이 안됨

a = a + 2
a += 2

a = a - 2
a -= 2

let aa = "h1"
let bb = " hellow"
let cc = aa + bb //string에서의 +는 연결

// %
//홀수, 짝수
if a % 2 == 0 {//만약, b처럼 실수일 경우에는 에러발생 trauncatingRemainder를 사용해야함
    print("짝수")
}
else {
    print("홀수")
}




//비교 연산자
// Comparison Operators

let a2 = 20
let b2 = 30

let strA = "a"
let strB = "b"

//Bool
a2 == b2 //false
a2 != b2 //true
a2 > b2 // false
a2 < b2 //true
a2 >= b2 //false
a2 <= b2 //true

if a2 > b2 { //a2 > b2 == true
    
}
else {
    
}

//unicode 연산
strA == strB //false
strA != strB //true
strA > strB //false
strA < strB //true
strA >= strB //false
strA <= strB //true

"\u{61}"
"\u{1F496}"
