//
//  profitCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 12/04/1446 AH.
//

import UIKit

class profitCell: UITableViewCell {

    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.mainView.layer.addBasicShadow(cornerRadius: 12)
        
    }


    
}
