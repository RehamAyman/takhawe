//
//  driversOffersCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/11/2023.
//

import UIKit
import Cosmos

class driversOffersCell: UITableViewCell {
    @IBOutlet weak var distance: UILabel!
    
    @IBOutlet weak var carName: UILabel!
    @IBOutlet var featureIcons: [UIImageView]!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var driverRate: CosmosView!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var driverPhoto: UIImageView!
    @IBOutlet weak var mainView: UIView!
    var action: (() -> Void)?
    var cancel: (() -> Void)?
    
    @IBOutlet weak var babyIcon: UIImageView!
    @IBOutlet weak var airCondIcon: UIImageView!
    @IBOutlet weak var wifiIcon: UIImageView!
    @IBOutlet weak var musicIcon: UIImageView!
    @IBOutlet weak var smokingIcon: UIImageView!
    @IBOutlet weak var foodicon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        self.mainView.layer.addBasicShadow(cornerRadius: 10)
    }

    
    @IBAction func selectItem(_ sender: UIButton) {
      //  sender.animateButtonWhenPressed {
            self.action?()
       // }
    }
    @IBAction func cancel(_ sender: UIButton) {
    //    sender.animateButtonWhenPressed {
            self.cancel?()
            
      //  }
    }
    
}
