import UIKit

//Collection Types
//집합 타입

//Set
//순서가 없는 개념

var names = Set<String>()
names.insert("kim")
names.insert("lee")
names.insert("min")
names.insert("min")//중복된 값은 들어가지 않는다
names

//var sameNames = ["lee", "kim", "min", "lee"]
//Set(sameNames) //array에 중복된 값 들어가지 않게 한다
var names2: Set = ["lee", "kim", "min"]
names2

var numbers1: Set = [1, 2, 3, 4, 5] //일정1
var numbers2: Set = [4, 5, 6, 7, 8] //일정2

//교집합
numbers1.intersection(numbers2)

//합집합
numbers1.union(numbers2)

// 합집합 - 교집합 (대칭차집합)
numbers1.symmetricDifference(numbers2)

//여집합
numbers1.subtracting(numbers2)


