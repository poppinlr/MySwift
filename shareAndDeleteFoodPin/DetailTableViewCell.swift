//
//  DetailTableViewCell.swift
//  shareAndDeleteFoodPin
//
//  Created by 沈卓晨 on 15/7/4.
//  Copyright (c) 2015年 poppinlr. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var field:UILabel!
    @IBOutlet weak var value:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
