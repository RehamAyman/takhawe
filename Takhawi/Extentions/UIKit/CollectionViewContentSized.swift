//
//  CollectionViewContentSized.swift
//  WritingService
//
//  Created by Sara Mady on 20/03/2023.
//

import Foundation
import UIKit

class CollectionViewContentSized: UICollectionView {
    override var contentSize: CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
        }
    }

    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}
