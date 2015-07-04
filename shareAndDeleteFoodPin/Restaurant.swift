//
//  Restaurant.swift
//  shareAndDeleteFoodPin
//
//  Created by 沈卓晨 on 15/7/4.
//  Copyright (c) 2015年 poppinlr. All rights reserved.
//

import Foundation

class Restaurant {
    var image:String!
    var name:String!
    var location:String!
    var type:String!
    var isVisited = false
    
    init(name:String,type:String,location:String,image:String,isVisited:Bool){
        self.image = image
        self.name = name
        self.location = location
        self.type = type
        self.isVisited = isVisited
    }
}