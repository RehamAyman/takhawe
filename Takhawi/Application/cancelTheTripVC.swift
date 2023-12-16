//
//  cancelTheTripVCVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 14/12/2023.
//
//  Template by MGAbouarab®


import UIKit

class cancelTheTripVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var screenTitle: UILabel!
    //MARK: - Properties -
    var report : Bool = false
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.mainView.layer.addBasicShadow(cornerRadius: 20)
        if report {
            self.screenTitle.text = "We're so sad about your Report"
            self.subTitle.text = "We will continue to improve our service & satisfy you on the next trip."
        }
    }
    

    
//MARK: - Actions -
    
    @IBAction func dismiss(_ sender: UIButton) {
        sender.animateButtonWhenPressed {
            self.dismiss(animated: true )
        }
    }
}


//MARK: - Networking -
extension cancelTheTripVC {
    
}

//MARK: - Routes -
extension cancelTheTripVC{
    
}
