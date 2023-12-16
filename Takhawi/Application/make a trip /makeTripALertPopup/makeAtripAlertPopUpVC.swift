//
//  makeAtripAlertPopUpVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/11/2023.
//
//  Template by MGAbouarab®


import UIKit

class makeAtripAlertPopUpVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var alertImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var visualView: UIVisualEffectView!
    @IBOutlet weak var okOutlet: UIButton!
    
//MARK: - Properties -
    
    var action: (() -> Void)?


// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.okOutlet.layer.addBasicShadow(cornerRadius: 25 )
        self.mainView.layer.addBasicShadow(cornerRadius: 20)
       
        
        
        
     
        
        
        
    }
    
//MARK: - Logic Methods -
    private func openingAnimation () {
        self.mainView.isHidden = true
        UIView.animate(withDuration: 1 ) {
            self.mainView.isHidden = false
            self.view.layoutIfNeeded()
        }
        
        
        
        
        
      
    }
    
//MARK: - Actions -
    
    @IBAction func okAction(_ sender: UIButton) {
        self.dismiss(animated: true )
        self.action?()
    }
    @IBAction func dismissview(_ sender: UIButton) {
        sender.animateButtonWhenPressed {
            self.dismiss(animated: true )
            
        }
    }
}


//MARK: - Networking -
extension makeAtripAlertPopUpVC {
    
}

//MARK: - Routes -
extension makeAtripAlertPopUpVC {
    
}
