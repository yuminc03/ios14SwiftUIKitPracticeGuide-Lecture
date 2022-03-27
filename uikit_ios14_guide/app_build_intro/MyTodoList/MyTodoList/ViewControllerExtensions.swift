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
        cell.selectionStyle = .none
        cell.separator.isHidden = indexPath.row == self.myTodoList.count - 1
        
        cell.topTitleLabel.text = myTodoList[indexPath.row].title
        
        if let hasDate = myTodoList[indexPath.row].date {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd hh:mm"
            let dateString = formatter.string(from: hasDate)
            cell.dateLabel.text = dateString
        }
        else {
            
            cell.dateLabel.text = ""
        }
        
        let priority = myTodoList[indexPath.row].priorityLevel
        let priorityColor = PriorityLevel(rawValue: priority)?.color
        
        cell.priorityView.backgroundColor = priorityColor
        cell.priorityView.layer.cornerRadius = cell.priorityView.bounds.height / 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = TodoDetailViewController.init(nibName: "TodoDetailViewController", bundle: nil)
        vc.delegate = self
        vc.selectedTodoList = myTodoList[indexPath.row]
        self.present(vc, animated: true, completion: nil)
    }
}

extension ViewController: TodoDetailViewControllerDelegate {
    
    func didFinishSaveData() {
        self.fetchData()
        self.todoTableView.reloadData()
    }
    
}

extension PriorityLevel {
    
    var color: UIColor {
        
        switch self {
        case .level1:
            return .systemGreen
            
        case .level2:
            return .systemOrange
            
        case .level3:
            return .systemRed
        }
    }
}
