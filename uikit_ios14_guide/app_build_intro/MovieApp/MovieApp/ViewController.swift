//
//  ViewController.swift
//  MovieApp
//
//  Created by Chu Yu Min on 2022/02/13.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraints()
    }

    private func setConstraints() {
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
    }
}

