//
//  registerTapsVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 21/09/2023.
//
//  Template by MGAbouarab®


import UIKit
import SwiftUI
import IQKeyboardManagerSwift

class registerTapsVC: BaseVC {
   
    
//MARK: - IBOutlets -
    
    
    
//MARK: - Properties -
    
    
    
   lazy var swiftUIView = UIHostingController(rootView: registerTabs{
        print("here i catch next button  well 🥳")
        let vc = SelectUserTypeVC()
        self.navigationController?.pushViewController(vc, animated: true)
   } BackAction: {
       print("hello i catch back action well 🥳 ")
       self.pop(animated: true)
   } )
    
    
    
//MARK: - Creation -
 
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        IQKeyboardManager.shared.enable = false 
        self.configureInitialDesign()
        self.navigationController?.navigationBar.isHidden = true
        self.importSwiftuiView()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        IQKeyboardManager.shared.enable = true
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
    }
    private func importSwiftuiView () {
        
        
        
        
        addChild(swiftUIView)
        swiftUIView.view.frame = view.frame
        view.addSubview(swiftUIView.view)
        
        swiftUIView.didMove(toParent: self)
        
        
        
        
    }
    
    
    
//MARK: - Logic Methods -
    
    func push () {
        
    }
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension registerTapsVC {
    
}

//MARK: - Routes -
extension registerTapsVC {
    
}
