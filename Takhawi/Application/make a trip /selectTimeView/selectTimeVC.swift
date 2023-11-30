//
//  selectTimeVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 29/11/2023.
//
//  Template by MGAbouarab®


import UIKit

class selectTimeVC: BaseVC {
    
//MARK: - IBOutlets -
    
    
//MARK: - Properties -
    
    
//MARK: - Creation -
    static func create() -> selectTimeVC {
        let vc = AppStoryboards.<#StoryboardCase#>.instantiate(selectTimeVC.self)
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
extension selectTimeVC {
    
}

//MARK: - Routes -
extension selectTimeVC {
    
}
