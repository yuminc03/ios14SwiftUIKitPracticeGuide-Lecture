import UIKit

//unicode 범위 관련

//숫자만 입력받을 수 있어야 한다.
//키보드 제한? -> 위험

let inputValue = "9" //받는 값
//하나하나 누를 때마다 체크
if inputValue >= "\u{30}" && inputValue <= "\u{39}" {//30 = 0
    print("숫자")
}else {
    print("숫자 아님")
}

//영어만 입력해야 한다
"\u{41}"
"\u{7a}"
