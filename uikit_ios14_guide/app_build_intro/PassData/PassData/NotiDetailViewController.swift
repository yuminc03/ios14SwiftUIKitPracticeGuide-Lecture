//
//  NotiDetailViewController.swift
//  PassData
//
//  Created by Chu Yu Min on 2022/01/16.
//

import UIKit

class NotiDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    @IBAction func NaviDetailButtonDidTapped(_ sender: Any) {
        let notificationName = Notification.Name("notiSendDataString")
        let notiData = ["str" : "noti data string"]
        
        NotificationCenter.default.post(name: notificationName, object: nil, userInfo: notiData)
        self.dismiss(animated: true, completion: nil)
    }
    
}
