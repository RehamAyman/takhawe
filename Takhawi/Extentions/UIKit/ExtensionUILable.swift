//
//  ExtensionUILable.swift
//  Masar Ebdaa
//
//  Created by abdullah tarek on 12/10/2021.
//

import Foundation
import UIKit

extension UILabel {
    func underLine(fontSide: CGFloat? = 12) {
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue,
                                  NSAttributedString.Key.font: UIFont(name: AppFont.Demi.rawValue, size: fontSide ?? 12)!
        ] as [NSAttributedString.Key: Any]

        let underlineAttributedString = NSAttributedString(string: self.text ?? "", attributes: underlineAttribute)
        self.attributedText = underlineAttributedString
    }
}
