import UIKit

//Collection Types
//집합 타입

//Array
//Swift - type safe
var myNames = Array<String>() //initalize하여 메모리에 올리기
var myAges = [Int]()

myNames.append("chu")
myNames.append("yu")
myNames.append("min")

myNames[0]
myNames[1]
myNames[2] + "님"
//방어코드
//안전한 코딩 스타일을 추구해야함
//myNames[3] //index out of range

let index = 2
if myNames.count > index {
    myNames[index]
}

myNames.append(contentsOf: ["hello", "hi"])
myNames = myNames + ["1", "2"]
//myNames = myNames + "hi" //hi는 string타입이라서 error
myNames = myNames + ["love"]

myNames.removeFirst()//array의 첫번째 요소 지우기
myNames.removeLast()//array 마지막 요소 지우기
//myNames.removeAll()//array요소 모두 지우기

if myNames.count == 0{// myNames.isEmpty
    
}

myNames.insert("save me", at: 0)
myNames.insert("i'm fine", at: 1)

for (index, name) in myNames.enumerated() {
    print(index, name)
}
