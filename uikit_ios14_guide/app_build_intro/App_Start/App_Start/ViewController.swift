//
//  ViewController.swift
//  App_Start
//
//  Created by Chu Yu Min on 2022/01/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testButton: UIButton!
    @IBAction func testButtonDidTapped(_ sender: Any) {
        testButton.backgroundColor = .systemOrange //타입 추론으로 UIColor 생략
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        self.present(detailVc, animated: true, completion: nil)
    }//화면에 연결된 객체와 연결
    
    override func viewDidLoad() {
        super.viewDidLoad()
        testButton.backgroundColor = UIColor.systemRed
    }
    
    
}

