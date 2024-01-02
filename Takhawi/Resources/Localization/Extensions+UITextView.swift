//
//  Extensions+UITextView.swift
//  Veterinary
//
//  Created by Mohammed Abouarab on 08/12/2021.
//

import UIKit

// MARK: - Localization
extension UITextView {
    open override func awakeFromNib() {
        super.awakeFromNib()
        if LocalizationManager.shared.getLanguage() == .Arabic  {
            if textAlignment == .natural {
                self.textAlignment = .right
            }
        } else {
            if textAlignment == .natural {
                self.textAlignment = .left
            }
        }
    }
}

