import UIKit

// Control Flow (흐름 제어)

//for

//let name = "anna"
//let numbers = "234234456"
//
//for char in name {
//    print(char)
//}
//
//for n in numbers {
//    print( (Int(String(n)) ?? 0) * 10 )
//}
//
//let names = ["lee", "kim", "min"]
//
//for name in names {
//    print(name + "님")
//}
//
//let numberOfLegs = ["ant" : 6, "dog" : 4]
//
//for dic in numberOfLegs {
//    print(dic)
//}
//
//for index in 0 ..< 5 {
//    print(index)
//}
//
//for index in 0 ..< names.count {
//    print(index)
//}



//while (주의) - 왠만하면 사용하지 않는게 좋다
//무한으로 반복문안에서 계속 실행되는 경우 -> 멈춰버림

//var a = 0
//
////while a == 0 { //무한 반복...
////    print("계속 실행")
////}
//
//while a < 10 {
//    a = a + 1
//    print("계속 실행")
//}




// Switch
// 조건에 케이스를 만들어서 분기

let b = "b"

switch b {
    
case "b" :
    print("b")
    
case "c" :
    print("c")
    
default :
    print("other")
    
}

switch b {
case "a", "b", "c" :
    print("a or b or c")
case "d":
    print("d")
default:
    print("other")
}

let c = 100

switch c {
    
case 1:
    print("num 1")
case 2...5:
    print("num 2~5")
default:
    print("other")
}
