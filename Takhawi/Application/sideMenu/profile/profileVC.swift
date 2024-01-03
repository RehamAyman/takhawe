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
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var bottomView: UIView!
    
//MARK: - Properties -
    
    var dummyActivty : [dummyActivity] = [
        dummyActivity(icon: "Group 1", name: "Basketball".localize) ,
        dummyActivity(icon: "03-hat", name: "Riding Horse".localize) ,
        dummyActivity(icon: "paint-palette 1", name: "Drawing".localize) ,
        dummyActivity(icon: "music 1", name: "Listen to music".localize) ,
        dummyActivity(icon: "airplane-around-earth 1", name: "Travelling".localize)
    ]

// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
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
    
}


//MARK: - Networking -
extension profileVC {
    
}

//MARK: - Routes -
extension profileVC {
    
}
