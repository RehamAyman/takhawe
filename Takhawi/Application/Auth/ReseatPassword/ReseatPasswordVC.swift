//
//  ReseatPasswordVC.swift
//  Takhawi
//
//  Created by Sara Mady on 06/08/2023.
//
//  Template by MGAbouarab®

import UIKit
import AlertKit

class ReseatPasswordVC: BaseVC {

    // MARK: - IBOutlets -

    @IBOutlet weak var mainStack: UIStackView!

    // MARK: - Properties -

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }

    // MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        mainStack.animateToTop()
    }

    // MARK: - Logic Methods -

    // MARK: - Actions -

    @IBAction func confirmAction(_ sender: Any) {
        AlertKitAPI.present(
            title: "Success Updated",
            icon: .done,
            style: .iOS17AppleMusic,
            haptic: .success
        )
    }

}

// MARK: - Networking -
extension ReseatPasswordVC {

}

// MARK: - Routes -
extension ReseatPasswordVC {

}
