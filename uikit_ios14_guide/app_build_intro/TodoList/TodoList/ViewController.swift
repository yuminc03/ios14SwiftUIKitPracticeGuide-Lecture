//
//  ViewController.swift
//  TodoList
//
//  Created by Chu Yu Min on 2022/03/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var todoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        
        todoTableView.delegate = self
        todoTableView.dataSource = self
        
        self.title = "My to do List"
        
        let rightItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(rightButtonDidTapped))
        rightItem.tintColor = .black
        navigationItem.rightBarButtonItem = rightItem
        
        let barAppearance = UINavigationBarAppearance()
        barAppearance.backgroundColor = .systemBlue
        self.navigationController?.navigationBar.standardAppearance = barAppearance
    }
    
    @objc private func rightButtonDidTapped() {
        
    }
}

