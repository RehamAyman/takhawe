//
//  firstAuthCell.swift
//  Takhawi
//
//  Created by Mac on 22/12/2023.
//

import UIKit
import MaterialComponents
import CollectionViewPagingLayout

class firstAuthCell: UICollectionViewCell {

    @IBOutlet weak var emailTextField: MDCOutlinedTextField!
    override func awakeFromNib() {
        super.awakeFromNib()

    }

}


extension firstAuthCell : ScaleTransformView {
    var scaleOptions: ScaleTransformViewOptions {
        ScaleTransformViewOptions(
            minScale: 0.6,
            scaleRatio: 0.4,
            translationRatio: CGPoint(x: 0.66, y: 0.2),
            maxTranslationRatio: CGPoint(x: 2, y: 0)
            )
    }
}
