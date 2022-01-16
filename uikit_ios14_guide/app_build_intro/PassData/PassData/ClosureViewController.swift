//
//  ClosureViewController.swift
//  PassData
//
//  Created by Chu Yu Min on 2022/01/16.
//

import UIKit

class ClosureViewController: UIViewController {

    var dataStringClosure: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func ClosureButtonDidTapped(_ sender: Any) {
        dataStringClosure?("closure data string")
        self.dismiss(animated: true, completion: nil)
    }
    
}
