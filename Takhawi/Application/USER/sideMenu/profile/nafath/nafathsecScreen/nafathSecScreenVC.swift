//
//  nafathSecScreenVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 20/08/1446 AH.
//
//  Template by MGAbouarab®


import UIKit

class nafathSecScreenVC: BaseVC {
    
//MARK: - IBOutlets -
    
    
//MARK: - Properties -
    
    
//MARK: - Creation -
    static func create() -> nafathSecScreenVC {
        let vc = AppStoryboards.<#StoryboardCase#>.instantiate(nafathSecScreenVC.self)
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
extension nafathSecScreenVC {
    
}

//MARK: - Routes -
extension nafathSecScreenVC {
    
}
