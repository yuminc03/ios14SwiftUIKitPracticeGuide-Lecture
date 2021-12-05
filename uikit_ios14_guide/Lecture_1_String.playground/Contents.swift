import UIKit

// String

let myName = "chu\nyu\nmin"

//for character in myName {
//    print(character)
//}
//let myName2 = "kim"
//let name = myName + myName2

let myLongStr =
"""
    hello
welcome
"""

print(myLongStr)

let isOn = true
isOn.description //그 값 그대로 String타입으로 바꾼다

let myNumber = 123
myNumber.description
String(myNumber)

"my number is \(myNumber)".dropLast() //마지막 버림
"my number is \(myNumber)".dropFirst() //첫번째 버림

let myNumber2 = 12.33
String(myNumber2).split(separator: ".")
