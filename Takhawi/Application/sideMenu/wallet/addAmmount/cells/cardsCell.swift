//
//  cardsCell.swift
//  Takhawi
//
//  Created by Mac on 21/12/2023.
//

import UIKit
//import CollectionViewPagingLayout

class cardsCell: UICollectionViewCell {

    
    
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.mainView.layer.addBasicShadow(cornerRadius: 20 )
    }
    
    

}

//
//extension cardsCell : TransformableView {
//    func transform(progress: CGFloat) {
//        let transform = CGAffineTransform(translationX: bounds.width/2 * progress, y: 0)
//        let alpha = 1 - abs(progress)
//
//        contentView.subviews.forEach { $0.transform = transform }
//        contentView.alpha = alpha
//    }
//}



//extension cardsCell : ScaleTransformView {
//    
//    var scaleOptions: ScaleTransformViewOptions {
//        ScaleTransformViewOptions(
//            minScale: 0.6,
//            scaleRatio: 0.4,
//            translationRatio: CGPoint(x: 0.66, y: 0.2),
//            maxTranslationRatio: CGPoint(x: 2, y: 0 ) 
//            
//            )
//        
//    }
    
   
    
    
    
//}


//
//extension cardsCell : ScaleTransformView {
//    
//    
//    var scaleOptions: ScaleTransformViewOptions {
//        ScaleTransformViewOptions(
//            minScale: 0.6,
//            scaleRatio: 0.4,
//            translationRatio: CGPoint(x: 0.66, y: 0.2),
//            maxTranslationRatio: CGPoint(x: 2, y: 0)
//            )
//    }
//    
//}
