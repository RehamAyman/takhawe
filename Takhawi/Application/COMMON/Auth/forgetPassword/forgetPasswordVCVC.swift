//
//  forgetPasswordVCVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//
//  Template by MGAbouarab®


import UIKit

class forgetPasswordVC: BaseVC ,  UITextFieldDelegate  {
    
//MARK: - IBOutlets -
    
   
    @IBOutlet weak var nextOutlet: MainButton!
    @IBOutlet weak var stackContainer: UIStackView!
    @IBOutlet weak var phoneContainerView: UIView!
    @IBOutlet weak var phoneNumber: MainAppTextFaild!
    
//MARK: - Properties -
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        phoneNumber.delegate = self
        self.phoneNumber.setLeftPaddingPoints(10 )
        self.phoneNumber.setRightPaddingPoints(10)
       // self.stackContainer.semanticContentAttribute = .forceLeftToRight
        self.disableNextButton()
        
    }
    
    
    
//MARK: - Logic Methods -
    
    private func disableNextButton () {
        self.nextOutlet.isEnabled = false
        self.nextOutlet.backgroundColor = UIColor.systemGray4
    }
    
    private func enableNextButton () {
        self.nextOutlet.isEnabled = true
        self.nextOutlet.backgroundColor = UIColor(named: "MainColor")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(with: "XX XXX XXXXX", phone: newString)
        if textField.text?.count == 12 {
            self.enableNextButton()
        } else {
            self.disableNextButton()
        }
        
        
        
        return false
    }
    
//MARK: - Actions -
    @IBAction func next(_ sender: UIButton) {
  
        
        
        if phoneNumber.text == "" || self.phoneNumber.text?.count ?? 0 < 12 {
            showPopTopAlert(title: "Empty Field".localized, withMessage: "please add a phone number first!".localized, success: false )
        }else if  phoneNumber.text?.isValidPhoneNumber() == false   {
               showPopTopAlert(title: "Error!".localized, withMessage: "please add a valid phone number".localized, success: false )
        } else {
            
            self.forgetPassword()
        }
        
        
        
       
    }
    
    
    
    
    
    
}


//MARK: - Networking -
extension forgetPasswordVC {
    func forgetPassword () {
        activityIndicatorr.startAnimating()
        let phoneText  =  self.phoneNumber.text?.replacingOccurrences(of: " ", with: "") ?? ""
        AuthRouter.forgetPassword(phone: phoneText ).send { [weak self]  (response: APIGlobalResponse ) in
            guard let self = self else { return }
            if response.status == true {
                
                showPopTopAlert(title: "Sent Successfully".localize, withMessage: response.message ?? "code sent successfully".localize, success: true )
                let vc = verificationVC()
                vc.phoneNumber = phoneText
                self.push(vc)
                
            } else {
                
                
                activityIndicatorr.stopAnimating()
                showPopTopAlert(title: "ِError!".localize , withMessage: response.message ?? "error , try again".localize, success: false  )
            }
        }
    }
}

//MARK: - Routes -
extension forgetPasswordVC {
    
}
