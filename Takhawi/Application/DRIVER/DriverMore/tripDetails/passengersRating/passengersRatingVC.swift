//
//  passengersRatingVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 17/04/1446 AH.
//
//  Template by MGAbouarab®


import UIKit

class passengersRatingVC: BaseVC {
    
//MARK: - IBOutlets -
    
    
//MARK: - Properties -
    
    
//MARK: - Creation -
    static func create() -> passengersRatingVC {
        let vc = AppStoryboards.<#StoryboardCase#>.instantiate(passengersRatingVC.self)
        vc.hidesBottomBarWhenPushed = true
        return vc
    }
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension passengersRatingVC {
    
}

//MARK: - Routes -
extension passengersRatingVC {
    
}
