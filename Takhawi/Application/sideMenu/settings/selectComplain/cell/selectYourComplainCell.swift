//
//  selectYourComplainCell.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//

import UIKit
import Lottie

class selectYourComplainCell: UITableViewCell {
    @IBOutlet weak var complainLabel: UILabel!
    @IBOutlet weak var checkBox: LottieAnimationView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        checkBox.contentMode = .scaleAspectFit
        checkBox.loopMode = .playOnce
        checkBox.animationSpeed = 0.9
    }


    
}
