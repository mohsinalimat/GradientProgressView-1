//
//  UIColor+Manipulation.swift
//  GradientProgressView
//
//  Created by Sklar, Josh on 10/10/16.
//  Copyright © 2016 StockX. All rights reserved.
//

import UIKit

extension UIColor {
    
    /**
     Returns a darker version of the receiver.
     */
    func darkerColor() -> UIColor {
        let delta: CGFloat = 0.85
        
        if self == .white {
            return UIColor(white: delta, alpha: 1.0)
        }
        
        var hue: CGFloat = 0,
        saturation: CGFloat = 0,
        brightness: CGFloat = 0,
        alpha: CGFloat = 0,
        white: CGFloat = 0
        
        if getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha) {
            return UIColor(hue: hue,
                           saturation: saturation,
                           brightness: brightness * delta,
                           alpha: alpha)
        }
        else if getWhite(&white, alpha: &alpha) {
            return UIColor(white: max(white * delta, 0.0), alpha: alpha)
        }
        else {
            return .black
        }
    }
}
