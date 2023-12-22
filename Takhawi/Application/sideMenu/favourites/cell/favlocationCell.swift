//
//  favlocationCell.swift
//  Takhawi
//
//  Created by Mac on 21/12/2023.
//

import UIKit

class favlocationCell: UITableViewCell {
    @IBOutlet weak var cellTitle: UILabel!
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var favIcon: UIImageView!
    @IBOutlet weak var cellSubTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        self.mainView.layer.addBasicShadow(cornerRadius: 10)
        
    }

 
    
}
