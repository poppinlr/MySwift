//
//  RestaurantTableViewCell.swift
//  shareAndDeleteFoodPin
//
//  Created by 沈卓晨 on 15/7/2.
//  Copyright (c) 2015年 poppinlr. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    
    @IBOutlet weak var RestaurantImage:UIImageView!
    @IBOutlet weak var RestautantName:UILabel!
    @IBOutlet weak var RestautantLocation:UILabel!
    @IBOutlet weak var RestautantType:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
