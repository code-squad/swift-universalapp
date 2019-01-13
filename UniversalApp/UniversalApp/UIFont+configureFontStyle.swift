//
//  UIFont+configureFontStyle.swift
//  UniversalApp
//
//  Created by oingbong on 13/01/2019.
//

import UIKit

extension UIFont {
    func configureFontStyle() -> UIFont {
        if #available(iOS 11.0, *) {
            if let font = UIFont(name: fontName, size: UIFont.systemFontSize) {
                let fontMetrics = UIFontMetrics(forTextStyle: .body)
                return fontMetrics.scaledFont(for: font)
            }
        }
        return UIFont.systemFont(ofSize: UIFont.systemFontSize)
    }
}
