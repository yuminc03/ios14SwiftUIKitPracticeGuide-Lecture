import UIKit

//generic <Type> (정한 임의의 타입)
// 로직 - 반복, 타입 여러가지

//stack
//queue

struct MyStack<MyType> where MyType: Equatable {
    var items = [MyType]()
    
    mutating func push(item: MyType) {
        items.append(item)
    }
    
    mutating func pop() -> MyType? {
        if items.isEmpty {
            return nil
        }
        return items.removeLast()
    }
}

var myStack = MyStack<String>()
myStack.push(item: "a")
myStack.pop()

//Equatable = dictionary에서 key, value type이 같음
var myStack2 = MyStack<MyInfo>()
struct MyInfo: Equatable {
    var name = ""
    var age = ""
}
