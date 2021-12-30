import UIKit

//Extension
//기능 확장

//struct, class, eum, protocol에 사용가능

//여러번 사용할 기능은 extension으로 추가

//숫자(Int) 짝수, 홀수
extension Int {
    var oddOrEven: String {
        if self % 2 == 0 {
            return "짝수"
        }
        return "홀수"
    }
}

3.oddOrEven
4.oddOrEven

//UIColor
extension UIColor {
    var mainColor: UIColor {
        UIColor(red: 120/255, green: 70/255, blue: 120/255, alpha: 1)
    }
}

var button = UIButton()
button.titleLabel?.textColor = UIColor().mainColor
