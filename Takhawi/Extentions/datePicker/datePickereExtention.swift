//
//  datePickereExtention.swift
//  Takhawi
//
//  Created by Reham Ayman on 27/02/1446 AH.
//

import UIKit


extension UIDatePicker {
    /// Sets a custom font for all `UILabel` subviews of the date picker.
    /// - Parameter font: The custom font to be applied.
    func setCustomFont(_ font: UIFont) {
        for subview in self.subviewsRecursive() {
            if let label = subview as? UILabel {
                label.font = font
            }
        }
    }

    /// Recursively traverses all subviews to find `UILabel` elements.
    /// - Returns: An array of all subviews.
    private func subviewsRecursive() -> [UIView] {
        var allSubviews = [UIView]()
        func getSubview(view: UIView) {
            allSubviews.append(view)
            guard view.subviews.count > 0 else { return }
            view.subviews.forEach { getSubview(view: $0) }
        }
        getSubview(view: self)
        return allSubviews
    }
}
