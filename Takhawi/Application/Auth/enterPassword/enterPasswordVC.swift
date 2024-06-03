//
//  enterPasswordVCVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 20/09/2023.
//
//  Template by MGAbouarab®


import UIKit
import AEOTPTextField



class enterPasswordVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var stackContainerView: UIStackView!
    
    @IBOutlet weak var otpTextField: AEOTPTextField!
    
    
    
    var phone : String = "" 
   
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        
        self.setUpOtp()
       
    }
    
    //MARK: - Logic Methods -
    
    
    //MARK: - Actions -
    
    @IBAction func forgetPassword(_ sender: UIButton) {
       let vc = forgetPasswordVC()
        push(vc)
    }
}


//MARK: - Networking -
extension enterPasswordVC {
    
    private func validate(phone:String?,Password:String?)throws {
        
        _ = try ValidationService.validate(phone:  phone )
        _ = try ValidationService.validate(password: Password)
    }
    
    
    
    
    
     func login ( phone : String , password : String ) {
        
    
       //     try validate(phone: self.phone , Password: self.otpTextField.text!)
            // login service
            activityIndicatorr.startAnimating()
            AuthRouter.login(phone: self.phone , password: self.otpTextField.text ?? "" ).send { [weak self] (response: APIGenericResponse<LoginModelData>) in
                if let data = response.result {
                    
                    UserDefaults.isLogin = true
                    UserDefaults.user = data
                    UserDefaults.accessToken = data.accessToken
                    
                    // go to home 
                    print("go to home    /// ")
                    let vc = homeVC()
                    self?.push(vc)
                    
                }
            }

       
       
        
    }
    
}

//MARK: - Routes -
extension enterPasswordVC {
    
}
