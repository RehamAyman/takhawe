//
//  editProfileVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 06/01/2024.
//
//  Template by MGAbouarab®


import UIKit
import MaterialComponents

class editProfileVC: BaseVC {
    
//MARK: - IBOutlets -
    @IBOutlet weak var profileIcon: UIImageView!
    
    @IBOutlet weak var FavouritesTextArea: MDCOutlinedTextArea!
    @IBOutlet weak var hobbies: MDCOutlinedTextField!
    @IBOutlet weak var genderText: MDCOutlinedTextField!
    @IBOutlet weak var phoneNumber: MDCOutlinedTextField!
    @IBOutlet weak var cityText: MDCOutlinedTextField!
    @IBOutlet weak var birthdateText: MDCOutlinedTextField!
    @IBOutlet weak var emailTextField: MDCOutlinedTextField!
    @IBOutlet weak var name: MDCOutlinedTextField!
    
//MARK: - Properties -
    
    
//    var dummyHobbies : [dummyActivity] = [
//        dummyActivity(icon: "horse-running-silhouette 1", name: "Riding Horse".localize) ,
//      dummyActivity(icon: "music-note 13", name: "Listen to music".localize) ,
//        dummyActivity(icon: "_x31_4_26_", name: "Basketball".localize) ,
//      dummyActivity(icon: "art 1", name: "Drawing")
//    ]
    
    
    
    
//
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
     
  self.handleTextfields()
      //  self.birthDayAction()
       // collectionview.delegate = self
      //  collectionview.dataSource = self
       // collectionview.register(cellType: hobbiesCellCollectionViewCell.self)
        
        
    
        
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension editProfileVC {
    
}

//MARK: - Routes -
extension editProfileVC {
    
}
