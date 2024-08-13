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
    case driverUploadNationalId
    case driverUploadDrivinglicence
    case UploadcCarLicence
    case driverImage
    case uploadCarImages
    case uploadCarInsurance
    
    case allCarData
    case refreshToken
    
   
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
        case .driverUploadNationalId :
            return "driver/upload-national-id"
        case .driverUploadDrivinglicence :
            return "driver/upload-driving-licence"
        case .UploadcCarLicence:
            return "vehicle/licence-images"
        case .driverImage :
            return "user/profile"
        case .uploadCarImages:
            return "vehicle/upload-images"
        case .uploadCarInsurance:
            return "vehicle/insurance-image"
        case .allCarData :
            return "vehicle-details"
        case .refreshToken:
            return ""
        }
    }
}
