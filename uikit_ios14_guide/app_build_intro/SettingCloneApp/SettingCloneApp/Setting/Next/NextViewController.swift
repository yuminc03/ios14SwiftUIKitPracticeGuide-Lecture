//
//  NextViewController.swift
//  SettingCloneApp
//
//  Created by Chu Yu Min on 2022/01/22.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var model = [[NextModel]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        configulations()
    }
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
    }
    
    private func configulations() {
        model.append(
            [
                NextModel(leftTitle: "About")
            ]
        )
        
        model.append(
            [
                NextModel(leftTitle: "Keyboard"),
                NextModel(leftTitle: "Game Controller"),
                NextModel(leftTitle: "Fonts"),
                NextModel(leftTitle: "Language & Region"),
                NextModel(leftTitle: "Dictionary")
            ]
        )
        
        model.append(
            [
                NextModel(leftTitle: "Reset")
            ]
        )
        
    }
    
}
