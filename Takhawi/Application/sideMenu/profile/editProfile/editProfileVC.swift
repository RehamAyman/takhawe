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
    
    @IBOutlet weak var chooseFromMain: UIButton!
    @IBOutlet weak var openHobbiesList: UIView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var FavouritesTextArea: MDCOutlinedTextArea!
    @IBOutlet weak var hobbies: MDCOutlinedTextField!
    @IBOutlet weak var genderText: MDCOutlinedTextField!
    @IBOutlet weak var phoneNumber: MDCOutlinedTextField!
    @IBOutlet weak var cityText: MDCOutlinedTextField!
    @IBOutlet weak var birthdateText: MDCOutlinedTextField!
    @IBOutlet weak var emailTextField: MDCOutlinedTextField!
    @IBOutlet weak var name: MDCOutlinedTextField!
    
//MARK: - Properties -
    
    var profileData : profileResult?
    
    var hobbiesArray : [String] = []
    var mainHobbies : [VehicleClass] = []

    
//
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.handleOpenListAction()
        self.getAllBobbies()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
     
  self.handleTextfields()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: hobbiesCellCollectionViewCell.self )
        self.name.text = self.profileData?.name ?? ""
        self.emailTextField.text = self.profileData?.email ?? ""
        self.birthdateText.text = self.profileData?.birth_date ?? ""
        self.cityText.text = self.profileData?.city ?? ""
        self.phoneNumber.text = self.profileData?.phone ?? ""
        self.genderText.text = self.profileData?.gender ?? ""
        self.FavouritesTextArea.textView.text = self.profileData?.bio ?? ""
        if let image = self.profileData?.avatar {
            self.profileIcon.setImage(image:image )
        }
        self.hobbiesArray =  self.profileData?.hobbies ?? []
        self.collectionView.reloadData()
        if self.profileData?.hobbies?.isEmpty == true  {
            self.collectionViewHeight.constant = 0
        } 
       
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
