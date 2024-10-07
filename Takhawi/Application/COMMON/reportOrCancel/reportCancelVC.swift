//
//  reportCancelVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 14/12/2023.
//
//  Template by MGAbouarab®


import UIKit
import MaterialComponents

class reportCancelVC: BaseVC {
    
//MARK: - IBOutlets -
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var subTitleHint: UILabel!
    @IBOutlet weak var screenTitle: UILabel!
    
    @IBOutlet weak var noteText: MDCOutlinedTextArea!
    //MARK: - Properties -
    var report : Bool = false
  
    
    let items : [cancellationReason] = [
        
        cancellationReason(name:  "Waiting for long time".localize   , key:  "Waiting for long time") ,
        cancellationReason(name:  "Driver denied to go to destination".localize   , key:  "Driver denied to go to destination") ,
        cancellationReason(name:  "Unable to contact driver".localize , key:  "Unable to contact driver" ) ,
        cancellationReason(name:  "Driver denied to come to pickup".localize , key:  "Driver denied to come to pick up" ) ,
        cancellationReason(name:  "Wrong address shown".localize , key:  "Wrong address shown" ) ,
        cancellationReason(name:  "Unable to contact driver".localize , key:  "Unable to contact driver" ) ,
        cancellationReason(name:  "The price is not reasonable".localize , key:  "The price is not reasonable" )
    ]

    var type : String = ""
    var id : Int = 0
    var passengerTripId : Int = 0
    var selectedIndex : String = ""
    var driver : Bool = false 
   
    
    
//MARK: - Creation -
  
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: reportOrCandelCell.self)
        self.setupMainView()
    }
    
    

    
    
//MARK: - Actions -
    
    @IBAction func submit(_ sender: UIButton) {
        if self.report == false {
            if self.selectedIndex == "" {
                showInfoTopAlert(withMessage: "please select a reason first")
            } else {
                self.cancelTrip(tripId: self.id , type: self.type, passengerId: self.passengerTripId)
            }
        } else {
            
        }
    }
}




//MARK: - Networking -
extension reportCancelVC {
    
}

//MARK: - Routes -
extension reportCancelVC {
    
}
