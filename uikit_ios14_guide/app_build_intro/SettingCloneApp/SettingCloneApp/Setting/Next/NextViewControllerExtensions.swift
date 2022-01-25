//
//  NextViewControllerExtensions.swift
//  SettingCloneApp
//
//  Created by Chu Yu Min on 2022/01/22.
//

import UIKit

extension NextViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NextTableViewCell", for: indexPath) as! NextTableViewCell
        cell.leftLabel.text = model[indexPath.section][indexPath.row].leftTitle
        cell.selectionStyle = .none
        return cell
    }
    
}
