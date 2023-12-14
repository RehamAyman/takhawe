//
//  reportOrCandelCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 14/12/2023.
//

import UIKit

class reportOrCandelCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var checkBox: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
