//
//  UIView+IBInspectable.swift
//
//  Created by Will on 2021/7/26.
//

import UIKit

extension UIView {
    
    @IBInspectable
        var cornerRadius: CGFloat {
            get { return layer.cornerRadius }
            set { layer.cornerRadius = newValue }
        }
    
    @IBInspectable
        var borderWidth: CGFloat {
            get { return layer.borderWidth }
            set { layer.borderWidth = newValue }
        }
    
    @IBInspectable
        var borderColor: UIColor? {
            get {
                if let color = layer.borderColor { return UIColor(cgColor: color) }
                return nil
            }
            set {
                if let color = newValue { layer.borderColor = color.cgColor }
                else { layer.borderColor = nil }
            }
        }
    
    @IBInspectable
        var shadowRadius: CGFloat {
            get { return layer.shadowRadius }
            set { layer.shadowRadius = newValue }
        }
    
    @IBInspectable
    var shadowOffset : CGSize{
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }
    
    @IBInspectable
        var shadowColor : UIColor {
            get { return UIColor.init(cgColor: layer.shadowColor!) }
            set { layer.shadowColor = newValue.cgColor }
        }
    
    @IBInspectable
    var shadowOpacity : Float {
        get { return layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }
    

    @IBInspectable var topLeft: Bool {
        get { return layer.maskedCorners.contains(.layerMinXMinYCorner) }
        set {
            if newValue {
                layer.maskedCorners.insert(.layerMinXMinYCorner)
            } else {
                layer.maskedCorners.remove(.layerMinXMinYCorner)
            }
        }
    }

    @IBInspectable var topRight: Bool {
        get { return layer.maskedCorners.contains(.layerMaxXMinYCorner) }
        set {
            if newValue {
                layer.maskedCorners.insert(.layerMaxXMinYCorner)
            } else {
                layer.maskedCorners.remove(.layerMaxXMinYCorner)
            }
        }
    }

    @IBInspectable var bottomLeft: Bool {
        get { return layer.maskedCorners.contains(.layerMinXMaxYCorner) }
        set {
            if newValue {
                layer.maskedCorners.insert(.layerMinXMaxYCorner)
            } else {
                layer.maskedCorners.remove(.layerMinXMaxYCorner)
            }
        }
    }

    @IBInspectable var bottomRight: Bool {
        get { return layer.maskedCorners.contains(.layerMaxXMaxYCorner) }
        set {
            if newValue {
                layer.maskedCorners.insert(.layerMaxXMaxYCorner)
            } else {
                layer.maskedCorners.remove(.layerMaxXMaxYCorner)
            }
        }
    }
}
