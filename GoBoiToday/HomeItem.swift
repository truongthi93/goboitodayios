//
//  HomeItem.swift
//  CMGuide
//
//  Created by NhaiBui on 11/4/16.
//  Copyright © 2016 Children's Mercy. All rights reserved.
//

import UIKit

class HomeItem: NSObject {
    var mTitle :String
    var mDescription: String
    var isCallable: String
    var iconBackgroudColor: String

    init(title: String, description: String, isCall: String, iconBackgroudColor: String) {
        self.mTitle = title
        self.mDescription = description
        self.isCallable = isCall
        self.iconBackgroudColor = iconBackgroudColor
    }
    
    
}
