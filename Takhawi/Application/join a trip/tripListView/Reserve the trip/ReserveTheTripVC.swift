//
//  ReserveTheTripVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 27/11/2023.
//
//  Template by MGAbouarab®


import UIKit

class ReserveTheTripVC: BaseVC {
    
//MARK: - IBOutlets -
    
    
//MARK: - Properties -
    
    
//MARK: - Creation -
    static func create() -> ReserveTheTripVC {
        let vc = AppStoryboards.<#StoryboardCase#>.instantiate(ReserveTheTripVC.self)
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
extension ReserveTheTripVC {
    
}

//MARK: - Routes -
extension ReserveTheTripVC {
    
}
