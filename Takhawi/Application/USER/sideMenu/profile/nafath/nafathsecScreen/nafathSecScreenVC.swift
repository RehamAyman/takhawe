//
//  nafathSecScreenVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 20/08/1446 AH.
//
//  Template by MGAbouarab®


import UIKit

class nafathSecScreenVC: BaseVC {
    
//MARK: - IBOutlets -
    
    
    @IBOutlet weak var sheildView: UIView!
    //MARK: - Properties -
    
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.sheildView.layer.addBasicShadow(cornerRadius: 15)
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension nafathSecScreenVC {
    
}

//MARK: - Routes -
extension nafathSecScreenVC {
    
}
