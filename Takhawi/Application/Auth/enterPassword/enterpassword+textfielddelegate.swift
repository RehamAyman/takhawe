//
//  enterpassword+textfielddelegate.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//

import AEOTPTextField
import UIKit



extension enterPasswordVC : AEOTPTextFieldDelegate  {
    func notComplete(the code: String) {
        print("code not done yet ")
    }
    
    
    
    
    func didUserFinishEnter(the code: String) {
        print("iam done my code is \(code)")
        dismissKeyboard()
        self.login(phone: self.phone , password: self.otpTextField.text ?? "" )
    }
   
    
    
    
    

    func setUpOtp () {
       
        otpTextField.otpDelegate = self
        otpTextField.otpBackgroundColor =  UIColor.lightGray.withAlphaComponent(0.2)
        otpTextField.otpFontSize = 19
        otpTextField.otpFont = UIFont.boldSystemFont(ofSize: 19)
     // otpTextField.otpFilledBackgroundColor = UIColor(named: "DarkSecColor") ?? UIColor.white
        otpTextField.otpTextColor = UIColor.black
        otpTextField.otpFilledBorderColor = UIColor(named: "MainColor") ?? UIColor.gray
        otpTextField.otpDefaultBorderColor = UIColor(named: "MainColor") ?? UIColor.gray
        otpTextField.otpDefaultBorderWidth = 1.5
        otpTextField.cornerRadius = 10
      //  otpTextField.isSecureTextEntry = true
        otpTextField.keyboardType = .asciiCapableNumberPad
        otpTextField.configure(with: 5)
        AEOTPTextField.appearance().semanticContentAttribute = .forceLeftToRight
        //self.otpTextField.textAlignment = .left
      
    }
    
    
    
}
