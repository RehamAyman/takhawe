//
//  presentWithBlurEffect.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//

import UIKit



extension BaseVC  {
    func presentWithEffect ( vc : BaseVC ) {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.8//colors.mainColor.rawValue
        blurEffectView.backgroundColor = UIColor(named: colors.mainColor.rawValue)?.withAlphaComponent(0.12)
        blurEffectView.tag = 101
        self.view.addSubview(blurEffectView)
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .overCurrentContext
        self.present( vc , animated: true )
       
        
    }
    
    func removePresentEffect () {
        if let viewWithTag = self.view.viewWithTag(101) {
            viewWithTag.removeFromSuperview()
        }
    }
}
