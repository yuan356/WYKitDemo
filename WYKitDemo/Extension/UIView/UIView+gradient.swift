//
//  UIView+gradient.swift
//
//  Created by Will on 2021/10/5.
//

import UIKit

extension UIView {
    /// location 範圍0~1, ex: [0, 0.5]
    func setGradient(colors: [UIColor], locations: [NSNumber]? = nil, start: CGPoint? = nil, end: CGPoint? = nil, layerWidth: CGFloat? = nil) {
        let cgColors = colors.map({ $0.cgColor })
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        if let width = layerWidth {
            gradientLayer.frame.size.width = width
        }
        gradientLayer.colors = cgColors
        gradientLayer.locations = locations
        if let start = start {
            gradientLayer.startPoint = start
        }
        if let end = end {
            gradientLayer.startPoint = end
        }
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
