//
//  cardsCell.swift
//  Takhawi
//
//  Created by Mac on 21/12/2023.
//

import UIKit
import CollectionViewPagingLayout

class cardsCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}


extension cardsCell : ScaleTransformView {
    var scaleOptions: ScaleTransformViewOptions {
        ScaleTransformViewOptions(
            minScale: 0.6,
            scaleRatio: 0.4,
            translationRatio: CGPoint(x: 0.66, y: 0.2),
            maxTranslationRatio: CGPoint(x: 2, y: 0)
            )
    }
    
}

