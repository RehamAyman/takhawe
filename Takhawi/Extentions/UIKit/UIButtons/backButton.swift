//
//  backButton.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//

import UIKit


class BackButton: UIButton {
    
    private let backBtnImage = "BackButton"
    
    // MARK: - override -
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setTitle(nil, for: .normal)
       self.setImage( UIImage(named: "Group 25")?.imageFlippedForRightToLeftLayoutDirection(), for: .normal)
        
        self.addTarget(self, action: #selector(self.action(_:)), for: .touchUpInside)
        
    }
    
    
    @objc func action(_ sender: AnyObject) {
        if self.parentViewController != nil {
            self.parentViewController?.navigationController?.popViewController(animated: true)
        }
    }
}



