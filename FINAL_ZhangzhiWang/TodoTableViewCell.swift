//
//  TodoTableViewCell.swift
//  FINAL_ZhangzhiWang
//
//  Created by Zhangzhi Wang on 2023-04-19.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    
    @IBOutlet weak var itemIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("todosomething")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
