//
//  ViewControllerExtensions.swift
//  MyTodoList
//
//  Created by Chu Yu Min on 2022/03/07.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myTodoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTodoTableViewCell", for: indexPath) as! MyTodoTableViewCell
        
        cell.topTitleLabel.text = myTodoList[indexPath.row].title
        if let hasDate = myTodoList[indexPath.row].date {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd hh:mm:ss"
            let dateString = formatter.string(from: hasDate)
            
            cell.dateLabel.text = dateString
        }
        else {
            cell.dateLabel.text = ""
        }
        
        return cell
    }
    
}

extension ViewController: TodoDetailViewControllerDelegate {
    
    func didFinishSaveData() {
        self.fetchData()
        self.todoTableView.reloadData()
    }
    
}
