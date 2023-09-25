//
//  forgetPasswordVCVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//
//  Template by MGAbouarab®


import UIKit

class forgetPasswordVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var emailTextField: UITextField!
    
//MARK: - Properties -
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.emailTextField.setLeftPaddingPoints(10 )
        self.emailTextField.setRightPaddingPoints(10)
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    @IBAction func next(_ sender: UIButton) {
        let vc = verificationVC()
        push(vc)
    }
    
}


//MARK: - Networking -
extension forgetPasswordVC {
    
}

//MARK: - Routes -
extension forgetPasswordVC {
    
}
