//
//  RestaurantDetailCellTableViewCell.swift
//  shareAndDeleteFoodPin
//
//  Created by 沈卓晨 on 15/7/3.
//  Copyright (c) 2015年 poppinlr. All rights reserved.
//

import UIKit

class RestaurantDetailCellTableViewCell: UITableViewCell {

    @IBOutlet weak var fieldLabel:UILabel!
    @IBOutlet weak var valueLabel:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
