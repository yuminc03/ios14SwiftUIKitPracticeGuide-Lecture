//
//  NextTableViewCell.swift
//  SettingCloneApp
//
//  Created by Chu Yu Min on 2022/01/22.
//

import UIKit

class NextTableViewCell: UITableViewCell {
    
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView! {
        didSet {
            rightImageView.image = UIImage(systemName: "chevron.right")
        }
    }
    
}
