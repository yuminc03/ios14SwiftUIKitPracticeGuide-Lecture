//
//  DetailViewController.swift
//  NavigationMaster
//
//  Created by Chu Yu Min on 2022/05/29.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        
//        setupStatusBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupStatusBar()
    }
    
    private func setupStatusBar() {
        
//        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate
//        sceneDelegate?.statusBarView.backgroundColor = .systemYellow
        self.statusBar?.backgroundColor = .systemYellow
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .systemYellow
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }

}

extension UIViewController {
    
    var statusBar: UIView? {
        
        //status bar design
        let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate //UISceneDelegate
        sceneDelegate?.statusBarView.backgroundColor = .systemOrange

        let window = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        
        if let statusBar = sceneDelegate?.statusBarView {
            window?.addSubview(statusBar)
        }
        
        return sceneDelegate?.statusBarView
    }
}
