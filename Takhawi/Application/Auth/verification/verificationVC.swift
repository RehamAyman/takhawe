//
//  verificationVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//
//  Template by MGAbouarab®


import UIKit
import OTPFieldView

class verificationVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var resendOutlet: UIButton!
    @IBOutlet weak var OTPView: OTPFieldView!
    
    
//MARK: - Properties -
    
    
//MARK: - Creation -
   
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.setupOtpView()
        self.resendOutlet.underline()
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions acce
   
    @IBAction func resendCode(_ sender: UIButton) {
        
    }
    
    
    
    @IBAction func next(_ sender: Any) {
        let vc = ReseatPasswordVC()
        push(vc)
    }
}


//MARK: - Networking -
extension verificationVC {
    
}

//MARK: - Routes -
extension verificationVC {
    
    
    func setupOtpView() {
        switch UIDevice().type {
        case .iPhoneSE, .iPhoneSE2, .iPhone6, .iPhone6S, .iPhone7, .iPhone8, .iPhone12Mini, .iPhoneXR, .iPhone13Mini:
            OTPView.fieldSize = 43
        default:
            OTPView.fieldSize = 50
        }
        OTPView.filledBackgroundColor = UIColor.white
        OTPView.defaultBackgroundColor = .appColor(.BackGroundColor)!
//        OtpCode.tintColor = .red
        OTPView.filledBorderColor = UIColor.appColor(.MainColor)!
        OTPView.cursorColor = UIColor.appColor(.MainColor)!
        OTPView.defaultBorderColor = .lightGray
        OTPView.fieldsCount = 6
        OTPView.fieldBorderWidth = 1.5

        OTPView.displayType = .roundedCorner
        OTPView.otpInputType = .ascii
        OTPView.separatorSpace = 8
        OTPView.shouldAllowIntermediateEditing = false
       // OTPView.delegate = self
        OTPView.resignFirstResponder()
        OTPView.initializeUI()
    }

    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }

    func enteredOTP(otp: String) {
     //   code = otp
        print(otp)
    }

    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        print(OTPView.fieldSize)
        return true
    }
    
    
}
