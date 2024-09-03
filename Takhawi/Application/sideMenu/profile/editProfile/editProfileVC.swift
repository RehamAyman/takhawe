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
    
    @IBOutlet weak var selectCityId: UIButton!
    @IBOutlet weak var selectGenderOutlet: UIButton!
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
    var action: (() -> Void)?
    var profileData : profileResult?
    
    var hobbiesArray : [HobbiesClass] = []
    var mainHobbies : [HobbiesClass] = []

    var genders : [String] = ["Male" , "Female"]
    var allCities : [CitiesResult] = []
    var selectedCityId : Int = 0 
    var profileImageDate : Data?
    
//
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.handleOpenListAction()
        self.getAllBobbies()
        self.selectGender(button: self.selectGenderOutlet , textField: self.genderText)
        self.getAllCities()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: hobbiesCellCollectionViewCell.self )
        self.setUpMainView()
        
    
           
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    @IBAction func updatePro(_ sender: UIButton) {
        self.updateMyProfile()
    }
    
}


//MARK: - Networking -
extension editProfileVC {
    
}

//MARK: - Routes -
extension editProfileVC {
    
}
