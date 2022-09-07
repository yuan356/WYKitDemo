//
//  UIView+initXibView.swift
//
//  Created by Will on 2021/3/26.
//

import UIKit

extension UIView {
    func initXibView() {
        let thisType = type(of: self)
        if let view = Bundle(for: thisType).loadNibNamed(String(describing: thisType.self), owner: self, options: nil)?.first as? UIView {
            self.addSubview(view)
            view.fillSuperview()
        }
    }
}
