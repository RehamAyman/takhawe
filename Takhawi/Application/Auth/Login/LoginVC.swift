//
//  LoginVC.swift
//  Takhawi
//
//  Created by Sara Mady on 20/07/2023.
//
//  Template by MGAbouarab®

import UIKit

class LoginVC: BaseVC {

    // MARK: - IBOutlets -

    @IBOutlet weak var loginButton: MainButton!
    @IBOutlet weak var MainStackView: UIStackView!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var passwordText: UIShowHideTextField!

    // MARK: - Properties -

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        MainStackView.animateToTop()
    }

    override func viewDidDisappear(_ animated: Bool) {
        self.loginButton.isLoading  = false
    }

    // MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
//        self.passwordText.setLeftPaddingPoints(10)
//        self.passwordText.setRightPaddingPoints(10)

    }

    // MARK: - Logic Methods -

    // MARK: - Actions -
    @IBAction func loginAction(_ sender: Any) {
        loginButton.isLoading = true
    }
    @IBAction func registerNewAccountAction(_ sender: Any) {
        let vc = SelectUserTypeVC()
        push(vc)
    }
    @IBAction func forgetPasswordAction(_ sender: Any) {
        let vc = EnterMobileVC()
        push(vc)
    }

}

// MARK: - Networking -
extension LoginVC {

}

// MARK: - Routes -
extension LoginVC {

}
