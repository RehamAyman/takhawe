//
//  filterCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 30/11/2023.
//

import UIKit

class filterCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var checkMark: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
