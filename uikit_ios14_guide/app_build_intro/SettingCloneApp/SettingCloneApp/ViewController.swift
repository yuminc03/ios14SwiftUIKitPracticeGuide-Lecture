//
//  ViewController.swift
//  SettingCloneApp
//
//  Created by Chu Yu Min on 2022/01/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var model = [[SettingModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setView()
        configulations()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configulations() {
        model.append(
            [
                SettingModel(
                    leftImageName: "person.circle",
                    menuTitle: "Sign in to your iPhone",
                    subTitle: "Set up iCloud, the App Store, and more.",
                    rightImageName: "chevron.right"
                )
            ]
        )
        model.append(
            [
                SettingModel(
                    leftImageName: "gear",
                    menuTitle: "General",
                    subTitle: nil,
                    rightImageName: "chevron.right"
                ),
                SettingModel(
                    leftImageName: "person.fill",
                    menuTitle: "Accessibility",
                    subTitle: nil,
                    rightImageName: "chevron.right"
                ),
                SettingModel(
                    leftImageName: "hand.raised.fill",
                    menuTitle: "Privacy",
                    subTitle: nil,
                    rightImageName: "chevron.right"
                )
            ]
        )
        
        
    }
    
    private func setView() {
        self.view.backgroundColor = .white.withAlphaComponent(0.95)
        tableView.backgroundColor = .systemGray.withAlphaComponent(0.08)
        self.title = "Settings"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
        tableView.register(UINib(nibName: "SettingMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingMenuTableViewCell")
        
    }
}

