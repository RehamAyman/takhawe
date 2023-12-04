//
//  hotelsVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 04/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class hotelsVC: BaseVC {
    
//MARK: - IBOutlets -
    
    
//MARK: - Properties -
    
    
//MARK: - Creation -
    static func create() -> hotelsVC {
        let vc = AppStoryboards.<#StoryboardCase#>.instantiate(hotelsVC.self)
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
extension hotelsVC {
    
}

//MARK: - Routes -
extension hotelsVC {
    
}
