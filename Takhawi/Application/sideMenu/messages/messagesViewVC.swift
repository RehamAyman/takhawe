//
//  messagesViewVC.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class messagesViewVC: BaseVC {
    
    //MARK: - IBOutlets -
    
    
    //MARK: - Properties -
    
    
    //MARK: - Creation -
    static func create() -> messagesViewVC {
        let vc = AppStoryboards.<#StoryboardCase#>.instantiate(messagesViewVC.self)
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
extension messagesViewVC {
    
}

//MARK: - Routes -
extension messagesViewVC {
    
}
