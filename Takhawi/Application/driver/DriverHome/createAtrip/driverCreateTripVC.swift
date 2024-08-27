//
//  driverCreateTripVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 20/02/1446 AH.
//
//  Template by MGAbouarab®


import UIKit
import MaterialComponents

class driverCreateTripVC: BaseVC {
    
//MARK: - IBOutlets -
    
    
    @IBOutlet weak var seatPrice: MDCOutlinedTextField!
    @IBOutlet weak var availableSeats: MDCOutlinedTextField!
    
    @IBOutlet weak var dateAndTime: MDCOutlinedTextField!
    
    @IBOutlet weak var destination: MDCOutlinedTextField!
    
    @IBOutlet weak var gatheringPoint: UIView!
    @IBOutlet weak var gathering: MDCOutlinedTextField!
 
    
    //MARK: - Properties -
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.handleTextfields()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
    }
    
//MARK: - Logic Methods -
    func handleTextfields () {
        self.gathering.label.text = "Search for Gathering Point".localize
        self.gathering.handelTextField(placeHolder: "Search for Gathering Point".localize)
        self.destination.label.text = "Search for Destination".localize
        self.destination.handelTextField(placeHolder: "Destination".localize)
        self.dateAndTime.label.text = "Choose Date and Time".localize
        self.dateAndTime.handelTextField(placeHolder: "Choose Date and Time".localize)
        self.availableSeats.label.text = "number of available seats".localize
        self.availableSeats.handelTextField(placeHolder: "number of available seats".localize)
        self.seatPrice.label.text = "price of the Seat".localize
        self.seatPrice.handelTextField(placeHolder: "price of the Seat".localize)
    }
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension driverCreateTripVC {
    
}

//MARK: - Routes -
extension driverCreateTripVC {
    
}
