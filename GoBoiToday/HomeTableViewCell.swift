//
//  HomeTableViewCell.swift
//  CMGuide
//
//  Copyright © 2016 Children's Mercy. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var callButtonViewOuter: UIView!
    @IBOutlet weak var imgNext: UIImageView!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var callButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        layoutMargins = UIEdgeInsetsMake(8, 0, 8, 0)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  }
