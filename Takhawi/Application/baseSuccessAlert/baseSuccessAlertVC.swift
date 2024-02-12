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
    
    var mainTitleText : String = ""
    var subTitleText : String = ""
    var driver : Bool = false
    var DriverAction : (() -> Void)?
    
 
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        if self.mainTitleText != "" {
            self.mainTitle.text = self.mainTitleText
        }
        if self.subTitleText != "" {
            self.subTitle.text = self.subTitleText
        }
    }
    
    //MARK: - Logic Methods -
    
    
    //MARK: - Actions -
    
    @IBAction func dismiss(_ sender: UIButton) {
        self.dismiss(animated: true )
    }
    @IBAction func backToHome(_ sender: UIButton) {
        if driver {
         
            self.DriverAction?()
            self.dismiss(animated: true )
        }
    }
}


//MARK: - Networking -
extension baseSuccessAlertVC {
    
}

//MARK: - Routes -
extension baseSuccessAlertVC {
    
}
