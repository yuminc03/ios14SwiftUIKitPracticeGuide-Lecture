import UIKit

//Structure
//구조체

//struct MediaType {
//
//}

//call by value 타입
struct ImageType {//구조체는 상속 불가능
    //var name = ""
    var type = ""
    var width = 0
    var height = 0
//    func someFunc() {
//
//    }
}

var imageType1 = ImageType()
var imageType2 = imageType1
var imageType3 = imageType2

imageType1.type = "jpg"
imageType2.type = "png"

imageType1.type
imageType2.type
imageType3.type

class MyInfo {
    var myAge = 0
}

var info1 = MyInfo()
var info2 = info1
var info3 = info2

info1.myAge = 20
info2.myAge = 10

info1.myAge
info2.myAge
info3.myAge
