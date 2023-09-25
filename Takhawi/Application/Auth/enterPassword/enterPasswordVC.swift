//
//  enterPasswordVCVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 20/09/2023.
//
//  Template by MGAbouarab®


import UIKit



class enterPasswordVC: BaseVC {
    
//MARK: - IBOutlets -
    
   
    
    
    
 
   
    
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
    
    @IBAction func forgetPassword(_ sender: UIButton) {
       let vc = forgetPasswordVC()
        push(vc)
    }
}


//MARK: - Networking -
extension enterPasswordVC {
    
}

//MARK: - Routes -
extension enterPasswordVC {
    
}
