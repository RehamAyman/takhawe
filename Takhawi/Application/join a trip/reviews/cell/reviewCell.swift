//
//  reviewCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 26/11/2023.
//

import UIKit
import Cosmos


class reviewCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var userrate: CosmosView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        mainView.layer.addBasicShadow(cornerRadius: 10)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
