//
//  DelegateViewController.swift
//  PassData
//
//  Created by Chu Yu Min on 2022/01/13.
//

import UIKit

protocol DelegateViewControllerDelegate: AnyObject {
    func passString(string: String)
}
class DelegateViewController: UIViewController {

    weak var delegate: DelegateViewControllerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func passButtonDidTapped(_ sender: Any) {
        delegate?.passString(string: "delegate pass Data")
        self.dismiss(animated: true, completion: nil)
    }
    
}
