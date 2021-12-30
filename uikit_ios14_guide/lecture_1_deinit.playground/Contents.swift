import UIKit

// Deinitalization
// 해제

var a: Int? = 10
a = nil //메모리 해제 (사용하지 않으면 메모리 해체가 효율적이다)

class Game {
    var score = 0
    var name = ""
    var round: Round?
    
    init() {
        print("game init")
    }
    deinit {
        print("game deinit")
    }
}

class Round {
    weak var gameInfo: Game? //상호 참조 (weak = game이 없어지면 함께 없어짐)
    var lastRound = 10
    var roundTime = 20
    deinit {
        print("round deinit")
    }
}

var game: Game? = Game()
//var game2: Game? = game
//game2 = nil //game, game2를 nil해야 deinit이 됨
var round: Round? = Round()

round?.gameInfo = game //round가 game 정보를 참조
game?.round = round //game이 round 정보를 참조
//따라서 서로 참조해서(서로를 잡고(?)있어서) 계속 빙글빙글 도는 식으로 해체할 수 없다

game = nil
round = nil
//티가 잘 나지 않음 (메모리 누수)
