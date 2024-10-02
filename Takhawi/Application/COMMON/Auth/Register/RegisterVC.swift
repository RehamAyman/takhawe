//
//  RegisterVC.swift
//  Takhawi
//
//  Created by Sara Mady on 30/07/2023.
//
//  Template by MGAbouarab®

import UIKit
import M13Checkbox

class RegisterVC: BaseVC {

    // MARK: - IBOutlets -

    @IBOutlet weak var passwordConfirmation: UIShowHideTextField!
    @IBOutlet weak var password: UIShowHideTextField!
    @IBOutlet weak var ibanNumber: MainAppTextFaild!
    @IBOutlet weak var emailText: MainAppTextFaild!
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var userName: MainAppTextFaild!
    @IBOutlet weak var mobileNumber: MainAppTextFaild!
    @IBOutlet weak var TermsStack: UIStackView!
    @IBOutlet weak var signUpButton: MainButton!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var agreeCheackBox: M13Checkbox!
    @IBOutlet weak var maleView: UIView!
    @IBOutlet weak var femaleView: UIView!

    // MARK: - Properties -

    enum LoginedType: String {
    case user
    case driver
    }

    var typeOfLogin: LoginedType = .user

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainStackView.animateToTop()
        self.configureInitialDesign()

    }
    override func viewDidAppear(_ animated: Bool) {
        self.progressView.setProgress(0.3, animated: true)

    }

    // MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        agreeCheackBox.boxType = .square
        agreeCheackBox.stateChangeAnimation = .stroke

        if typeOfLogin == .user {
            self.TermsStack.isHidden = false
            self.progressView.isHidden = true
        } else {
            self.TermsStack.isHidden = true
            self.progressView.isHidden = false
            self.signUpButton.setTitle("Next".localized, for: .normal)
        }

        maleView.addTapGesture {
            UIView.animate(withDuration: 0.3) {
                self.maleView.backgroundColor = UIColor.appColor(.SelectionColor)
                self.femaleView.backgroundColor = UIColor.white

            }
        }

        femaleView.addTapGesture {
            UIView.animate(withDuration: 0.3) {
                self.femaleView.backgroundColor = UIColor.appColor(.SelectionColor)
                self.maleView.backgroundColor = UIColor.white

            }
        }
    }

    // MARK: - Logic Methods -

    // MARK: - Actions -

    @IBAction func signUpAction(_ sender: Any) {
        if typeOfLogin == .user {
            let vc = OTPVC()
            push(vc)
        } else {
           let vc = DriverRegisterVC()
            push(vc)
        }
    }
    @IBAction func openCheackBoxScreen(_ sender: Any) {
        let vc = TermsOfUseVC()
        push(vc)
    }
    @IBAction func backToLoginAction(_ sender: Any) {
        self.popToRoot()
    }
}

// MARK: - Networking -
extension RegisterVC {

}

// MARK: - Routes -
extension RegisterVC {

}
