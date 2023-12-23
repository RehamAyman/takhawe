//
//  selectComplainVC.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class selectComplainVC: BaseVC {
    
    //MARK: - IBOutlets -
    
    
    //MARK: - Properties -
    
    
    //MARK: - Creation -
    static func create() -> selectComplainVC {
        let vc = AppStoryboards.<#StoryboardCase#>.instantiate(selectComplainVC.self)
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
extension selectComplainVC {
    
}

//MARK: - Routes -
extension selectComplainVC {
    
}
