//
//  findingAdriverVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/11/2023.
//
//  Template by MGAbouarab®


import UIKit
import Lottie

class findingAdriverVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var loadingView: LottieAnimationView!
    
//MARK: - Properties -
    var cancel : (() -> Void)?
    var  didfindAdrivier : (() -> Void)?
    var userCancel : Bool = false
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        loadingView.contentMode = .scaleAspectFit
  
        loadingView.loopMode = .loop
        loadingView.animationSpeed = 0.9
        loadingView.play()
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5 ) {
//            if self.userCancel == false {
//                self.didfindAdrivier?()
//                self.dismiss(animated: true )
//            }
//        }
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    @IBAction func cancel(_ sender: UIButton) {
        self.userCancel = true
        self.cancel?()
        
        self.dismiss(animated: true )
      
    }
    
}


//MARK: - Networking -
extension findingAdriverVC {
    
}

//MARK: - Routes -
extension findingAdriverVC {
    
}
