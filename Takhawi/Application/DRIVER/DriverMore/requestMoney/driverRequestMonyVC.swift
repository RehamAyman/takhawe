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
    
    @IBOutlet weak var agreeIcon: UIImageView!
    @IBOutlet weak var matchPersonalId: UIImageView!
    @IBOutlet weak var bankAccHolderName: MDCOutlinedTextField!
    @IBOutlet weak var ibanNumber: MDCOutlinedTextField!
    @IBOutlet weak var minWithdrawal: MDCOutlinedTextField!
    @IBOutlet weak var bankName: MDCOutlinedTextField!
    @IBOutlet weak var bankAccountNumber: MDCOutlinedTextField!
    
    
    
//MARK: - Properties -
    var agree : Bool = false
    var matchId : Bool = false
    var theWholeProfit : Int = 0
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.agreeIcon.addTapGesture {
            self.agree.toggle()
            self.agreeIcon.image = self.agree ? UIImage(named: "checkbox") : UIImage(named: "UNcheckbox")
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
         
        }
        self.matchPersonalId.addTapGesture {
            self.matchId.toggle()
            self.matchPersonalId.image = self.matchId ? UIImage(named: "checkbox") : UIImage(named: "UNcheckbox")
                UIView.animate(withDuration: 0.5) {
                    self.view.layoutIfNeeded()
                }
        }
        
        
        
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
    
    
    @IBAction func maxLimit(_ sender: UIButton) {
        if  theWholeProfit > 0 {
            self.minWithdrawal.text = String ( self.theWholeProfit )
        }
    }
    
    
    
    //MARK: - Actions -
    // note this function just for test the design and still missed the api connection ---
    @IBAction func confirm(_ sender: UIButton) {
        if self.bankAccountNumber.text == "" || self.ibanNumber.text == "" || self.minWithdrawal.text == "" || self.bankName.text == "" || self.bankAccHolderName.text == "" {
           showInfoTopAlert(withMessage: "Please Fill All Fields First")
        } else if self.matchId == false || self.agree == false    {
            showInfoTopAlert(withMessage: "Please agree to the conditions first")
        } else {
            self.requestStellment()
        
        }
    }
    
    
}


// -----

//MARK: - Networking -
extension driverRequestMonyVC {
    
    func requestStellment () {
        activityIndicatorr.startAnimating()
        DriverRouter.stellementRequest(holderName:  self.bankAccHolderName.text ?? "" , bankName: self.bankName.text ?? "" , bankAccNo: self.bankAccountNumber.text ?? ""  , iban: self.ibanNumber.text ?? "" , amount: Int ( self.minWithdrawal.text ?? "" ) ?? 0).send {  ( response : APIGlobalResponse ) in
           
            if response.status == true {
                showInfoTopAlert(withMessage: response.message )
            }
        }
    }
    
    
}

//MARK: - Routes -
extension driverRequestMonyVC {
    
}
