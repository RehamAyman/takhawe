//
//  driverVipTripsCellCollectionViewCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 22/03/1446 AH.
//

import UIKit

class driverVipTripsCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.addBasicShadow(cornerRadius: 20 )
    }

}
