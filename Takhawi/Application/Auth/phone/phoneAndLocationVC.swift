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
    
    
   
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
       // self.mainStackView.busAnimation(item: self.logoImage)
        self.passwordTextField.delegate = self
        titileLabel.font = UIFont.systemFont(ofSize: 18)
       
        let attrs1 = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)]
        let attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 20)]
        let attrs3 =  [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20) ]
     
        
        let attributedString1 = NSMutableAttributedString(string:"Please".localize, attributes:attrs1)
        let attributedString2 = NSMutableAttributedString(string:" provide following details".localize, attributes:attrs2)
        let attributedString3 = NSMutableAttributedString(string:" for your new account".localize, attributes:attrs3)
        
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
        print("0000")
        if passwordTextField.text?.count == 11  { // saudi arabia number length
            if passwordTextField.text == "00 000 0000" { // let us assume this is old user phone
                let vc = enterPasswordVC()
                dismissKeyboard()
                push(vc)
            } else { // new user
                let vc = registerTapsVC()   //  swiftRegisterVC()  //registerTapsVC()   // swiftRegisterVC()    // registerTapsVC()
                dismissKeyboard()
                push(vc)
            }
        }
        
        
        return false
    }
    
}
