import UIKit

//Collection Types
//집합 타입

//Dictionary

var namesOfStreet = [String : Any]()

namesOfStreet["302ro"] = "1st Street"
namesOfStreet["303ro"] = "2nd Street"
namesOfStreet["304ro"] = 3 //any - 어떤 타입도 올 수 있다

namesOfStreet["302rr"] //nil (걊이 없다)
namesOfStreet["302ro"]//dictionary는 인덱스 잘못 써도 error가 나지 않음
namesOfStreet["302ro"] = nil
namesOfStreet["302ro"]
//기본적으로 dictionary는 옵셔널을 하지 않아도 nil이 들어갈 수 있다
namesOfStreet //302ro에 nil을 주어서 302ro key value 자체가 없어짐
//302ro가 value를 nil로 가지는게 아님

var namesOfStreet2 = ["a" : 1, "b" : 2, "c" : 3]
namesOfStreet.keys //어떤 key들로 등록되었는지 보기

for dic in namesOfStreet {
    print(dic)
}
