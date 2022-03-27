//
//  MyTodoTableViewCell.swift
//  MyTodoList
//
//  Created by Chu Yu Min on 2022/03/07.
//

import UIKit

class MyTodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var topTitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var separator: UIView!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
