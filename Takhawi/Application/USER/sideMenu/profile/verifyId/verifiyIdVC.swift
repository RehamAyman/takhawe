//
//  verifiyIdVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 02/05/1446 AH.
//
//  Template by MGAbouarab®


import UIKit
import SwiftUI

class verifiyIdVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var swiftUiContainer: UIView!
    
    
    
    
//MARK: - Properties -
    
    lazy var swiftUIView = UIHostingController(rootView:  verifiyIdSwiftUIView() )

    
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
         
        swiftUiContainer.addSubview(swiftUIView.view)
        swiftUIView.disableSafeArea()
        swiftUIView.view.backgroundColor = .clear
        swiftUIView.didMove(toParent: self)
        swiftUIView.view.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
        swiftUIView.view.leadingAnchor.constraint(equalTo: self.swiftUiContainer.leadingAnchor),
        swiftUIView.view.trailingAnchor.constraint(equalTo: self.swiftUiContainer.trailingAnchor),
        swiftUIView.view.topAnchor.constraint(equalTo: self.swiftUiContainer.topAnchor),
        swiftUIView.view.bottomAnchor.constraint(equalTo: self.swiftUiContainer.bottomAnchor)
           ])
       }
    
    
    
//MARK: - Actions -
    
    
    
}


//MARK: - Networking -
extension verifiyIdVC {
    
}

//MARK: - Routes -
extension verifiyIdVC {
    
}
