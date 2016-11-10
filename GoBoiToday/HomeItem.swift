//
//  HomeItem.swift
//  CMGuide
//
//  Created by NhaiBui on 11/4/16.
//  Copyright © 2016 Children's Mercy. All rights reserved.
//

import UIKit

class HomeItem: NSObject {
    let mTitle :String
    let mDescription: String
    let isCall: Bool
    
    init(title: String, description: String, isCall: Bool) {
        self.mTitle = title
        self.mDescription = description
        self.isCall = isCall
    }
}
