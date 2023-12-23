//
//  baseSuccessAlertVC.swift
//  Takhawi
//
//  Created by Mac on 23/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class baseSuccessAlertVC: BaseVC {
    
    //MARK: - IBOutlets -
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
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
    
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: true )
    }
    @IBAction func backToHome(_ sender: UIButton) {
    }
}


//MARK: - Networking -
extension baseSuccessAlertVC {
    
}

//MARK: - Routes -
extension baseSuccessAlertVC {
    
}
