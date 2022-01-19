//
//  ViewControllerExtensions.swift
//  SettingCloneApp
//
//  Created by Chu Yu Min on 2022/01/19.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        return cell
    }
    
    
}
