//
//  reserveTheTripCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 27/11/2023.
//

import UIKit
import Lottie



class reserveTheTripCell: UITableViewCell {

   @IBOutlet weak var checkMarkView: LottieAnimationView!
    @IBOutlet weak var hint: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var iconimage: UIImageView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        checkMarkView.contentMode = .scaleAspectFit
         
        checkMarkView.loopMode = .playOnce
         
        checkMarkView.animationSpeed = 0.5
   
  
    }
    
  
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    
}
