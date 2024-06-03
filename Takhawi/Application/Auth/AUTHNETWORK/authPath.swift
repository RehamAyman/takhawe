//
//  authModel.swift
//  Takhawi
//
//  Created by Reham Ayman on 26/05/2024.
//



import Foundation
enum AuthServerPath {
   
    case login
    case regoins
    case signUp
    case checkPhone
    case forgetPassword
    case verifyResetCode
    case resetPassword
    
   
}

extension AuthServerPath : ServerPath {
    var value: String {
        switch self {
     
        
        case .login :
            return "auth/login"
        case .signUp :
            return "auth/signup"
        case .checkPhone :
            return "auth/check-phone-exist"
        case .regoins :
            return "base/regions"
        case .forgetPassword :
            return "auth/forget-password"
        case .verifyResetCode :
            return "auth/verify-reset-code"
        case .resetPassword :
            return "auth/reset-password"
        }
    }
}
