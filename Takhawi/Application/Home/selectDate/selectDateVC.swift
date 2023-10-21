//
//  selectDateVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 18/10/2023.
//
//  Template by MGAbouarab®


import UIKit
import SwiftUI


class selectDateVC: BaseVC {
    
//MARK: - IBOutlets -
    
    
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var visualView: UIVisualEffectView!
    @IBOutlet weak var mainView: UIView!
    
    
//MARK: - Properties -
    lazy var swiftUIView = UIHostingController(rootView: WeeksTabView() )
    var onCommit: (() -> Void)? = nil
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.impedCalendarSwiftui()
        self.mainView.layer.addBasicShadow(cornerRadius: 35 )
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4)  { [weak self] in
        self?.visualView.isHidden = false
       }
    }
    
//MARK: - Logic Methods -
    
    
    
//MARK: - Actions -
    
    @IBAction func selectADate(_ sender: UIButton) {
        self.dismiss(animated: false)
        self.onCommit?()
     
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        self.visualView.isHidden = true
        self.dismiss(animated: true )
      
    }
    
}


//MARK: - Networking -
extension selectDateVC {
    
}

//MARK: - Routes -
extension selectDateVC {
    
}
