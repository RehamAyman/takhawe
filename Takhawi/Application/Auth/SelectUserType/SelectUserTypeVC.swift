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
        userCheackBox.layer.cornerRadius = 15
        userCheackBox.clipsToBounds = true

        userCheackBox.stateChangeAnimation = .expand(.fill)
        deiverCheackBox.stateChangeAnimation = .expand(.fill)

        deiverCheackBox.boxType = .circle
        deiverCheackBox.clipsToBounds = true
        deiverCheackBox.layer.cornerRadius = 15

        self.userCheackBox.addTarget(self, action: #selector(userValueCheckedChange), for: .valueChanged)
        self.deiverCheackBox.addTarget(self, action: #selector(driverValueCheckedChange), for: .valueChanged)

    }

    // MARK: - Logic Methods -
    @objc func driverValueCheckedChange() {
        selectedType = "Driver"
        deiverCheackBox.checkState = .checked
        userCheackBox.checkState = .unchecked

        UIView.animate(withDuration: 0.5) {
            self.driverView.borderWidth = 2
            self.driverView.borderColor = UIColor(named: "MainColor")
            self.userView.backgroundColor = UIColor.systemGray5
            self.driverView.backgroundColor = UIColor.white
            self.userView.borderColor = UIColor.clear

        }
    }

    @objc func userValueCheckedChange() {

        selectedType = "User"
        userCheackBox.checkState = .checked
        deiverCheackBox.checkState = .unchecked

        UIView.animate(withDuration: 0.5) {
            self.userView.borderWidth = 2
            self.userView.borderColor = UIColor(named: "MainColor")
            self.driverView.backgroundColor = UIColor.systemGray5
            self.userView.backgroundColor = UIColor.white
            self.driverView.borderColor = UIColor.clear
           
        }

        print("Driver")
    }

    // MARK: - Actions -

    @IBAction func continueAction(_ sender: Any) {
        let vc =  homeVC()

//        if selectedType == "User" {
//            vc.typeOfLogin = .user
//        } else {
//            vc.typeOfLogin = .driver
//        }
        self.push(vc)
    }
}

// MARK: - Networking -
extension SelectUserTypeVC {

}

// MARK: - Routes -
extension SelectUserTypeVC {

}
