//
//  makeAtripAlertPopUpVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/11/2023.
//
//  Template by MGAbouarab®


import UIKit

class makeAtripAlertPopUpVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var alertImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var visualView: UIVisualEffectView!
    @IBOutlet weak var okOutlet: UIButton!
    
//MARK: - Properties -
    
    var action: (() -> Void)?


// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.okOutlet.layer.addBasicShadow(cornerRadius: 22 )
        self.mainView.layer.addBasicShadow(cornerRadius: 20)
        self.openingAnimation()
        
     
        
        
        
    }
    
//MARK: - Logic Methods -
    private func openingAnimation () {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4)  { [weak self] in
        self?.visualView.isHidden = false
            
            UIView.animate(withDuration: 0.5) {
                self?.alertImage.layer.transform = CATransform3DMakeScale( 1.3 , 1.3 , 1)
            } completion: { completed  in
                if completed {
                    UIView.animate(withDuration: 0.5) {
                        self?.alertImage.layer.transform = CATransform3DMakeScale(1, 1, 1)
                        // do here any actionn after animation done !
                        
                        
                    }
                }
            }
       }
    }
    
//MARK: - Actions -
    
    @IBAction func okAction(_ sender: UIButton) {
        self.dismiss(animated: true )
        self.action?()
    }
    @IBAction func dismissview(_ sender: UIButton) {
        sender.animateButtonWhenPressed {
            self.dismiss(animated: true )
            
        }
    }
}


//MARK: - Networking -
extension makeAtripAlertPopUpVC {
    
}

//MARK: - Routes -
extension makeAtripAlertPopUpVC {
    
}
