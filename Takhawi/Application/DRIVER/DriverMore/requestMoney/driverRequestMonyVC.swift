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
    // note this function just for test the design and still missed the api connection ---
    @IBAction func confirm(_ sender: UIButton) {
        if self.bankAccountNumber.text == "" || self.ibanNumber.text == "" || self.minWithdrawal.text == "" || self.bankName.text == "" || self.bankAccHolderName.text == "" {
           showInfoTopAlert(withMessage: "Please Fill All Fields First")
        } else {
            activityIndicatorr.startAnimating()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
                activityIndicatorr.stopAnimating()
                showPopTopAlert(title: "Done", withMessage: "Your Request Successfully Sent", success: true )
            }
        }
    }
}
// -----

//MARK: - Networking -
extension driverRequestMonyVC {
    
}

//MARK: - Routes -
extension driverRequestMonyVC {
    
}
