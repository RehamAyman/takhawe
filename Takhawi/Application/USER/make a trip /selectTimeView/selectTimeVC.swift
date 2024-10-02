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
    
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var visualView: UIVisualEffectView!
    
//MARK: - Properties -
    
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.mainView.layer.addBasicShadow(cornerRadius: 20)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4 ) {
            self.visualView.isHidden = false
        }
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
