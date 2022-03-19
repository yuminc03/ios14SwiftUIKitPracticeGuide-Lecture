//
//  ViewController.swift
//  CustomButtonTest
//
//  Created by yumin chu on 2022/03/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var customPurpleButton: RotateButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customPurpleButton.selectTypeCallBack = { upDownType in
            print(upDownType)
        }
        
        
    
//        let myButton = RotateButton()
//        myButton.translatesAutoresizingMaskIntoConstraints = false
//        myButton.setTitle("my custom button", for: .normal)
//        myButton.backgroundColor = .systemPurple
//        myButton.layer.cornerRadius = 4
//        myButton.setImage(UIImage(systemName: "arrow.down.square.fill"), for: .normal)
//        self.view.addSubview(myButton)
        
//        myButton.translatesAutoresizingMaskIntoConstraints = true
//        myButton.frame = CGRect(x: 100, y: 200, width: 200, height: 200)
        
//        NSLayoutConstraint.activate([
//            myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            myButton.widthAnchor.constraint(equalToConstant: 200),
//            myButton.heightAnchor.constraint(equalToConstant: 40)
//        ])
    }

    
}

