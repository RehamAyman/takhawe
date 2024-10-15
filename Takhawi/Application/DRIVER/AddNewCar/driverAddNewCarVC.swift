//
//  driverAddNewCarVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 12/04/1446 AH.
//
//  Template by MGAbouarab®


import UIKit
import SwiftUI

class driverAddNewCarVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var swiftuiContainer: UIView!
    
//MARK: - Properties -
    
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.addSwiftUIView()
    }
    
    
    
//MARK: - Logic Methods -
    private func addSwiftUIView() {
        var swiftUIView = addNewCarSwiftui()
        let hostingController = UIHostingController(rootView: swiftUIView)
        guard let swiftUIView = hostingController.view else { return }
           // Add the SwiftUI view to your containerView
        self.swiftuiContainer.addSubview(swiftUIView)
           swiftUIView.translatesAutoresizingMaskIntoConstraints = false

           // Constrain the SwiftUI view to fill the container
           NSLayoutConstraint.activate([
            swiftUIView.leadingAnchor.constraint(equalTo: self.swiftuiContainer.leadingAnchor),
            swiftUIView.trailingAnchor.constraint(equalTo: self.swiftuiContainer.trailingAnchor),
            swiftUIView.topAnchor.constraint(equalTo: self.swiftuiContainer.topAnchor),
            swiftUIView.bottomAnchor.constraint(equalTo: self.swiftuiContainer.bottomAnchor)
           ])
       }
    
//MARK: - Actions -
    
    
}


//MARK: - Networking -
extension driverAddNewCarVC {
    
}

//MARK: - Routes -
extension driverAddNewCarVC {
    
}
