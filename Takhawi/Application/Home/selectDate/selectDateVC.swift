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
    @IBOutlet weak var timePicker: UIDatePicker!
    
    @IBOutlet weak var containerHeight: NSLayoutConstraint!
    //MARK: - IBOutlets -
    
    @IBOutlet weak var timeContainerHeight: NSLayoutConstraint!
    @IBOutlet weak var timeContainerView: UIView!
    
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var mainView: UIView!
    var dismissAction: (() -> Void)?
    
    @ObservedObject var weekStoreModel =  WeekStore()
//MARK: - Properties -
    lazy var swiftUIView = UIHostingController(rootView: WeeksTabView(weekStoreModel: self.weekStoreModel) )
    var change : ((String , Date ) -> Void)?
    var makeAtripCalendar : ((String , Date) -> Void)?
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
        
        
       
        
    
          
    }
    
//MARK: - Logic Methods -
    
    
    
//MARK: - Actions -
    
    @IBAction func selectADate(_ sender: UIButton) {
        let ksaTimeZone = TimeZone(identifier: "Asia/Riyadh")!
        
        print(weekStoreModel.stringSelected)
        print(weekStoreModel.selectedDate)
        print(weekStoreModel.selectedDate.tomorrow.ISO8601Format() )
        print(weekStoreModel.selectedDate.tomorrow)
        print(weekStoreModel.selectedDate.dateToString)
        
        self.change?(weekStoreModel.stringSelected , weekStoreModel.selectedDate)
        if comeFromMakeAtrip {
            self.makeAtripCalendar?("\(weekStoreModel.stringSelected) ,\(self.timePicker.date.timeToString())", weekStoreModel.selectedDate)
        }
        self.dismiss(animated: true )
        
                
    }
    
    
  
    
    
    @IBAction func cancel(_ sender: UIButton) {
        self.dismissAction?()
        self.dismiss(animated: true )
      
    }
    
}


//MARK: - Networking -
extension selectDateVC {
    
}

//MARK: - Routes -
extension selectDateVC {
    
}
