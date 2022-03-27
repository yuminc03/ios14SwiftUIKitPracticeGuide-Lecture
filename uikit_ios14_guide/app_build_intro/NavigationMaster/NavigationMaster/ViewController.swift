//
//  ViewController.swift
//  NavigationMaster
//
//  Created by Chu Yu Min on 2022/03/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupNavigationBarAppearance()
        setupNavigationTitleViewButton()
        customNaviBackButton()
    }

    private func setupNavigationBarAppearance() {
    
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemGray.withAlphaComponent(0.3)
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance

    }
    
    private func setupNavigationTitleImage() {

        self.navigationItem.title = "홈" //self.navigationItem.title을 self.title이라고 할 수도 있음
        let logo = UIImageView(image: UIImage(named: "coffee"))
        logo.contentMode = .scaleAspectFill
        logo.widthAnchor.constraint(equalToConstant: 90).isActive = true
        logo.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.navigationItem.titleView = logo
    }
    
    private func setupNavigationTitleViewButton() {
        
        let button = UIButton()
        button.setTitle("Home Button", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(titleViewButtonDidTapped), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.navigationItem.titleView = button
    }
    
    func customNaviBackButton() {
//        self.navigationItem.backButtonTitle = "뒤로" //Back button title
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(systemItem: .bookmarks)
        
        guard let backImage = UIImage(named: "apple-logo-fill")?.withRenderingMode(.alwaysOriginal) else { return }
        
        let newImage = resizeNaviTitleImage(image: backImage, newWidth: 40, newHeight: 40)
        self.navigationController?.navigationBar.backIndicatorImage = newImage
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = newImage
//        self.navigationController?.navigationBar.tintColor = .systemMint
        
        self.navigationItem.backButtonTitle = ""
    }
    
    func resizeNaviTitleImage(image: UIImage, newWidth: CGFloat, newHeight: CGFloat) -> UIImage? {
        
        //image를 마음대로 잘라서 backButtonImage로 사용할 때
        let newImageRect = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: newImageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    @objc private func titleViewButtonDidTapped(sender: UIButton) {
        print("tapped")
    }
}

