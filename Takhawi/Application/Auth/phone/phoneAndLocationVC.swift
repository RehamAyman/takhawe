//
//  phoneAndLocationVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 20/09/2023.
//

import UIKit

class phoneAndLocationVC: BaseVC, UITextFieldDelegate {
    
//MARK: - IBOutlets -
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var passwordTextField: MainAppTextFaild!
    
    @IBOutlet weak var titileLabel: UILabel!
    
    @IBOutlet weak var passwordContainerView: UIView!
    
    @IBOutlet weak var stackContainer: UIStackView!
    
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.stackContainer.semanticContentAttribute = .forceLeftToRight
       // self.mainStackView.busAnimation(item: self.logoImage)
        self.passwordTextField.delegate = self
        
        titileLabel.font = UIFont.systemFont(ofSize: 18)
      
        let attrs1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)]
        let attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        let attrs3 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20) ]
     
        
        let attributedString1 = NSMutableAttributedString(string:"Please enter ".localize, attributes:attrs1)
        let attributedString2 = NSMutableAttributedString(string:"your phone number ".localize, attributes:attrs2)
        let attributedString3 = NSMutableAttributedString(string:"so we can verify you.".localize, attributes:attrs3)
        
           attributedString1.append(attributedString2)
           attributedString1.append(attributedString3)
        
           self.titileLabel.attributedText = attributedString1
           self.titileLabel.sizeToFit()
           self.titileLabel.numberOfLines = 2
    
       
        
        
    }
  
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.passwordTextField.becomeFirstResponder()
    }
    
    
//MARK: - actions

    
    
    
//MARK: - textfield  Methods -


   
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        
        let newString = (text as NSString).replacingCharacters(in: range, with: string)
        textField.text = format(with: "XX XXX XXXX", phone: newString)
      
        if passwordTextField.text?.count == 11  { // saudi arabia number length
            dismissKeyboard()
            // call the end point

            activityIndicatorr.startAnimating()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2 ) {
                let phoneText  =  self.passwordTextField.text?.replacingOccurrences(of: " ", with: "") ?? ""
                
                AuthRouter.checkPhone(phone:  phoneText  ).sendCheckPhone {  [weak self]  (response: CheckphoneResponse ) in
                    guard let self = self else { return }
                    
                    
                    
                    if response.status == true {
                        if response.resultt == true {   // old user
                            let vc = enterPasswordVC()
                            vc.phone = phoneText
                            
                            push(vc)
                        } else { // new user
                            
                            
                            let vc = registerTapsVC()
                            vc.phone = phoneText
                            
                            push(vc)
                        }
                        
                    } else {
                        showPopTopAlert(title: "ERROR!", withMessage: response.message ?? "server error , try again!", success: false )
                    }
                }
            }
        }
        
        
        return false
    }
    
}
