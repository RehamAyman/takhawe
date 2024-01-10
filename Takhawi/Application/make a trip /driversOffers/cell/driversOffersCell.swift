//
//  driversOffersCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/11/2023.
//

import UIKit
import Cosmos

class driversOffersCell: UITableViewCell {

    @IBOutlet weak var driverRate: CosmosView!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var driverPhoto: UIImageView!
    @IBOutlet weak var mainView: UIView!
    var action: (() -> Void)?
    var cancel: (() -> Void)?
    
    
    
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
