//
//  SettingMenuTableViewCell.swift
//  SettingCloneApp
//
//  Created by Chu Yu Min on 2022/01/20.
//

import UIKit

class SettingMenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var leftImageView: UIImageView! {
        didSet {
            leftImageView.layer.cornerRadius = 3
        }
    }
    @IBOutlet weak var cellTitleLabel: UILabel!
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
