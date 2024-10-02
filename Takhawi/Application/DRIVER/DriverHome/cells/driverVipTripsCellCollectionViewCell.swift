//
//  driverVipTripsCellCollectionViewCell.swift
//  Takhawi
//
//  Created by Reham Ayman on 22/03/1446 AH.
//

import UIKit
import Cosmos

class driverVipTripsCellCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    
   
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var smocking: UIImageView!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var userPhoto: UIImageView!
    @IBOutlet weak var userRate: CosmosView!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var ac: UIImageView!
    @IBOutlet weak var food: UIImageView!
    @IBOutlet weak var music: UIImageView!
    
    @IBOutlet weak var ignore: UIButton!
    @IBOutlet weak var showDetails: UIButton!
    @IBOutlet weak var wifi: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.addBasicShadow(cornerRadius: 20 )
    }

}
