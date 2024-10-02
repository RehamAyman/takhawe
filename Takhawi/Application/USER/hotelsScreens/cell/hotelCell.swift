//
//  hotelCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/12/2023.
//

import UIKit
import Cosmos

class hotelCell: UITableViewCell {

  
    @IBOutlet weak var nightCount: UILabel!
    @IBOutlet weak var price: UILabel!
    
    @IBOutlet weak var hotelImage: UIImageView!
    
    @IBOutlet weak var hotelName: UILabel!
    
    @IBOutlet weak var rate: CosmosView!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
