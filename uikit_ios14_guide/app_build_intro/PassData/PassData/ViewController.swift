//
//  ViewController.swift
//  PassData
//
//  Created by Chu Yu Min on 2022/01/09.
//  passing data (데이터를 넘겨주는 방법)
//  6가지

//1. instence property
//2. segue
//3. instance
//4. delegate (delegation) pattern(대리, 위임, 대신)
//5. closure
//6. Notification

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var someString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationName = Notification.Name("notiSendDataString")
        
        NotificationCenter.default.addObserver(self, selector: #selector(presentSubString), name: notificationName, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    @objc func keyboardWillShow() {
        print("keyboard will show")
    }
    
    @objc func keyboardDidShow() {
        print("keyboard did show")
    }
    
    @objc func presentSubString(notification: Notification) {
        if let str = notification.userInfo?["str"] as? String {
            self.dataLabel.text = str
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {//segue button did tapped
        if segue.identifier == "segueButtonDidTapped" {
            if let detailVc = segue.destination as? SegueViewController { //화살표에 연결된 목적지에 접근 가능하게 함
                detailVc.dataString = "segue data string"
            }
        }
    }

    @IBAction func propertyButtonDidTapped(_ sender: Any) {
        let detailVc = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detailVc.someString = "detail data string"
        self.present(detailVc, animated: true, completion: nil)
    }
    
    @IBAction func InstanceButtonDidTapped(_ sender: Any) {
        let detailVc = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)
        detailVc.mainVc = self
        self.present(detailVc, animated: true, completion: nil)
    }
    
    @IBAction func delegateButtonDidTapped(_ sender: Any) {
        let detailVc = DelegateViewController(nibName: "DelegateViewController", bundle: nil)
        detailVc.delegate = self
        self.present(detailVc, animated: true, completion: nil)
    }
    
    @IBAction func closureButtonDidTapped(_ sender: Any) {
        let detailVc = ClosureViewController(nibName: "ClosureViewController", bundle: nil)
        detailVc.dataStringClosure = { str in
            self.dataLabel.text = str
        }
        self.present(detailVc, animated: true, completion: nil)
    }
    
    @IBAction func notificationButtonDidTapped(_ sender: Any) {
        let detailVc = NotiDetailViewController(nibName: "NotiDetailViewController", bundle: nil)
        self.present(detailVc, animated: true, completion: nil)
    }
    
    
}

extension ViewController: DelegateViewControllerDelegate {
    func passString(string: String) {
        self.dataLabel.text = string
    }

}
