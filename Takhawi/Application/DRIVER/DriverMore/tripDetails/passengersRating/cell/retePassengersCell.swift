//
//  retePassengersCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 17/04/1446 AH.
//

import UIKit
import MaterialComponents
import Cosmos

class retePassengersCell: UITableViewCell {
    @IBOutlet weak var noteTextView: MDCOutlinedTextArea!
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userRate: CosmosView!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       // self.noteTextView.label.text = "Note".localize 
        self.noteTextView.label.text  = "Note".localize
        self.noteTextView.handelCellTextArea(placeHolder: "Note".localize)
        self.selectionStyle = .none
       
    }

 
    
}
