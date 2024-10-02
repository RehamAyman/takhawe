//
//  notificationCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 16/12/2023.
//

import UIKit

class notificationCell: UITableViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var cellTitle: UILabel!
    
    @IBOutlet weak var subTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

   
    
}
