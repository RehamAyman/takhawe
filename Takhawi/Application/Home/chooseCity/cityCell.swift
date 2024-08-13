//
//  cityCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/08/2024.
//

import UIKit

class cityCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var mainView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.addBasicShadow(cornerRadius: 10)
    }

   
  
    
}
