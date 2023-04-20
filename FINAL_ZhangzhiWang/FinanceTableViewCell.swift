//
//  FinanceTableViewCell.swift
//  FINAL_ZhangzhiWang
//
//  Created by Zhangzhi Wang on 2023-04-20.
//

import UIKit

class FinanceTableViewCell: UITableViewCell {

    @IBOutlet weak var itemIcon: UIImageView!
    @IBOutlet weak var itemTitle: UILabel!
    
    @IBOutlet weak var itemDesc: UILabel!
    
    @IBOutlet weak var itemAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
