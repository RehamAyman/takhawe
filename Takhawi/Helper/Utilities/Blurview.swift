//
//  Blurview.swift
//  Thawany
//
//  Created by Ahmed Fathy on 03/01/2023.
//

import UIKit

class BlurView: UIView {
    override  func awakeFromNib() {
        let blur = UIBlurEffect(style: .light) // .extraLight or .dark
        let visual = UIVisualEffectView(effect: blur)

//        visual.layer.opacity = 0.1
        visual.translatesAutoresizingMaskIntoConstraints = false
        insertSubview(visual, at: 0)
        self.frame = visual.frame

//        NSLayoutConstraint.activate([
//            leadingAnchor.constraint(equalTo: visual.leadingAnchor),
//            trailingAnchor.constraint(equalTo: visual.trailingAnchor),
//            topAnchor.constraint(equalTo: visual.topAnchor),
//            bottomAnchor.constraint(equalTo: visual.bottomAnchor)
//        ])
    }
}
