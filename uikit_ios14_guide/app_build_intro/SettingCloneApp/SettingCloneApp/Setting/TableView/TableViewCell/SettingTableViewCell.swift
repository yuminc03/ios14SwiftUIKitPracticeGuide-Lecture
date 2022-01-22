//
//  SettingTableViewCell.swift
//  SettingCloneApp
//
//  Created by Chu Yu Min on 2022/01/18.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var bottomTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        topTitleLabel.textColor = .systemBlue
        topTitleLabel.font = .systemFont(ofSize: 20)
        bottomTitleLabel.textColor = .systemGray
        bottomTitleLabel.font = .systemFont(ofSize: 14)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
