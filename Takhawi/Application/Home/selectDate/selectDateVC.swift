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
    @IBOutlet weak var amPmSegment: UISegmentedControl!
    
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    //MARK: - IBOutlets -
    
    @IBOutlet weak var timeContainerHeight: NSLayoutConstraint!
    @IBOutlet weak var timeContainerView: UIView!
    
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var visualView: UIVisualEffectView!
    @IBOutlet weak var mainView: UIView!
    var action: (() -> Void)?
    
    @ObservedObject var weekStoreModel =  WeekStore()
//MARK: - Properties -
    lazy var swiftUIView = UIHostingController(rootView: WeeksTabView(weekStoreModel: self.weekStoreModel) )
    var change : ((String) -> Void)?
    var comeFromMakeAtrip : Bool = false 
    
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
        if comeFromMakeAtrip == true  {
            self.timeContainerHeight.constant = 60
            self.containerHeight.constant = 400
            self.timeContainerView.isHidden = false
        } else {
            self.timeContainerHeight.constant = 0
            self.containerHeight.constant = 350
            self.timeContainerView.isHidden = true
        }
        
        
       
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4)  { [weak self] in
            self?.visualView.isHidden = false
            
            
        }
          
    }
    
//MARK: - Logic Methods -
    
    
    
//MARK: - Actions -
    
    @IBAction func selectADate(_ sender: UIButton) {
       
        print(weekStoreModel.stringSelected)
        
        self.change?(weekStoreModel.stringSelected)
        self.dismiss(animated: true )
        
        
        
    }
    
    
    @IBAction func selectTime(_ sender: UIButton) {
        self.action?()
    
      
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
