//
//  profileVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 17/10/2023.
//
//  Template by MGAbouarab®


import UIKit

class profileVC: BaseVC {
    
//MARK: - IBOutlets -
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    
//MARK: - Properties -
    var hobbies : [HobbiesClass] = []
    var dummyActivty : [dummyActivity] = [
        dummyActivity(icon: "Group 1", name: "Basketball".localize, id: 1) ,
        dummyActivity(icon: "03-hat", name: "Riding Horse".localize, id: 2) ,
        dummyActivity(icon: "paint-palette 1", name: "Drawing".localize, id: 3) ,
        dummyActivity(icon: "music 1", name: "Listen to music".localize, id: 4) ,
        dummyActivity(icon: "airplane-around-earth 1", name: "Travelling".localize, id: 5)
    ]

    var profileData : profileResult?
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.getProfileDetails(withLoader: true )
        
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.setUpMain()
        
    }
    
//MARK: - Logic Methods -
    func setUpMain () {
        self.topView.layer.addBasicShadow(cornerRadius: 15)
        self.bottomView.layer.addBasicShadow(cornerRadius: 15)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.register(cellType: profileCell.self)
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
//MARK: - Actions -
    
    
    @IBAction func editProfileActtion(_ sender: UIButton) {
        let vc = editProfileVC()
        vc.action = {
            self.getProfileDetails(withLoader: false )
        }
        vc.profileData = self.profileData
        self.push(vc)
    }
    
}


//MARK: - Networking -
extension profileVC {
    
    func getProfileDetails (withLoader : Bool) {
        if withLoader {
            activityIndicatorr.startAnimating()
        }
        UserRouter.getProfile.send { [weak self ]  ( response : APIGenericResponse<profileResult> ) in
            guard let self = self else { return }
           
            if let result = response.result {
                
                self.profileData = result
                self.hobbies = result.hobbies ?? []
                if result.avatar?.isValidHttpsUrl() == true  {
                    self.userImage.setImage(image: result.avatar ?? "" )
                }
                
                self.userName.text = result.name ?? ""
                self.collectionView.reloadData()
            }
        }
    }
}

//MARK: - Routes -
extension profileVC {
    
}
