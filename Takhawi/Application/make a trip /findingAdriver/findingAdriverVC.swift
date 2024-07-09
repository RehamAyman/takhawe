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
    var  didfindAdrivier : (([offerResult]) -> Void)?
    var userCancel : Bool = false
    var tripId : Int = 0 
    var count : Int = 0
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.getAllVipTrips()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        loadingView.contentMode = .scaleAspectFit
        loadingView.loopMode = .loop
        loadingView.animationSpeed = 0.9
        loadingView.play()
       

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
    func getAllVipTrips () {
      
        UserRouter.getAllVipOffers(id: self.tripId).send { [weak self ] (response:APIGenericResponse<[offerResult]> ) in
            guard let self = self else { return }
            if response.result?.isEmpty == true {
                
                if self.count < 20 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 60) {
                        self.getAllVipTrips()
                        self.count += 1
                    }
                }
            } else {
                guard let offers = response.result else { return}
                self.didfindAdrivier?(offers)
                    self.dismiss(animated: true )
                }
            
        }
    }
    
}

//MARK: - Routes -
extension findingAdriverVC {
    
}
