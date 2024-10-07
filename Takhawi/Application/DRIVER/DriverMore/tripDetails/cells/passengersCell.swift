//
//  passengersCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 01/04/1446 AH.
//

import UIKit
import Cosmos

class passengersCell: UITableViewCell {

    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var passengerName: UILabel!
    @IBOutlet weak var passengerImage: UIImageView!
    
    @IBOutlet weak var arraivedOutlet: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    
}
