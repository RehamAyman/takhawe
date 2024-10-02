//
//  logoutpopVC.swift
//  Takhawi
//
//  Created by Mac on 25/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class logoutpopVC: BaseVC {
    
    //MARK: - IBOutlets -
    
    
    //MARK: - Properties -
    

    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        view.layer.addBasicShadow(cornerRadius: 20)
    }
    
    
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
    }
    
    //MARK: - Logic Methods -
    
    @IBAction func dismissScreen(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction func backToHome(_ sender: UIButton) {
       
        if UserDefaults.user?.user?.role == role.user.rawValue {
            let vc = homeVC()
            let nav = CustomNavigationController(rootViewController: vc)
            AppHelper.changeWindowRoot(vc: nav)
        } else  if UserDefaults.user?.user?.role == role.driver.rawValue  {
            let vc = DriverHomeVC()
            let nav = CustomNavigationController(rootViewController: vc)
            AppHelper.changeWindowRoot(vc: nav)
        }
      
    }
    
    //MARK: - Actions -
    @IBAction func confirm(_ sender: UIButton) {
        UserDefaults.isLogin = false
        UserDefaults.user = nil
        UserDefaults.accessToken = nil
        let vc = phoneAndLocationVC()
        let nav = CustomNavigationController(rootViewController: vc)
        AppHelper.changeWindowRoot(vc: nav)
       
    }
    
}


//MARK: - Networking -
extension logoutpopVC {
    
}

//MARK: - Routes -
extension logoutpopVC {
    
}
