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
    var email : String = ""
    var password : String = ""
    var fullname : String = "" 
    var phone : String = ""
    var genderIndex : Int = 0
    

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

      
    }

    // MARK: - Actions -

    @IBAction func continueAction(_ sender: Any) {
        if selectedType == "Driver" {
            let vc = driverAuthVC()
            self.push(vc)
        } else {
            self.signupUser(name: self.fullname, email: self.email , password: self.password, phone: self.phone, genderIndex: self.genderIndex)
 
           
        }
     

//        if selectedType == "User" {
//            vc.typeOfLogin = .user
//        } else {
//            vc.typeOfLogin = .driver
//        }
       
    }
}

// MARK: - Networking -
extension SelectUserTypeVC {
    
    func signupUser (name : String , email : String , password : String  , phone : String , genderIndex: Int ) {
           activityIndicatorr.startAnimating()
           AuthRouter.signUp(name: name  , email: email , password: password , role: "USER", phone: phone, gender: genderIndex == 0 ? "Female" : "Male"  ).send {  (response: APIGenericResponse<LoginModelData>) in
               if response.status == true {
                   if let data = response.result {
                       showPopTopAlert(title: "Done Successfully".localize , withMessage: response.message  ?? "" , success: true )
                       UserDefaults.isLogin = true
                       UserDefaults.user = data
                       UserDefaults.accessToken = response.result?.accessToken
                       let vc =  homeVC()
                       self.push(vc)
                   }
               }
           }
    }

}

// MARK: - Routes -
extension SelectUserTypeVC {

}
