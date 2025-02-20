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
    
    
    @IBOutlet weak var nafathLogo: UIImageView!
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
        nafathLogo.addTapGesture {
            self.showSuccessPop()
        }
        
        sheildView.addTapGesture {
            self.showFailerPop()
        }
        
    }
    
//MARK: - Logic Methods -
    
    //MARK:- FIRE THIS CODE IN SUCCESS
    
    private func showSuccessPop () {
        showPopTopAlert(title: "Done".localize , withMessage: "Your account has been successfully verified.".localize , success: true )
    }
    
    
    //MARK:- FIRE THIS CODE IN FAILER
    private func showFailerPop () {
        showPopTopAlert(title: "Error!".localize , withMessage: "Authentication failed".localize , success: false  )
    }
    
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension nafathSecScreenVC {
    
}

//MARK: - Routes -
extension nafathSecScreenVC {
    
}
