//
//  ViewController.swift
//  OnBoardingViewApp
//
//  Created by Chu Yu Min on 2022/01/31.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setView() //화면이 나왔을 때 처리
    }

    private func setView() {
//        let itemVc = OnBoardingItemViewController(.init(nibName: "OnBoardingItemViewController", bundle: nil))
//        let itemVc = OnBoardingPageViewController()
        
        let pageVc = OnBoardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
        pageVc.modalPresentationStyle = .fullScreen
        self.present(pageVc, animated: true, completion: nil)
    }
}

