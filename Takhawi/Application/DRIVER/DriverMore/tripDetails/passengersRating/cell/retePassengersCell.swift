//
//  retePassengersCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 17/04/1446 AH.
//

import UIKit
import MaterialComponents

class retePassengersCell: UITableViewCell {
    @IBOutlet weak var noteTextView: MDCOutlinedTextArea!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       // self.noteTextView.label.text = "Note".localize 
        self.noteTextView.label.text  = "Note".localize
        self.noteTextView.handelCellTextArea(placeHolder: "Note".localize)
        self.selectionStyle = .none
       
    }

 
    
}
