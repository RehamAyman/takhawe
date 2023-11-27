//
//  reviewsViewVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 26/11/2023.
//
//  Template by MGAbouarab®


import UIKit

class reviewsViewVC: BaseVC {
    
//MARK: - IBOutlets -
    
    
//MARK: - Properties -
    
    
//MARK: - Creation -
    static func create() -> reviewsViewVC {
        let vc = AppStoryboards.<#StoryboardCase#>.instantiate(reviewsViewVC.self)
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
extension reviewsViewVC {
    
}

//MARK: - Routes -
extension reviewsViewVC {
    
}
