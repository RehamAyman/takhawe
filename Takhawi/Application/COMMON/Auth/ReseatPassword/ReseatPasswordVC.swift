//
//  ReseatPasswordVC.swift
//  Takhawi
//
//  Created by Sara Mady on 06/08/2023.
//
//  Template by MGAbouarab®

import UIKit
import AlertKit

class ReseatPasswordVC: BaseVC  , UITextFieldDelegate {

    // MARK: - IBOutlets -

    @IBOutlet weak var confirmPassword: UIShowHideTextField!
    @IBOutlet weak var newPassword: UIShowHideTextField!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var nextButtonOutlet: MainButton!
    
    
    
    
    // MARK: - Properties -
    var phone : String = ""
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }

    // MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        mainStack.animateToTop()
        newPassword.delegate = self
        confirmPassword.delegate = self
        self.disapleConfirmButton()
        self.confirmPassword.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingChanged)
        self.newPassword.addTarget(self, action: #selector(textFieldDidEndEditing(_:)), for: .editingChanged)
        
    }

    // MARK: - Logic Methods -
    
    
private func disapleConfirmButton () {
        self.nextButtonOutlet.isEnabled = false
        self.nextButtonOutlet.backgroundColor = UIColor.systemGray4
    }
    
    
private func enableConfirmButton () {
        self.nextButtonOutlet.isEnabled = true
        self.nextButtonOutlet.backgroundColor = UIColor(named: "MainColor")
    }

    // MARK: - Actions -
    
    @objc func textFieldDidEndEditing(_ sender: UITextField) {
        
        if self.newPassword.text?.isEmpty  ==  true || self.confirmPassword.text?.isEmpty == true   {
            self.disapleConfirmButton()
        } else {
            self.enableConfirmButton()
        }
        
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let maxLength = 5
//        let currentString = (textField.text ?? "") as NSString
//        let newString = currentString.replacingCharacters(in: range, with: string)
//
//        return newString.count <= maxLength
//    }
    

    @IBAction func confirmAction(_ sender: Any) {
        
        if self.confirmPassword.text != self.newPassword.text  {
            showPopTopAlert(title: "Error!".localize, withMessage: "Passwrord and ConfirmPassword must be the same".localize , success: false)
        } else {
            activityIndicatorr.startAnimating()
            AuthRouter.resetPassword(phone: self.phone, comfirmPassword: self.newPassword.text ?? "" ).send { [weak self]  (response: APIGlobalResponse ) in
                guard let self = self else { return }
              
                if response.status == true {
                    showPopTopAlert(title: "Done".localize, withMessage: response.message ?? "Password successfully updated".localize , success: true )
                    let vc = phoneAndLocationVC()
                    self.push(vc)
                } else {
                    showPopTopAlert(title: "Error!".localize, withMessage: response.message ?? "error , try again".localize , success: true )
                }
                
            }
        }
    
        
   
    }

}

// MARK: - Networking -
extension ReseatPasswordVC {

}

// MARK: - Routes -
extension ReseatPasswordVC {

}
