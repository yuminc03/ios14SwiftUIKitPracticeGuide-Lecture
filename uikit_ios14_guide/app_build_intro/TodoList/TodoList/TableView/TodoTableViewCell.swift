//
//  TodoTableViewCell.swift
//  TodoList
//
//  Created by Chu Yu Min on 2022/03/01.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
