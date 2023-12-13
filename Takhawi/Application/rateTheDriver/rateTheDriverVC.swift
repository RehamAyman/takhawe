//
//  rateTheDriverVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 13/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class rateTheDriverVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var mainView: UIView!
    
//MARK: - Properties -
    
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
//        self.mainView.layer.addBasicShadow(cornerRadius: 20 )
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension rateTheDriverVC {
    
}

//MARK: - Routes -
extension rateTheDriverVC {
    
}
