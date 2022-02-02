//
//  ViewController.swift
//  OnBoardingViewApp
//
//  Created by Chu Yu Min on 2022/01/31.
//

import UIKit

class ViewController: UIViewController {

    var didShowOnBoardingView = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setView() //화면이 나왔을 때 처리
    }

    private func setView() {
        
        if didShowOnBoardingView == false { //boardingView를 한 번만 보여주고 싶음
            
            didShowOnBoardingView = true
            
            let pageVc = OnBoardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
            pageVc.modalPresentationStyle = .fullScreen
            self.present(pageVc, animated: true, completion: nil)
            
        }
        
    }
}

