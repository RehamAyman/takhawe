//
//  enterpassword+textfielddelegate.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//

import UIKit
import OTPFieldView
extension enterPasswordVC   {
    
    
    
  

    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }

    func enteredOTP(otp: String) {
      //  code = otp
        print(otp)
    }

    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
       // print(OtpCode.fieldSize)
        return true
    }
    
    
    
}
