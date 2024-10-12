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
    @IBOutlet weak var massage: UIImageView!
    @IBOutlet weak var backScreen: UIImageView!
    
    @IBOutlet weak var backscView: UIView!
    @IBOutlet weak var blutooth: UIImageView!
    @IBOutlet weak var bags: UIImageView!
    @IBOutlet weak var heating: UIImageView!
    @IBOutlet weak var chargingIcon: UIImageView!
    @IBOutlet weak var horStackView: UIStackView!
    
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
    let scrollView = UIScrollView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainView.layer.addBasicShadow(cornerRadius: 20 )
       
    }
    
    func makeStackViewScrollable () {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
                backscView.addSubview(scrollView)
                
                // Set scrollView constraints to match the main view's size
                NSLayoutConstraint.activate([
                    scrollView.leadingAnchor.constraint(equalTo: backscView.leadingAnchor),
                    scrollView.trailingAnchor.constraint(equalTo: backscView.trailingAnchor),
                    scrollView.topAnchor.constraint(equalTo: backscView.topAnchor),
                    scrollView.bottomAnchor.constraint(equalTo: backscView.bottomAnchor)
                ])
                
                // Setup contentView (the view that will scroll horizontally)
                contentView.translatesAutoresizingMaskIntoConstraints = false
                scrollView.addSubview(contentView)
                
                // Set constraints for contentView (inside the scrollView)
                NSLayoutConstraint.activate([
                    contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                    contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                    contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                    contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                    contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)  // Lock the height to the scrollView's height
                ])
                
                // Now we add dynamic width to contentView for horizontal scrolling
                // For example, let's assume the total width of contentView is 1500
                contentView.widthAnchor.constraint(equalToConstant: 1500).isActive = true
                
                // Add subviews to contentView for demonstration
               
              
              // Add items to the stack view
             
          }

}
