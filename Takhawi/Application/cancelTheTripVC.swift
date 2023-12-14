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
    
    @IBOutlet weak var mainView: UIView!
    
//MARK: - Properties -
    
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.mainView.layer.addBasicShadow(cornerRadius: 20)
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
