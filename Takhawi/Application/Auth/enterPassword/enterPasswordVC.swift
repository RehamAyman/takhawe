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
    
    @IBOutlet weak var progressInd: UIActivityIndicatorView!
    @IBOutlet weak var stackContainerView: UIStackView!
    
    @IBOutlet weak var otpTextField: AEOTPTextField!
    
    
    
    var phone : String = "" 
  //  var carDetails : CarDetailsResult?
   
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
    //MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.progressInd.isHidden = true
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
                    
                    UserDefaults.user = data
                    UserDefaults.accessToken = data.accessToken
                    // go to home
                    print("go to home    /// ")
                    let userType = response.result?.user?.role
                    if userType == role.user.rawValue {
                        
                        UserDefaults.isLogin = true
                        let vc =  homeVC()
                        self?.push(vc)
                    } else if userType == role.driver.rawValue  {
                        // check driver status
                     
                        if response.result?.user?.driver_status == "APPROVED" {
                            UserDefaults.isLogin = true
                            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                            let vc = storyboard.instantiateViewController(withIdentifier: "DriverTabbar") as! DriverTabbar
                            self?.navigationController?.pushViewController(vc, animated: true)
                         
                        } else if response.result?.user?.driver_status == "REGISTERED" {
                            
                            self?.showDriverStatusLoading(bool: true )
                           // self?.getCarDetails()
                            self?.checkDriverStatus()
                        } else if response.result?.user?.driver_status == "PENDING" {
                            showPopTopAlert(title: "your application is under review".localize, withMessage: "please contact us if you have any questions".localize, success: false )
                        }
                        
                    }
 
                }
            }
 
    }

   
    
    private func showDriverStatusLoading (bool : Bool) {
        if bool {
            self.dismissKeyboard()
            self.progressInd.isHidden = false
            self.progressInd.startAnimating()
            view.isUserInteractionEnabled = false
        } else {
            self.progressInd.isHidden = true
            self.progressInd.stopAnimating()
            view.isUserInteractionEnabled = true
        }
    }
    
    
    private func checkDriverStatus () {
        
       
        DriverRouter.driverStatus.send {  [weak self] (response: APIGenericResponse<DriverStatusResult>) in
            guard let self = self else { return }
            guard let result = response.result else { return }
        
           
                let vc = driverAuthVC()
               
            
            
                if result.national_Id_Images == false {
                    vc.selection = 1
                    self.push(vc)
                }else if result.driving_Licence_Images == false {
                    vc.selection = 2
                    self.push(vc)
                } else if result.vehicle_Licence == false {
                    vc.selection = 3
                    self.push(vc)
                } else if result.avatar_Image == false {
                    vc.selection = 4
                    self.push(vc)
                }else if result.vehicle_Images == false {
                    vc.selection = 5
                    self.push(vc)
                } else if result.insurance_Image == false {
                    vc.selection = 6
                    self.push(vc)
                }else if result.vehicle_Exist == false {
                    vc.selection = 7
                    self.push(vc)
                }
                
                showDriverStatusLoading(bool: false )
                
           
            
        }
    }
    
}

//MARK: - Routes -
extension enterPasswordVC {
    
}
