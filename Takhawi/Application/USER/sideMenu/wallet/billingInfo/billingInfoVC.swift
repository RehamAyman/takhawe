//
//  billingInfoVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 22/05/1446 AH.
//
//  Template by MGAbouarab®


import UIKit
import MaterialComponents

class billingInfoVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var streetName: MDCOutlinedTextField!
    
    @IBOutlet weak var surname: MDCOutlinedTextField!
    
    @IBOutlet weak var cityName: MDCOutlinedTextField!
    @IBOutlet weak var state: MDCOutlinedTextField!
    //MARK: - Properties -
    var selectedCityId : Int = 0
    var  action: (() -> Void)?
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.streetName.label.text = "Enter Your Street name".localize
        self.streetName.handelTextField(placeHolder: "Enter Your Street name".localize)
        self.surname.label.text = "Enter Your Surname".localize
        self.surname.handelTextField(placeHolder: "Enter Your Surname".localize)
        self.state.label.text = "Enter Your State".localize
        self.state.handelTextField(placeHolder: "Enter Your State".localize)
        self.cityName.label.text = "Choose your city".localize
        self.cityName.handelTextField(placeHolder: "Choose your city".localize)
        
        
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
    
    @IBAction func openCitties(_ sender: UIButton) {
        let vc = chooseCityVC()
        vc.action = { cityModel in
            self.cityName.text = cityModel.name ?? ""
            self.selectedCityId = cityModel.id ?? 0
        }
        self.present(vc, animated: true )
        
    }
    @IBAction func addAction(_ sender: UIButton) {
        self.createBillingInfo()
    }
    
}


//MARK: - Networking -
extension billingInfoVC {
    func  createBillingInfo () {
        if self.cityName.text == "" || self.surname.text == "" || self.state.text == "" || self.streetName.text == "" {
            showInfoTopAlert(withMessage: "Empty Field".localize)
        } else {
            activityIndicatorr.startAnimating()
            UserRouter.createBillingInfo(surname: self.surname.text ?? ""  , street: self.streetName.text ?? ""  , cityId: self.selectedCityId , state: self.state.text ?? "" ).send { [weak self] (response : APIGlobalResponse )  in
                guard let self = self else { return }
                if response.status == true {
                    // go to add card to the webview
                    
                    self.action?()
                    self.pop(animated: true  )
                }
                
            }
        }
    }
    
}

//MARK: - Routes -
extension billingInfoVC {
    
}
