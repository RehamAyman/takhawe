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
    
    
    
    
    
//MARK: - Properties -
    
    lazy var swiftUIView = UIHostingController(rootView: driverAuthView() )
    
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
        swiftUIView.didMove(toParent: self)

    }
    
    
//MARK: - Actions -
    
}

