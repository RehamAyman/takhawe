//
//  emptyBookingVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 24/04/1446 AH.
//
//  Template by MGAbouarab®


import UIKit
import Lottie

class emptyBookingVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var lottieV: LottieAnimationView!
    
//MARK: - Properties -
    
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        lottieV.backgroundColor = UIColor.clear
       
        lottieV.contentMode = .scaleAspectFit
        lottieV.loopMode = .loop
        lottieV.animationSpeed = 1
        lottieV.play()
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension emptyBookingVC {
    
}

//MARK: - Routes -
extension emptyBookingVC {
    
}
