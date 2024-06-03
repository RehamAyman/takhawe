//
//  registerTabsExtention.swift
//  Takhawi
//
//  Created by Reham Ayman on 02/06/2024.
//

import SwiftUI


extension registerTabs {
    
    
    
    func userSignUpValidation (newTab : Int) {
        
        if newTab == 2 && self.email.isValidEmail() == false  { // email step
            showPopTopAlert(title: "Error!".localize  , withMessage: "invalid Email".localize , success: false )
            self.tabSelection = 1
        } else if newTab == 3  && self.validateStep2() == false   { // password + confirm password
            self.tabSelection = 2
            showPopTopAlert(title: "Error!".localize  , withMessage: "Passwrord and ConfirmPassword must be the same1".localize , success: false )
        } 
        
  
    }
    
   
    
    private func validateStep2 () -> Bool  {
        if self.password == "" || self.confirmPassword == "" || self.password != self.confirmPassword || self.password.count < 6 {
           
            return false
        } else {
            return true
        }
  
    }
    
    
    
    func sighUp (name : String , email : String , password : String , gender : Int , phone : String) {
        print("signup params  ")
        print( name )
        print(email)
        print(password)
        print(gender)
        print(self.phone)
       self.action(name , email , password , phone , gender)
       

       
    }
    
}
