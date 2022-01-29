//
//  MyIDViewController.swift
//  SettingCloneApp
//
//  Created by Chu Yu Min on 2022/01/29.
//

import UIKit

class MyIDViewController: UIViewController {

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.isEnabled = false
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
       setView()
    }
    
    func setView() {
        idTextField.addTarget(self, action: #selector(idTextFieldDidTapped), for: .editingChanged)
        idTextFieldDidTapped(gesture: idTextField)
    }
    
    @objc private func idTextFieldDidTapped(gesture: UITextField) {
        if gesture.text?.isEmpty == true {
            nextButton.isEnabled = false
        }
        else {
            nextButton.isEnabled = true
        }
    }

    
    @IBAction func cancleButtonDidTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
