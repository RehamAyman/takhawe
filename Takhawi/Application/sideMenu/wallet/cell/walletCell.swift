//
//  walletCell.swift
//  Takhawi
//
//  Created by Mac on 21/12/2023.
//

import UIKit

class walletCell: UITableViewCell {
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var icon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
        self.mainView.layer.addBasicShadow(cornerRadius: 10 )
    }

    
    
}
