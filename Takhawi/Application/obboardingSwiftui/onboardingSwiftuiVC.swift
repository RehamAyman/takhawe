//
//  onboardingSwiftuiVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 09/01/2024.
//
//  Template by MGAbouarab®


import UIKit
import SwiftUI

class onboardingSwiftuiVC: BaseVC {
    
//MARK: - IBOutlets -
    
    
//MARK: - Properties -
    
    lazy var swiftUIView = UIHostingController(rootView: onboardingSwiftuiView {
        let vc = phoneAndLocationVC()
        self.push(vc)
        
    } )
                                                
//MARK: - Creation -
 
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        addChild(swiftUIView)
        swiftUIView.view.frame = view.frame
        view.addSubview(swiftUIView.view)
        swiftUIView.didMove(toParent: self)
        
        
        
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension onboardingSwiftuiVC {
    
}

//MARK: - Routes -
extension onboardingSwiftuiVC {
    
}
