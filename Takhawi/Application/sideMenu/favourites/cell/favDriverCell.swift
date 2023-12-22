//
//  favDriverCell.swift
//  Takhawi
//
//  Created by Mac on 21/12/2023.
//

import UIKit

class favDriverCell: UITableViewCell {
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var reviewsLabel: UILabel!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var driverProfile: UIImageView!
    @IBOutlet weak var favIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.mainView.layer.addBasicShadow(cornerRadius: 10)


    }

    
}
