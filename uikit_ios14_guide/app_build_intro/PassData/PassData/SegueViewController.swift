//
//  SegueViewController.swift
//  PassData
//
//  Created by Chu Yu Min on 2022/01/10.
//

import UIKit

class SegueViewController: UIViewController {

    @IBOutlet weak var segueDataLabel: UILabel!
    
    var dataString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        segueDataLabel.text = dataString
    }
}
