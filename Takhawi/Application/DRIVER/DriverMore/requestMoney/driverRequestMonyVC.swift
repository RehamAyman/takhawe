//
//  driverRequestMonyVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 08/04/1446 AH.
//
//  Template by MGAbouarab®


import UIKit
import MaterialComponents

class driverRequestMonyVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var bankAccHolderName: MDCOutlinedTextField!
    @IBOutlet weak var ibanNumber: MDCOutlinedTextField!
    
    @IBOutlet weak var minWithdrawal: MDCOutlinedTextField!
    @IBOutlet weak var bankName: MDCOutlinedTextField!
    
    @IBOutlet weak var bankAccountNumber: MDCOutlinedTextField!
    
    
    
//MARK: - Properties -
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.bankAccountNumber.handelTextField(placeHolder: "Please enter Bank account number".localize)
        self.ibanNumber.handelTextField(placeHolder: "Please enter IBAN number".localize)
        self.minWithdrawal.handelTextField(placeHolder: "Minimum withdrawal 50 SAR".localize)
        self.bankName.handelTextField(placeHolder: "Please enter Name of the bank".localize)
        self.bankAccHolderName.handelTextField(placeHolder:  "Please enter the account holder's name".localize )
        
        
        
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
    @IBAction func confirm(_ sender: UIButton) {
        activityIndicatorr.startAnimating()
        
    }
}


//MARK: - Networking -
extension driverRequestMonyVC {
    
}

//MARK: - Routes -
extension driverRequestMonyVC {
    
}
