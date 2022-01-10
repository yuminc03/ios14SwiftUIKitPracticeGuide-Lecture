//
//  ViewController.swift
//  PassData
//
//  Created by Chu Yu Min on 2022/01/09.
//  passing data (데이터를 넘겨주는 방법)
//  6가지

//1. instence property
//2. segue

import UIKit

class ViewController: UIViewController {

    var someString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueButtonDidTapped" {
            if let detailVc = segue.destination as? SegueViewController { //화살표에 연결된 목적지에 접근 가능하게 함
                detailVc.segueDataLabel.text = "abcd"
            }
        }
    }

    @IBAction func ButtonDidTapped(_ sender: Any) {
        let detailVc = DetailViewController(nibName: "DetailViewController", bundle: nil)
//        detailVc.someString = "string"
        self.present(detailVc, animated: true, completion: nil)
        detailVc.someLabel.text = "BB"
    }
    
}

