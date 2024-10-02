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
    
    @IBOutlet weak var destinationLocationBtn: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var meetingLocationBtn: UIButton!
    @IBOutlet weak var calnderView: UIView!
    @IBOutlet weak var seatPrice: MDCOutlinedTextField!
    @IBOutlet weak var availableSeats: MDCOutlinedTextField!
    
    @IBOutlet weak var dateAndTime: MDCOutlinedTextField!
    
    @IBOutlet weak var destination: MDCOutlinedTextField!
    
    @IBOutlet weak var gatheringPoint: UIView!
    @IBOutlet weak var gathering: MDCOutlinedTextField!
 
    
//MARK: - Properties -
    
    var meetingLocationArray : [meetingLocationResult] = []
    var selectedPickUp : Int = 0
    var SelectdDestination : Int = 0
    var selectedDate : Date = Date()
    var dummyActivty : [dummyActivity] = [
        dummyActivity(icon: "Food", name: "FOOD", id: 0 ) ,
        dummyActivity(icon: "smoke", name: "NO SMOKING", id: 1 ) ,
        dummyActivity(icon: "Vector 3", name: "WIFI", id: 2  ) ,
        dummyActivity(icon: "music 1", name: "MUSIC" , id: 3  ) ,
        dummyActivity(icon: "AC", name: "AIR CONDITIONER" , id: 4)
    ]
    var selectedFeatures : [String] = []
    
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.handleTextfields()
        self.getAllMeetingLocations()
       
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: chooseFeatureCell.self)
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
    
    @IBAction func addTrip(_ sender: UIButton) {
        self.createAtrip()
    }
    @IBAction func openCander(_ sender: UIButton) {
       
      let vc = openCalendarVC()
        vc.action = { date in
            print("hello i select \(date)")
            self.dateAndTime.text = date.dateToString
            self.selectedDate = date
            
        }
      vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true )
        
        
    }
}


//MARK: - Networking -
extension driverCreateTripVC {
    
    func createAtrip () {
        if self.availableSeats.text == "" || self.seatPrice.text == "" || self.dateAndTime.text == "" || self.destination.text == "" || self.gathering.text == "" {
            showPopTopAlert(title: "Empty Field".localize , withMessage: "All Fields are required ".localize , success: false )
        } else {
            activityIndicatorr.startAnimating()
            let steatsNo : Int =  Int( self.availableSeats.text ?? "") ?? 0
            let seatPrice : Int =  Int( self.seatPrice.text ?? "") ?? 0
            DriverRouter.createBasic(endDate: self.selectedDate.ISO8601Format() , startDate: self.selectedDate.ISO8601Format() , seatsNo: steatsNo , PickLocationId: self.selectedPickUp, destLocationId: self.SelectdDestination, features: self.selectedFeatures , price: seatPrice).send { [weak self ] (response: APIGlobalResponse ) in
                guard let self = self else { return }
                if  response.status == true {
                    showPopTopAlert(title: "Sent Successfully".localize, withMessage: response.message , success: true )
                    self.pop(animated: true)
                }
            }
        }
    }
    
    
    
    func getAllMeetingLocations () {
        activityIndicatorr.startAnimating()
        DriverRouter.getMeetingLocations.send { [weak self ]  (response: APIGenericResponse<[meetingLocationResult]> ) in
            guard let self = self else { return }
            if let result = response.result {
                self.meetingLocationArray = result
                self.selectFromMeetingLocation(button: self.destinationLocationBtn, textField: self.destination, destination: true )
                self.selectFromMeetingLocation(button: self.meetingLocationBtn, textField: self.gathering, destination: false )
            }
        }
    }
    
    
    
    private func selectFromMeetingLocation (button : UIButton , textField : UITextField , destination : Bool  ) {

        if self.meetingLocationArray.isEmpty == false {
            let actionClosure = { (action: UIAction) in
                print("👀✋🏻 i select regon name : \(action.title ) with id : \(action.identifier.rawValue)")
                   textField.text = action.title
                if destination {
                    self.SelectdDestination = Int ( action.identifier.rawValue ) ?? 0
                } else {
                    self.selectedPickUp = Int ( action.identifier.rawValue ) ?? 0
                }
            }
            var menuChildren: [UIMenuElement] = []
            for i in self.meetingLocationArray {
                menuChildren.append(UIAction(title: i.name ?? "" , identifier: UIAction.Identifier( String ( i.id ?? 0 ) )  , handler: actionClosure))
            }
            button.menu = UIMenu( children: menuChildren)
            button.showsMenuAsPrimaryAction = true
            button.tintColor = UIColor.clear
        }else {
            print("✋🏻empty array ")
        }
    }
    
}

//MARK: - Routes -
extension driverCreateTripVC {
    
}
