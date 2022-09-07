//
//  UILabel+spacing.swift
//
//  Created by Will on 2021/2/20.
//

import UIKit

extension UILabel {

    @IBInspectable
    var letterSpacing: CGFloat {
        set {
            let attributedString: NSMutableAttributedString!
            if let currentAttrString = attributedText {
                attributedString = NSMutableAttributedString(attributedString: currentAttrString)
            }
            else {
                attributedString = NSMutableAttributedString(string: text ?? "")
                text = nil
            }

            attributedString.addAttribute(NSAttributedString.Key.kern,
                                           value: newValue,
                                           range: NSRange(location: 0, length: attributedString.length))
            attributedText = attributedString
        }

        get {
            if let currentLetterSpace = attributedText?.attribute(NSAttributedString.Key.kern, at: 0, effectiveRange: .none) as? CGFloat {
                return currentLetterSpace
            }
            else {
                return 0
            }
        }
    }
    
    func setSpacing(letterSpacing:CGFloat = 0.0, lineSpacing:CGFloat = 0.0, alignment: NSTextAlignment = .left) {
        guard let text = self.text else {
            return
        }
        
        let attrString = NSMutableAttributedString(string: text)
        
        if lineSpacing != 0.0 {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineSpacing
            paragraphStyle.alignment = alignment
            attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
        }
        
        if letterSpacing != 0.0 {
            attrString.addAttribute(NSAttributedString.Key.kern, value: letterSpacing, range: NSMakeRange(0, attrString.length))
        }

        self.attributedText = attrString
    }
    
    func setDeleteLine() {
        guard let text = self.text else { return }
        let textRange = NSMakeRange(0, text.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(.strikethroughStyle, value: NSNumber(value: NSUnderlineStyle.single.rawValue), range: textRange)
        self.attributedText = attributedText
    }
    
    func setUnderLine() {
        guard let text = self.text else { return }
        let textRange = NSMakeRange(0, text.count)
        let attributedText = NSMutableAttributedString(string: text)
        attributedText.addAttribute(NSAttributedString.Key.underlineStyle , value: NSUnderlineStyle.single.rawValue, range: textRange)
        self.attributedText = attributedText
    }
    
}
