//
//  DetailViewController.swift
//  PassData
//
//  Created by Chu Yu Min on 2022/01/09.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var someLabel: UILabel! //@IBOutlet은 화면에 올라갈 준비가 되기 전에는 nil
    var someString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        someLabel.text = someString
        //viewWillAppear나 viewDidAppear에서 데이터를 넣기도 함
        
    }

}
