//
//  ViewControllerExtensions.swift
//  SettingCloneApp
//
//  Created by Chu Yu Min on 2022/01/19.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let data = model[indexPath.section][indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
            cell.topTitleLabel.text = data.menuTitle
            cell.profileImageView.image = UIImage(systemName: data.leftImageName ?? "")
            cell.bottomTitleLabel.text = data.subTitle
            cell.selectionStyle = .none
            return cell
        }
        else {
            let data = model[indexPath.section][indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "SettingMenuTableViewCell", for: indexPath) as! SettingMenuTableViewCell
            cell.leftImageView.image = UIImage(systemName: data.leftImageName ?? "")
            cell.cellTitleLabel.text = data.menuTitle
            cell.rightImageView.image = UIImage(systemName: data.rightImageName ?? "")
            cell.selectionStyle = .none
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 && indexPath.row == 0 {
            let myIdVc = MyIDViewController(nibName: "MyIDViewController", bundle: nil)
            self.present(myIdVc, animated: true, completion: nil)
        }
        else if indexPath.section == 1 && indexPath.row == 0 {
            if let nextVc = UIStoryboard(name: "NextViewController", bundle: nil).instantiateViewController(withIdentifier: "NextViewController") as? NextViewController {
                self.navigationController?.pushViewController(nextVc, animated: true)
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return UITableView.automaticDimension
        }
        else {
            return 40
        }
    }
    
}
