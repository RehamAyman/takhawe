//
//  authRouter.swift
//  Takhawi
//
//  Created by Reham Ayman on 26/05/2024.
//



import Foundation
import Alamofire

enum AuthRouter {
    case login(phone : String, password: String)
    case signUp(name : String , email : String , password : String , role : String , phone : String , gender : String  , birthDate : String )
    case regoins
    case checkPhone( phone : String)
    case forgetPassword ( phone : String)
    case verifyResetCode ( phone : String , code : String)
    case resetPassword ( phone : String , comfirmPassword : String)
    case driverUploadNationalId ( nationalId : String )
    case driverUploadDrivingLicens
    case uploadCarLicense
    case driverImage
    case uploadCarImages
    case uploadCarInsurance
    case allCarDetails
    case sendCode
    case verifyCode ( code : String)
    

    
}

extension AuthRouter: APIRouter {
    var insideUrlParam: [String]? {
        return []
    }
    
    
    
  
    
    
    var method: HTTPMethod {
        switch self {
            
        case .login , .signUp , .checkPhone , .forgetPassword  , .verifyResetCode , .resetPassword  , .driverUploadNationalId , .driverUploadDrivingLicens , .uploadCarLicense , .uploadCarImages , .uploadCarInsurance , .sendCode  , .verifyCode :
            return .post
        
        case .regoins , .allCarDetails :
            return .get
        case .driverImage :
            return .patch
            
        }
    }
    
    var path: ServerPath {
        switch self {
        case .login:
            return AuthServerPath.login
        case .signUp :
            return AuthServerPath.signUp
        case .regoins:
            return AuthServerPath.regoins
        case .checkPhone :
            return AuthServerPath.checkPhone
        case .forgetPassword :
            return AuthServerPath.forgetPassword
        case .verifyResetCode :
            return AuthServerPath.verifyResetCode
        case  .resetPassword :
            return AuthServerPath.resetPassword
        case .driverUploadNationalId :
            return AuthServerPath.driverUploadNationalId
        case .driverUploadDrivingLicens :
            return AuthServerPath.driverUploadDrivinglicence
        case .uploadCarLicense :
            return AuthServerPath.UploadcCarLicence
        case .driverImage :
            return AuthServerPath.driverImage
        case .uploadCarImages :
            return AuthServerPath.uploadCarImages
        case .uploadCarInsurance :
            return AuthServerPath.uploadCarInsurance
        case .allCarDetails :
            return AuthServerPath.allCarData
        case .sendCode :
            return AuthServerPath.sendCode
        case .verifyCode:
            return AuthServerPath.verifyCode
       
       
        }
    }
    
    var parameters: APIParameters? {
        switch self {
        case .login(let phone  , let password):
            return [
               "phone" : phone ,
               "password" : password
            ]
            
        case.signUp( let name , let email , let password , let role ,let phone  , let gender , let dateOfBirth ):
            return [
                "name" : name ,
                "phone" : phone ,
                "email" : email ,
                "password" : password ,
                "role" : role ,
                "gender" : gender ,
                "birth_date" : dateOfBirth
            ]
            
        case .checkPhone(let phone ):
            return [ "phone" : phone ]
      
        case .forgetPassword(let phone) :
            return [ "phone" : phone ]
        case .verifyResetCode(let phone , let code):
            return [
                "phone" : phone ,
                "code" : code 
            ]
        case .resetPassword( let phone , let confirmPassword ) :
            return [
                "phone" : phone  ,
                "password" : confirmPassword
            ]
            
        case .driverUploadNationalId( let nationalId ) :
            return [
                "national_id" : nationalId
            ]
        case .verifyCode(code: let code ):
            return [
                "code" : code
            ]
            
        
        case .regoins , .driverUploadDrivingLicens , .uploadCarLicense , .driverImage , .uploadCarImages , .uploadCarInsurance , .allCarDetails  , .sendCode  :
            return nil
        }
    }
    
}
