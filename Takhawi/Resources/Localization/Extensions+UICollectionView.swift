//
//  Extensions+UICollectionView.swift
//  Veterinary
//
//  Created by Mohammed Abouarab on 08/12/2021.
//

import UIKit

extension UICollectionViewFlowLayout {
    open override var flipsHorizontallyInOppositeLayoutDirection: Bool {
        return Language.isRTL() ? true : false
    }
}
