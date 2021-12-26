import UIKit

//Properties
// 프로퍼티

class MyInfo {
    
    //stored property (저장)
    var name = "" //속성
    var age = 0 //속성
    
    //lazy stored property
    //사용할 순간에 메모리에 올려서 사용
    lazy var myProfiles = [UIImage(named: "a"), UIImage(named: "b"), UIImage(named: "c"), UIImage(named: "d"), UIImage(named: "e"), UIImage(named: "f")] //여러개의 이미지를 선언할 때는 메모리를 많이 차지한다 과부하가 생길 수 있다 버벅거릴 수도, (lazy가 필요한 때는 처음에 메모리가 호출될 필요가 없다면, 바로 사용하지 않을 것이라면)
    
    //computed property(계산)
    var isAdult: Bool {
        // get { }안에 써도 되지만 생략할 수도 있다 (get만 사용할 경우)
        if age > 19 {
            return true
        }
        return false
    }
    
    //email -> 보안 -> 암호화 된 값으로 사용한다 (항상)
    var _email = ""
    var email: String {
        get{
            return _email
        }
        set{
            _email = newValue.hash.description
        }
    }
}


let myInfo = MyInfo()
myInfo.email = "abc@test.com"
myInfo.email

myInfo.name = "kim"
myInfo.age = 19
myInfo.isAdult

myInfo.myProfiles//메모리에 올라오는 순간

print(myInfo.age)
