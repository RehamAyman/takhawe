//
//  UITextViewExtesion.swift
//  WritingService
//
//  Created by Sara Mady on 01/05/2023.
//

import Foundation
import UIKit

extension UITextView {
    func adjustUITextViewHeight() {
//        self.translatesAutoresizingMaskIntoConstraints = true
        self.sizeToFit()
        self.isScrollEnabled = false
    }
}
