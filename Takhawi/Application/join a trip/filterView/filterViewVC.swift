//
//  filterViewVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 30/11/2023.
//
//  Template by MGAbouarab®


import UIKit

class filterViewVC: BaseVC {
    
//MARK: - IBOutlets -
    
    
//MARK: - Properties -
    
    
//MARK: - Creation -
    static func create() -> filterViewVC {
        let vc = AppStoryboards.<#StoryboardCase#>.instantiate(filterViewVC.self)
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
extension filterViewVC {
    
}

//MARK: - Routes -
extension filterViewVC {
    
}
