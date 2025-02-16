//
//  verificationVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//
//  Template by MGAbouarab®


import UIKit
import AEOTPTextField
import CountdownLabel

class verificationVC: BaseVC, AEOTPTextFieldDelegate {
  
    
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var countLabel: CountdownLabel!
    @IBOutlet weak var codeText: AEOTPTextField!
    @IBOutlet weak var resendOutlet: UIButton!
    
    @IBOutlet weak var nextOutlet: MainButton!
    
//MARK: - Properties -
    
    var phoneNumber : String = ""
    var isNewUser : Bool = false
    var send : Bool = false
    var role : String = ""
    var action: (() -> Void)?
   
    
    
//MARK: - Creation -
   
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        if send {
            self.authResnendCode()
        }
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.resendOutlet.setTitle("Resend".localize, for: .normal)
        self.resendOutlet.underline()
        self.resendOutlet.isHidden = true
        self.disableNextButton()
        self.setUpOtp()
    }
    
//MARK: - Logic Methods -
   private func setUpOtp () {
       
        codeText.otpDelegate = self
        codeText.otpBackgroundColor =  UIColor.lightGray.withAlphaComponent(0.2)
        codeText.otpFontSize = 19
        codeText.otpFont = UIFont.boldSystemFont(ofSize: 19)
        codeText.otpTextColor = UIColor.black
        codeText.otpFilledBorderColor = UIColor(named: "MainColor") ?? UIColor.gray
        codeText.otpDefaultBorderColor = UIColor(named: "MainColor") ?? UIColor.gray
        codeText.otpDefaultBorderWidth = 1.5
        codeText.otpCornerRaduis = 10
        codeText.keyboardType = .asciiCapableNumberPad
        codeText.configure(with: 4)
        AEOTPTextField.appearance().semanticContentAttribute = .forceLeftToRight
        self.countLabel.addTime(time: 60 )
        self.countLabel.start()
       DispatchQueue.main.asyncAfter(deadline: .now() + 60 ) {
           self.resendOutlet.isHidden = false
       }
       
        
     
    }
    private func disableNextButton () {
        self.nextOutlet.isEnabled = false
        self.nextOutlet.backgroundColor = UIColor.systemGray4
        
    }
    private func enableNextButton () {
        self.nextOutlet.isEnabled = true
        self.nextOutlet.backgroundColor = UIColor(named: "MainColor")
    }
    
    func didUserFinishEnter(the code: String) {
        self.enableNextButton()
        print("hello iam done the code is \(code)")
    }
    func notComplete(the code: String) {
        if code.count < 6 {
            self.disableNextButton()
        }
    }
    
    
//MARK: - Actions acce
   
    @IBAction func resendCode(_ sender: UIButton) {
        print("resend code action pressed")
        if isNewUser {
            self.authResnendCode()
        } else {
            self.resetCode()
        }
    }
    
    
    
    @IBAction func next(_ sender: Any) {
        if self.codeText.text?.count ?? 0 < 4 {
            showPopTopAlert(title: "Error!".localized, withMessage: "enter the full 4 digits.".localized, success: false )
        } else {
            if isNewUser { // come from register screens
                self.verifyCode()
            } else {
                self.resetCode()
            }
    
        }
    }
}


//MARK: - Networking -
extension verificationVC {
    
    func resetCode () {
        activityIndicatorr.startAnimating()
        AuthRouter.verifyResetCode(phone: self.phoneNumber, code: self.codeText.text ?? "" ).send {[weak self]  (response: APIGlobalResponse ) in
            guard let self = self else { return }
            if response.status == true {
                showPopTopAlert(title: "Done".localize, withMessage: response.message, success: true )
                let vc = ReseatPasswordVC()
                vc.phone = self.phoneNumber
                push(vc)
            } else {
                self.codeText.clearOTP()
                self.disableNextButton()
            }
        }
    }
    
    
    
    func authResnendCode () {
        activityIndicatorr.startAnimating()
        AuthRouter.sendCode.send {  [weak self] (response: APIGlobalResponse )  in
            guard let self = self else { return }
            showPopTopAlert(title: "Done".localize, withMessage: response.message, success: true )
        }
    }
    
    
    
    
    func verifyCode () {
        activityIndicatorr.startAnimating()
        AuthRouter.verifyCode(code: self.codeText.text ?? "").send { [weak self] (response: APIGlobalResponse ) in
            guard let self = self else { return }
           
            if response.status == true {
                showPopTopAlert(title: "Done".localize, withMessage: response.message, success: true )
                self.pop(animated: true )
                self.action?()
            }
        }
    }
    
}

//MARK: - Routes -
extension verificationVC {
    
    
   

    
    
}
