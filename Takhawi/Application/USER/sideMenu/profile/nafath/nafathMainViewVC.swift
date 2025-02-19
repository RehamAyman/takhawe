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
    
    
    @IBAction func checkAction(_ sender: UIButton) {
        let vc = nafathSecScreenVC()
        self.present( vc , animated: true )
    }
    
}


//MARK: - Networking -
extension nafathMainViewVC {
    
}

//MARK: - Routes -
extension nafathMainViewVC {
    
}
