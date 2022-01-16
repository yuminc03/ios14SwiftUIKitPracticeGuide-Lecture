//
//  InstanceDetailViewController.swift
//  PassData
//
//  Created by Chu Yu Min on 2022/01/11.
//

import UIKit

class InstanceDetailViewController: UIViewController {

    var mainVc: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func instanceButtonDidTapped(_ sender: Any) {
        mainVc?.dataLabel.text = "instance some data"
        self.dismiss(animated: true, completion: nil)
    }
}
