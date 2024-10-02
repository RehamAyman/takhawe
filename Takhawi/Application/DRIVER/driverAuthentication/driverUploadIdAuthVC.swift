//
//  driverUploadIdAuthVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 24/01/2024.
//
//  Template by MGAbouarab®


import UIKit
import SwiftUI


class driverAuthVC: BaseVC {
    
//MARK: - IBOutlets -
     var selection : Int = 1
    
    
    
    
    
//MARK: - Properties -
    
    lazy var swiftUIView = UIHostingController(rootView:
                                           
          driverAuthView (tabSelection: selection ){
        print("driver done in his authentication .. present popup .. .")
        let vc = baseSuccessAlertVC()
        vc.mainTitleText = "Thank you".localize
        vc.subTitleText = "Your account has been created successfully and is awaiting review by the administration.".localize
        vc.driver = true
        
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        vc.DriverAction  = {
            // go to driver home 
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "DriverTabbar") as! DriverTabbar
            let vc =  phoneAndLocationVC() //   LoginVC()
            self.push(vc)
            
        }
        
        self.present(vc , animated: true )
    } BackAction: {
        self.pop(animated: true)
    }
    
    
    )
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
       
       
      
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.navigationController?.navigationBar.isHidden = true
        self.importSwiftuiView()
        
    }
    
//MARK: - Logic Methods -
    
    private func importSwiftuiView () {
        addChild(swiftUIView)
        swiftUIView.view.frame = view.frame
        view.addSubview(swiftUIView.view)
        swiftUIView.disableSafeArea()
        swiftUIView.didMove(toParent: self)

    }
    
    
//MARK: - Actions -
    
}

