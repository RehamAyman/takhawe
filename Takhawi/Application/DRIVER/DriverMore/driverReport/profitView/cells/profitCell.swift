//
//  profitCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 12/04/1446 AH.
//

import UIKit
import Cosmos

class profitCell: UITableViewCell {
    @IBOutlet weak var from: UILabel!
    
    @IBOutlet weak var rate: CosmosView!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.addBasicShadow(cornerRadius: 12)
    }


    
}
