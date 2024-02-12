//
//  driverProfileVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 19/10/2023.
//
//  Template by MGAbouarab®


import UIKit
import GoogleMaps


class driverProfileVC: BaseVC {
    
    @IBOutlet weak var driverContainerView: UIView!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var BottomcontainerStack: UIStackView!
    //MARK: - IBOutlets -
    @IBOutlet weak var tripCountLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var chenldirenContainerView: UIView!
    @IBOutlet weak var numberOfChildrenText: UITextField!
    @IBOutlet weak var googleView: GMSMapView!
    @IBOutlet weak var containerView: UIView!
    
//MARK: - Properties -
    var dummyActivty : [dummyActivity] = [
        dummyActivity(icon: "Group 1", name: "Basketball".localize) ,
        dummyActivity(icon: "03-hat", name: "Riding Horse".localize) ,
        dummyActivity(icon: "paint-palette 1", name: "Drawing".localize) ,
        dummyActivity(icon: "music 1", name: "Listen to music".localize) ,
        dummyActivity(icon: "airplane-around-earth 1", name: "Travelling".localize)
    ]

    var animatePolyline: AnimatePolyline?
    var isDriverAcc : Bool = false
    
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
   
    }

    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
         self.containerView.layer.addBasicShadow(cornerRadius: 35)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.register(cellType: profileCell.self)
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.googleView.layer.addBasicShadow(cornerRadius: 30)
        self.setUpGoogleView()
        self.tripCountLabel.cornerRadius = 17
        self.tripCountLabel.layer.masksToBounds = true 
        self.numberOfChildrenText.layer.addBasicShadow(cornerRadius: 22.5)
        self.numberOfChildrenText.setLeftPaddingPoints(8)
        self.numberOfChildrenText.setRightPaddingPoints(8)
// force the bottom view  to be in the left according to client requirement
        self.BottomcontainerStack.semanticContentAttribute = .forceLeftToRight
        if isDriverAcc {
            self.mainStack.removeArrangedSubview(self.BottomcontainerStack)
            self.mainStack.removeArrangedSubview(self.chenldirenContainerView)
            self.BottomcontainerStack.removeFromSuperview()
            self.chenldirenContainerView.removeFromSuperview()
        } else {
            self.mainStack.removeArrangedSubview(self.driverContainerView)
            self.driverContainerView.removeFromSuperview()
        }
    
        
    }
    
//MARK: - Logic Methods -
    
  
//MARK: - Actions -
    
    
    
    @IBAction func reserveYourSeatAction(_ sender: UIButton) {
        
            let vc = ReserveTheTripVC()
            self.push(vc)
       
    }
    
    @IBAction func fullGoogleView(_ sender: UIButton) {
        let vc = fullScreenGoogleViewVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc , animated: true )
    }
    
    
    
    @IBAction func reviewsAction(_ sender: UIButton) {
    //    sender.animateButtonWhenPressed {
            self.push(reviewsViewVC())
    //    }
        
        
        
        
        
        
    }
    
}


//MARK: - Networking -
extension driverProfileVC {
    
}

//MARK: - Routes -
extension driverProfileVC {
    
}
