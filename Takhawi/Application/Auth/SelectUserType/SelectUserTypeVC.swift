//
//  SelectUserTypeVC.swift
//  Takhawi
//
//  Created by Sara Mady on 30/07/2023.
//
//  Template by MGAbouarab®

import UIKit
import M13Checkbox
class SelectUserTypeVC: BaseVC {

    // MARK: - IBOutlets -

    @IBOutlet weak var userView: UIView!
    @IBOutlet weak var driverView: UIView!
    @IBOutlet weak var userCheackBox: M13Checkbox!
    @IBOutlet weak var deiverCheackBox: M13Checkbox!

    // MARK: - Properties -
    var selectedType = "User"

    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()

    }

    // MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized

        userCheackBox.checkState = .checked

        userCheackBox.boxType = .circle
        userCheackBox.layer.cornerRadius = 20
        userCheackBox.clipsToBounds = true

        userCheackBox.stateChangeAnimation = .expand(.fill)
        deiverCheackBox.stateChangeAnimation = .expand(.fill)

        deiverCheackBox.boxType = .circle
        deiverCheackBox.clipsToBounds = true
        deiverCheackBox.layer.cornerRadius = 20

        self.userCheackBox.addTarget(self, action: #selector(userValueCheckedChange), for: .valueChanged)
        self.deiverCheackBox.addTarget(self, action: #selector(driverValueCheckedChange), for: .valueChanged)

    }

    // MARK: - Logic Methods -
    @objc func driverValueCheckedChange() {
        selectedType = "Driver"
        deiverCheackBox.checkState = .checked
        userCheackBox.checkState = .unchecked

        UIView.animate(withDuration: 0.5) {
            self.driverView.backgroundColor = UIColor.appColor(.SelectionColor)
            self.userView.backgroundColor = UIColor.white

        }
    }

    @objc func userValueCheckedChange() {

        selectedType = "User"
        userCheackBox.checkState = .checked
        deiverCheackBox.checkState = .unchecked

        UIView.animate(withDuration: 0.5) {
            self.userView.backgroundColor = UIColor.appColor(.SelectionColor)
            self.driverView.backgroundColor = UIColor.white
        }

        print("Driver")
    }

    // MARK: - Actions -

    @IBAction func continueAction(_ sender: Any) {
        let vc = RegisterVC()

        if selectedType == "User" {
            vc.typeOfLogin = .user
        } else {
            vc.typeOfLogin = .driver
        }
        self.push(vc)
    }
}

// MARK: - Networking -
extension SelectUserTypeVC {

}

// MARK: - Routes -
extension SelectUserTypeVC {

}
