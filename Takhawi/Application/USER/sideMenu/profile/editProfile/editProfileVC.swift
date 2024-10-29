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
    
    @IBOutlet weak var calendarTAP: UIView!
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
    var selectedBirthDate : Date?
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
    
    @IBAction func deleteProfile(_ sender: UIButton) {
        showAlertWithTwoOptions(on: self, title: "Are You Sure".localize, message: "Are You Sure You Want Delete Your Account".localize , option1: "Yes".localize, option2: "NO".localize, option1Handler: {
            print("Option 1 selected")
            self.deleteMyAcc()
            
        }, option2Handler: {
            print("Option 2 selected")
        })
    }
}




//MARK: - Networking -
extension editProfileVC {
    func deleteMyAcc () {
        activityIndicatorr.startAnimating()
        UserRouter.deleteAcc.send { [weak self]  (response : deleteAccModel )  in
            guard let self = self else { return}
//         if response.status == true {
//                UserDefaults.isLogin = false
//                UserDefaults.user = nil
//                UserDefaults.accessToken = nil
//                let vc = phoneAndLocationVC()
//                let nav = CustomNavigationController(rootViewController: vc)
//                AppHelper.changeWindowRoot(vc: nav)
//         } else {
//             showInfoTopAlert(withMessage: response.message ?? "" )
//         }
        }
        
        UserDefaults.isLogin = false
        UserDefaults.user = nil
        UserDefaults.accessToken = nil
        let vc = phoneAndLocationVC()
        let nav = CustomNavigationController(rootViewController: vc)
        AppHelper.changeWindowRoot(vc: nav)
        
    }
    
}

//MARK: - Routes -
extension editProfileVC {
    
}
