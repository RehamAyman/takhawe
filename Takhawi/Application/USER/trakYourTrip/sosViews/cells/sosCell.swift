//
//  sosCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 19/07/1446 AH.
//

import UIKit

class sosCell: UITableViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        self.mainView.layer.addBasicShadow(cornerRadius: 10)
        
    }


    
}
