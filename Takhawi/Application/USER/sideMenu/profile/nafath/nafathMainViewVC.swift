//
//  nafathMainViewVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 20/08/1446 AH.
//
//  Template by MGAbouarab®


import UIKit

class nafathMainViewVC: BaseVC {
    
//MARK: - IBOutlets -
    
    
//MARK: - Properties -
    
    
//MARK: - Creation -
    static func create() -> nafathMainViewVC {
        let vc = AppStoryboards.<#StoryboardCase#>.instantiate(nafathMainViewVC.self)
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
extension nafathMainViewVC {
    
}

//MARK: - Routes -
extension nafathMainViewVC {
    
}
