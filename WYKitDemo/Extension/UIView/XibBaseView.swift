//
//  XibBaseView.swift
//  CAFFECOIN
//
//  Created by Will on 2021/6/16.
//  Copyright © 2021 DaidoujiChen. All rights reserved.
//

import UIKit

class XibBaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initXibView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initXibView()
    }

}
