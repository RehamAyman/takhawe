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
                let vc = registerTapsVC()
                dismissKeyboard()
                push(vc)
                
            }
           
   
        }
        
        return false
    }
    
}
