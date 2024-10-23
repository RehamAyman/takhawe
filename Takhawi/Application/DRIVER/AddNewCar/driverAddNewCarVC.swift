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
    
  // lazy var swiftUIView = addNewCarSwiftui()

    lazy var swiftUIView = UIHostingController(rootView: addNewCarSwiftui())
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
            addChild(swiftUIView)
           // swiftUIView.view.frame = swiftuiContainer.frame
            swiftuiContainer.addSubview(swiftUIView.view)
            swiftUIView.disableSafeArea()
            swiftUIView.didMove(toParent: self)
        
        
//        let hostingController = UIHostingController(rootView: swiftUIView)
//        guard let swiftUIView = hostingController.view else { return }
//           // Add the SwiftUI view to your containerView
//        self.swiftuiContainer.addSubview(swiftUIView)
        swiftUIView.view.translatesAutoresizingMaskIntoConstraints = false
//
//           // Constrain the SwiftUI view to fill the container
          NSLayoutConstraint.activate([
        swiftUIView.view.leadingAnchor.constraint(equalTo: self.swiftuiContainer.leadingAnchor),
        swiftUIView.view.trailingAnchor.constraint(equalTo: self.swiftuiContainer.trailingAnchor),
        swiftUIView.view.topAnchor.constraint(equalTo: self.swiftuiContainer.topAnchor),
        swiftUIView.view.bottomAnchor.constraint(equalTo: self.swiftuiContainer.bottomAnchor)
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
