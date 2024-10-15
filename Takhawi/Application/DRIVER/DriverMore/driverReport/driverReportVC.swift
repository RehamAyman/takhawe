//
//  driverReportVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 11/04/1446 AH.
//
//  Template by MGAbouarab®


import UIKit
import SwiftUI

class driverReportVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var reportContainer: UIView!
    
//MARK: - Properties -
    
    

    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.addSwiftUIView()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
    }
    
//MARK: - Logic Methods -
    
    private func addSwiftUIView() {
        var swiftUIView = driverReportSwiftui()
        swiftUIView.action = {
            print("swift got the action")
            self.push(profitDetailsVC())
        }
           let hostingController = UIHostingController(rootView: swiftUIView)

           guard let swiftUIView = hostingController.view else { return }

           // Add the SwiftUI view to your containerView
        self.reportContainer.addSubview(swiftUIView)
           swiftUIView.translatesAutoresizingMaskIntoConstraints = false

           // Constrain the SwiftUI view to fill the container
           NSLayoutConstraint.activate([
            swiftUIView.leadingAnchor.constraint(equalTo: self.reportContainer.leadingAnchor),
            swiftUIView.trailingAnchor.constraint(equalTo: self.reportContainer.trailingAnchor),
            swiftUIView.topAnchor.constraint(equalTo: self.reportContainer.topAnchor),
            swiftUIView.bottomAnchor.constraint(equalTo: self.reportContainer.bottomAnchor)
           ])
       }
  








    
    
//MARK: - Actions -
    
    
    
}


//MARK: - Networking -
extension driverReportVC {
    
}

//MARK: - Routes -
extension driverReportVC {
    
}
