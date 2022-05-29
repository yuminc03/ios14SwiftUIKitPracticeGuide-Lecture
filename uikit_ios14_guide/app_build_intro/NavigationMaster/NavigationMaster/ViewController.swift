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
        setupNavigationTitleViewButton()
        setupNaviBackButton()
        setupRightButton()
//        setupNaviBackground()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupNavigationBarAppearance()
    }

    private func setupNavigationBarAppearance() {
    
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemOrange
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance

        //status bar design
        self.statusBar?.backgroundColor = .systemOrange
//        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate //UISceneDelegate
//        sceneDelegate?.statusBarView.backgroundColor = .systemOrange
//
//        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
//
//        if let statusBar = sceneDelegate?.statusBarView {
//            window?.addSubview(statusBar)
//        }
        
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
    
    func setupNaviBackButton() {
//        self.navigationItem.backButtonTitle = "뒤로" //Back button title
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(systemItem: .bookmarks)
        
        guard let backImage = UIImage(named: "apple-logo-fill")?.withRenderingMode(.alwaysOriginal) else { return }
        
        let newImage = resizeNaviTitleImage(image: backImage, newWidth: 40, newHeight: 40)
        self.navigationController?.navigationBar.backIndicatorImage = newImage //backButton에 표시될 이미지
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = newImage //push, pop전환 중 content의 mask로 사용되는 이미지
//        self.navigationController?.navigationBar.tintColor = .systemMint
        
        self.navigationItem.backButtonTitle = ""
    }
    
//    func setupNaviBackground() {
//
////        self.navigationController?.navigationBar.isTranslucent = false //navigationBar의 색깔이 반투명하게 보이도록 한다/안한다
//        self.navigationController?.navigationBar.backgroundColor = .orange
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//    }
    
    func resizeNaviTitleImage(image: UIImage, newWidth: CGFloat, newHeight: CGFloat) -> UIImage? {
        
        //image를 마음대로 잘라서 backButtonImage로 사용할 때
        let newImageRect = CGRect(x: 0, y: 0, width: newWidth, height: newHeight)
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: newImageRect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal)
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func setupRightButton() {
        
        let config = UIImage.SymbolConfiguration(pointSize: 40) //이미지의 크기 조절
        let rightImage = UIImage(systemName: "alarm.fill", withConfiguration: config)?.withRenderingMode(.alwaysOriginal)
        
//        let rightItem = UIBarButtonItem(image: rightImage, style: .done, target: self, action: #selector((rightButtonDidTapped)))
////        self.navigationItem.rightBarButtonItem = rightItem
//
//        let rightItem2 = UIBarButtonItem(image: rightImage, style: .done, target: self, action: #selector((rightButtonDidTapped)))
////        self.navigationItem.rightBarButtonItem = rightItem2
//        rightItem2.imageInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: -20)//rightButton 사이의 간격
        
//        self.navigationItem.rightBarButtonItems = [rightItem, rightItem2]
        
        let btn1 = UIButton()
        btn1.setImage(rightImage, for: .normal)
        btn1.addTarget(self, action: #selector(rightButtonDidTapped), for: .touchUpInside)
        
        let btn2 = UIButton()
        btn2.setImage(rightImage, for: .normal)
        btn2.addTarget(self, action: #selector(rightButton2DidTapped), for: .touchUpInside)
        
        let stackView = UIStackView(arrangedSubviews: [btn1, btn2])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .equalSpacing
        let customItem = UIBarButtonItem(customView: stackView)
        self.navigationItem.rightBarButtonItem = customItem
        
    }
    
    @objc private func rightButtonDidTapped() {
        
        print("right button click")
    }
    
    @objc private func rightButton2DidTapped() {
        
        print("right button 2 click")
    }
    
    @objc private func titleViewButtonDidTapped(sender: UIButton) {
        print("tapped")
    }
}

