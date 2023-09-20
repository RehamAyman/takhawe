//
//  EnterMobileVC.swift
//  Takhawi
//
//  Created by Sara Mady on 06/08/2023.
//
//  Template by MGAbouarab®

import UIKit

class EnterMobileVC: BaseVC {

    // MARK: - IBOutlets -

    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var phoneText: MainAppTextFaild!

    // MARK: - Properties -

    // MARK: - Creation -

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }

    // MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
    }

    // MARK: - Logic Methods -

    // MARK: - Actions -

    @IBAction func sendCodeAction(_ sender: Any) {
        let vc = OTPVC()
        push(vc)
    }
}

// MARK: - Networking -
extension EnterMobileVC {

}

// MARK: - Routes -
extension EnterMobileVC {

}
