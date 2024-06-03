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
    case signUp(name : String , email : String , password : String , role : String , phone : String , gender : String  )
    case regoins
    case checkPhone( phone : String)
    case forgetPassword ( phone : String)
    case verifyResetCode ( phone : String , code : String)
    case resetPassword ( phone : String , comfirmPassword : String)

    
}

extension AuthRouter: APIRouter {
    var insideUrlParam: [String]? {
        return []
    }
    
    
    
  
    
    
    var method: HTTPMethod {
        switch self {
            
        case .login , .signUp , .checkPhone , .forgetPassword  , .verifyResetCode , .resetPassword :
            return .post
        
        case .regoins:
            return .get
            
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
       
        }
    }
    
    var parameters: APIParameters? {
        switch self {
        case .login(let phone  , let password):
            return [
               "phone" : phone ,
               "password" : password
            ]
            
        case.signUp( let name , let email , let password , let role ,let phone  , let gender ):
            return [
                "name" : name ,
                "phone" : phone ,
                "email" : email ,
                "password" : password ,
                "role" : role ,
                "gender" : gender
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
            
            
        case .regoins:
            return nil
        }
    }
    
}
