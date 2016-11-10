//
//  UIViewExtensions.swift
//  CMGuide
//
//  Created by NhaiBui on 11/4/16.
//  Copyright © 2016 Children's Mercy. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set(newValue) {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set(newValue) {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var masksToBounds: Bool {
        get {
            return layer.masksToBounds
        }
        set(newValue) {
            layer.masksToBounds = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set(newValue) {
            layer.borderColor = newValue?.cgColor
        }
    }
}
