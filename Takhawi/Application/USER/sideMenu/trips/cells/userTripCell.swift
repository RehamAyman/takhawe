//
//  userTripCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 09/03/1446 AH.
//

import UIKit
import Cosmos


class userTripCell: UITableViewCell {
    @IBOutlet weak var dividerView: UIView!
    
    @IBOutlet weak var tripNumber: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var from: UILabel!

    @IBOutlet weak var rateView: CosmosView!
    @IBOutlet weak var doneView: UIImageView!
    @IBOutlet weak var doneLabel: UILabel!
    @IBOutlet weak var orderDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.mainView.layer.addBasicShadow(cornerRadius: 10)
        self.userImage.layer.addBasicShadow(cornerRadius: 25 )
    }

  
    
}
