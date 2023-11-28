//
//  successBookViewVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/11/2023.
//
//  Template by MGAbouarab®


import UIKit

class successBookViewVC: BaseVC {
    
//MARK: - IBOutlets -
    
    
//MARK: - Properties -
    
    
//MARK: - Creation -
    static func create() -> successBookViewVC {
        let vc = AppStoryboards.<#StoryboardCase#>.instantiate(successBookViewVC.self)
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
extension successBookViewVC {
    
}

//MARK: - Routes -
extension successBookViewVC {
    
}
