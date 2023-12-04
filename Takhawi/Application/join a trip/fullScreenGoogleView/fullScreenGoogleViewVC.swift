//
//  fullScreenGoogleViewVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 01/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class fullScreenGoogleViewVC: BaseVC {
    
//MARK: - IBOutlets -
    
    
//MARK: - Properties -
    
    
//MARK: - Creation -
    static func create() -> fullScreenGoogleViewVC {
        let vc = AppStoryboards.<#StoryboardCase#>.instantiate(fullScreenGoogleViewVC.self)
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
extension fullScreenGoogleViewVC {
    
}

//MARK: - Routes -
extension fullScreenGoogleViewVC {
    
}
