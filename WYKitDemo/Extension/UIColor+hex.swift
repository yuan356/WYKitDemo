//
//  UIColor+hex.swift
//
//  Created by Will on 2021/7/29.
//

import UIKit

extension UIColor {
    
    static func hex(_ code: String, alpha: CGFloat = 1.0) -> UIColor {
        var code = code
        if let first = code.first {
            if first == "#" {
                code = String(code.dropFirst())
            }
        }
        
        if code.count == 6 {
            var rgbValue: UInt64 = 0
            Scanner(string: code).scanHexInt64(&rgbValue)

            let r = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
            let g = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
            let b = CGFloat(rgbValue & 0x0000FF) / 255.0
            return UIColor(red: r, green: g, blue: b, alpha: alpha)
        }
        return UIColor(red: 255, green: 255, blue: 255, alpha: alpha)
    }

}
