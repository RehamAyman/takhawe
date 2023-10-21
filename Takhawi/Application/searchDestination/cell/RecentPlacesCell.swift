//
//  RecentPlacesCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 17/10/2023.
//

import UIKit

class RecentPlacesCell: UITableViewCell {

    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var placeName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    
    
}
