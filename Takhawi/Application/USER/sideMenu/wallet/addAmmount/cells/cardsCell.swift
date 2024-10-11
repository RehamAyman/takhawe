//
//  cardsCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 07/04/1446 AH.
//

import UIKit

class cardsCell: UITableViewCell {
    @IBOutlet weak var visaIcon: UIImageView!
    @IBOutlet weak var visaExpirationDate: UILabel!
    
    @IBOutlet weak var visaNumbers: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var actionIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.addBasicShadow(cornerRadius: 15)
    }

    
}
