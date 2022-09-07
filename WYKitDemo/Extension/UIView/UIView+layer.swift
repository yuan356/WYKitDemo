//
//  UIView+layer.swift
//
//  Created by Will on 2021/3/12.
//

import UIKit

extension UIView {
    
    func rounded(radius: CGFloat) {
        layer.cornerRadius = radius
    }
    
    func roundedTop() {
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    func roundedBottom() {
        layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func roundedAllCorners() {
        layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    func border(width: CGFloat, color: CGColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color
    }
    
    func shadow(offset: CGSize, radius: CGFloat, color: CGColor, opacity: Float = 1) {
        self.clipsToBounds = false
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowColor = color
    }
    
    func removeFromSuperviewWithFadeOut() {
        UIView.animate(withDuration: 0.15, animations: { self.alpha = 0.0 }) { (done: Bool) in
            self.removeFromSuperview()
        }
    }

}
