//
//  verificationVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//
//  Template by MGAbouarab®


import UIKit

class verificationVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var resendOutlet: UIButton!
    
    
//MARK: - Properties -
    
    
//MARK: - Creation -
   
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.resendOutlet.underline()
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions acce
   
    @IBAction func resendCode(_ sender: UIButton) {
        
    }
    
    
    
    @IBAction func next(_ sender: Any) {
        let vc = ReseatPasswordVC()
        push(vc)
    }
}


//MARK: - Networking -
extension verificationVC {
    
}

//MARK: - Routes -
extension verificationVC {
    
    
   

    
    
}
