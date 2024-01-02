//
//  OTPVC.swift
//  Takhawi
//
//  Created by Sara Mady on 06/08/2023.
//
//  Template by MGAbouarab®

import UIKit
import OTPFieldView

class OTPVC: BaseVC, OTPFieldViewDelegate {

    // MARK: - IBOutlets -

    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var otpStackView: UIStackView!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var OtpCode: OTPFieldView!
    @IBOutlet weak var confirmationButton: MainButton!
    @IBOutlet weak var resendCodeButton: UIButton!

    // MARK: - Properties -
    var count = 60
    var code: String?

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }

    // MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        setupView()
        otpStackView.animateToLeft()
        self.resendCodeButton.isHidden = true
        if LocalizationManager.shared.getLanguage() == .Arabic {
            otpStackView.semanticContentAttribute = .forceRightToLeft
        } else {
            otpStackView.semanticContentAttribute = .forceLeftToRight
        }
        setupOtpView()
    }

    // MARK: - Logic Methods -
    func setupView() {
        resendCodeButton.isEnabled = false
        _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }
    @objc func update() {
        if count > 0 {
//            resendCodeLbl.text = "You can resend the code in".localized
            codeLabel.text = "\(count) " + "second".localized
            count = count - 1
        } else {
            resendCodeButton.isHidden = false
            codeLabel.text = "You haven't received the code yet ?".localized
            resendCodeButton.isEnabled = true

        }
    }

    // MARK: - Actions -
    @IBAction func confirmaAction(_ sender: Any) {
        let vc = ReseatPasswordVC()
        push(vc)
    }

    @IBAction func confirmationAction(_ sender: Any) {
    }
    @IBAction func resendCodeAction(_ sender: Any) {
        self.resendCodeButton.isHidden = true
        self.count = 60

    }
}

// MARK: - Networking -
extension OTPVC {

}

// MARK: - Routes -
extension OTPVC {

}
extension OTPVC {
    func setupOtpView() {
        switch UIDevice().type {
        case .iPhoneSE, .iPhoneSE2, .iPhone6, .iPhone6S, .iPhone7, .iPhone8, .iPhone12Mini, .iPhoneXR, .iPhone13Mini:
            OtpCode.fieldSize = 43
        default:
            OtpCode.fieldSize = 50
        }
        OtpCode.filledBackgroundColor = UIColor.white
        OtpCode.defaultBackgroundColor = .appColor(.BackGroundColor)!
//        OtpCode.tintColor = .red
        OtpCode.filledBorderColor = UIColor.appColor(.MainColor)!
        OtpCode.cursorColor = UIColor.appColor(.MainColor)!
        OtpCode.defaultBorderColor = .lightGray
        OtpCode.fieldsCount = 6
        OtpCode.fieldBorderWidth = 1.5

        OtpCode.displayType = .roundedCorner
        OtpCode.otpInputType = .ascii
        OtpCode.separatorSpace = 8
        OtpCode.shouldAllowIntermediateEditing = false
        OtpCode.delegate = self
        OtpCode.resignFirstResponder()
        OtpCode.initializeUI()
    }

    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }

    func enteredOTP(otp: String) {
        code = otp
        print(otp)
    }

    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        print(OtpCode.fieldSize)
        return true
    }
}
