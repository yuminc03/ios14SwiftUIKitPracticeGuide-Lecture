import UIKit
import Darwin

//Function
//함수

//계산기 만들기 -> Class
//더하기 기능 -> Function

let a = 10
let b = 20
var c = 0

//func plus(num1: Int, num2: Int) -> Int {
////    print("sum = ", num1 + num2)
//    return num1 + num2
//}
func plus(num1: Int, num2: Int){
    c = num1 + num2
}
func plus2(num1: Int, num2: Int) -> Int{
    return num1 + num2
}
func plus3(num1: Int, num2: Int) -> (String, Int) {
    return ("결과값은: ", num1 + num2)
}
func plus4(_ num1: Int, _ num2: Int) -> (String, Int) {//바깥에서 쓰는 부분을 변수 이름으로 쓰지 않음
    return ("결과값은: ", num1 + num2)
}
c
plus(num1: a, num2: b)
c

let p = plus2(num1: a, num2: b)

let p2 = plus3(num1: a, num2: b)

let p3 = plus4(a, b)


func plus(_ num1: Int, _ num2: Int) -> Int {
    return num1 + num2
}

func minus(_ num1: Int, _ num2: Int) -> Int{
    return num1 - num2
}

func multiply(_ num1: Int, _ num2: Int) -> Int {
    return num1 * num2
}

//View, Present, Display - 데이터 가공 + 화면에 뿌려주기
var inputButtonType = "+"

if inputButtonType == "+" {
    print("연산 결과", plus(a, b))
}
else if inputButtonType == "-" {
    print("연산 결과", minus(a, b))
}
else if inputButtonType == "*" {
    print("연산 결과", multiply(a, b))
}

func displayCalc(result: ((Int, Int) -> Int)) {
    print("연산 결과", result(a, b))
}

if inputButtonType == "+" {
    displayCalc(result: plus)
}
else if inputButtonType == "-" {
    displayCalc(result: minus)
}
else if inputButtonType == "*" {
    displayCalc(result: multiply)
}
