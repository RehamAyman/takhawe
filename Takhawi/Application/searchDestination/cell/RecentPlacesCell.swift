//
//  RecentPlacesCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 17/10/2023.
//

import UIKit
import Lottie

class RecentPlacesCell: UITableViewCell {
    @IBOutlet weak var checkMark: LottieAnimationView!
    
    @IBOutlet weak var cornerIcon: UIImageView!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var placeName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        checkMark.contentMode = .scaleAspectFit
        checkMark.loopMode = .playOnce
        checkMark.animationSpeed = 0.9
    }

    
    
}
