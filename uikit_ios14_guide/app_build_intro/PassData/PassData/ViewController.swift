//
//  ViewController.swift
//  PassData
//
//  Created by Chu Yu Min on 2022/01/09.
//  passing data (데이터를 넘겨주는 방법)
//  6가지

//1. instence property

import UIKit

class ViewController: UIViewController {

    var someString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func ButtonDidTapped(_ sender: Any) {
        let detailVc = DetailViewController(nibName: "DetailViewController", bundle: nil)
//        detailVc.someString = "string"
        self.present(detailVc, animated: true, completion: nil)
        detailVc.someLabel.text = "BB"
    }
    
}

