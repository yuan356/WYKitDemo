//
//  String+ext.swift
//
//  Created by Will on 2021/8/30.
//

import UIKit

extension String {

    func convertToDate(dateFormat: DateFormat) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        let date = dateFormatter.date(from: self)
        return date
    }
    
    func getHeight(withWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }

    func getWidth(withHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)

        return ceil(boundingBox.width)
    }
    
    func transformDashToSlash() -> String {
        self.replacingOccurrences(of: "-", with: "/")
    }
    
    func versionCompare(_ otherVersion: String) -> ComparisonResult {
        return self.compare(otherVersion, options: .numeric)
    }
    
    func textSize(font: UIFont) -> CGSize {
        return self.size(withAttributes: [.font: font])
    }
}
