//
//  ViewController.swift
//  DispatchQueueProject
//
//  Created by Chu Yu Min on 2022/01/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var finishLabel: UILabel!
    
    //dispatch queue
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            self.timerLabel.text = Date().timeIntervalSince1970.description
        }
    }

    @IBAction func button1DidTapped(_ sender: Any) {
        
        simpleClosure {
            DispatchQueue.main.async {
                self.finishLabel.text = "End"
            }//UI부분은 main thread에서 해야함
        }
    }
    
    @IBAction func button2DidTapped(_ sender: Any) {
        let dispatchGroup = DispatchGroup()
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        let queue3 = DispatchQueue(label: "q3")
        
        queue1.async(group: dispatchGroup, qos: .background) {
            dispatchGroup.enter()//작업 중인 group이 하나 있음
            DispatchQueue.global().async {
                for index in 0 ..< 10 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
                dispatchGroup.leave() //작업의 끝을 알림
            }
        }
        queue2.async(group: dispatchGroup, qos: .userInitiated) {
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 10 ..< 20 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
                dispatchGroup.leave()
            }
        }
        queue3.async(group: dispatchGroup) {
            dispatchGroup.enter()
            DispatchQueue.global().async {
                for index in 20 ..< 30 {
                    Thread.sleep(forTimeInterval: 0.2)
                    print(index)
                }
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: DispatchQueue.main) {
            print("End")
        }
        
    }
    
    @IBAction func button3DidTapped(_ sender: Any) {
        
//        DispatchQueue.main.async {
//            print("main sync")
//        } //main thread가 이미 돌고 있는 상태에서 sync를 추가하면(main thread는 작업이 안 끝나는데) sync는 계속 기다린다(dead lock)
        
        let queue1 = DispatchQueue(label: "q1")
        let queue2 = DispatchQueue(label: "q2")
        
        queue1.async {
            for index in 0 ..< 10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
            //deadlock -> 상대 작업이 끝날 때까지 서로 계속 기다리는 상태
//            queue1.sync {
//                for index in 10 ..< 20 {
//                    Thread.sleep(forTimeInterval: 0.2)
//                    print(index)
//                }
//            }
            
        }
        queue1.sync {//sync - 실행되기 전까지는 무한정으로 기다리면서 메모리에 남아있다..(다른 thread를 lock하고 자신의 작업 진행을 완료할 때까지 기다리게 함)
            for index in 10 ..< 20 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }
        }
        print("aaaa")
    }
    
    
    func simpleClosure(completion: @escaping () -> Void) {
        
        DispatchQueue.global().async {
            for index in 0 ..< 10 {
                Thread.sleep(forTimeInterval: 0.2)
                print(index)
            }//main thread에서 진행
            
            completion()
            
        }
        
    }
    
}

