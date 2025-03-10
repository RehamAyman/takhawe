//
//  driverCreateTripVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 20/02/1446 AH.
//
//  Template by MGAbouarab®


import UIKit
import MaterialComponents
import CoreLocation

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
    var pickuplocation :  meetingLocation?
    var endLocation : meetingLocation?
    
    var selectedDate : Date = Date()
    var dummyActivty : [dummyActivity] = [
      
        dummyActivity(icon: "Food", name: "FOOD", id: 1 ) ,
        dummyActivity(icon: "smoke", name: "NO SMOKING", id: 2 ) ,
        dummyActivity(icon: "Vector 3", name: "WIFI", id: 3  ) ,
        dummyActivity(icon: "music 1", name: "MUSIC", id: 4  ) ,
        dummyActivity(icon: "AC", name: "AIR CONDITIONER", id: 5 ) ,
        dummyActivity(icon: "Group 1000003070", name: "WIFI"  , id: 6 ) ,
        dummyActivity(icon: "cable", name: "CHARGING"  , id: 7 ) ,
        dummyActivity(icon: "BackScreen", name: "REAR SCREEN"  , id: 8 ) ,
        dummyActivity(icon: "carSeat", name: "MASSAGE SEAT"  , id: 9 )  ,
      //  dummyActivity(icon: "heat", name: "HEATING"  , id: 10 ) ,
        dummyActivity(icon: "Group 1000003071", name: "AVAILABILE TRAVEL BAG"  , id: 11 )
        
    ]
    var selectedFeatures : [String] = []
    
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.handleTextfields()
        self.getAllMeetingLocations()
        availableSeats.delegate = self
        
       
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
    
    @IBAction func distnationAction(_ sender: Any) {
        self.openDriverMeetingPointsMap(isDistnation: true)

    }
    
    @IBAction func gathringAction(_ sender: Any) {
        self.openDriverMeetingPointsMap(isDistnation: false)
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
            let isoFormatter = ISO8601DateFormatter()
            isoFormatter.timeZone = TimeZone(abbreviation: "UTC")
            let isoDateString = isoFormatter.string(from: self.selectedDate )
            // calculate the time the trip will take and pass the end trip time 
            
            DriverRouter.createBasic(endDate: self.getTheEndDate(selectedDate: self.selectedDate) , startDate: self.selectedDate.ISO8601Format() , seatsNo: steatsNo , PickLocationId: self.selectedPickUp, destLocationId: self.SelectdDestination, features: self.selectedFeatures , price: seatPrice).send { [weak self ] (response: APIGlobalResponse ) in
                guard let self = self else { return }
                if  response.status == true {
                    showPopTopAlert(title: "Sent Successfully".localize, withMessage: response.message , success: true )
                    self.pop(animated: true)
                }
            }
        }
    }
    
    
    
    func getTheEndDate (selectedDate : Date ) -> String {
        
        let coordinatesA = (latitude: self.pickuplocation?.lat ?? 0.0 , longitude: self.pickuplocation?.lng ?? 0.0)
        let coordinatesB = (latitude: self.endLocation?.lat ?? 0.0  , longitude: self.endLocation?.lng ?? 0.0 )

        let locationA = CLLocation(latitude: coordinatesA.latitude, longitude: coordinatesA.longitude)
        let locationB = CLLocation(latitude: coordinatesB.latitude , longitude: coordinatesB.longitude)
        let distanceInKM =  ( locationA.distance(from: locationB) / 100 ).rounded()
        
        
        
       
        print( "\(distanceInKM.rounded() + 2  )" + "mins" )
        let timeInMins =  Int( distanceInKM.rounded() + 2 )
        print("-----------------")
        print(selectedDate)
        print(timeInMins)
        
        guard let thirtyMinutesLater = Calendar.current.date(byAdding: .minute, value: timeInMins , to: selectedDate) else { return "" }
            // Convert to ISO 8601 format
        print("⏰")
        
            let isoDateFormatter = ISO8601DateFormatter()
            isoDateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds] // Include fractional seconds if needed
            let isoString = isoDateFormatter.string(from: thirtyMinutesLater)
        print(thirtyMinutesLater)
        print(isoString)
        
        return isoString
        
        
        
    }
    
    
    func getAllMeetingLocations () {
        activityIndicatorr.startAnimating()
        DriverRouter.getMeetingLocations.send { [weak self ]  (response: APIGenericResponse<[meetingLocationResult]> ) in
            guard let self = self else { return }
            if let result = response.result {
                self.meetingLocationArray = result
                
                //self.selectFromMeetingLocation(button: self.destinationLocationBtn, textField: self.destination, destination: true )
//                self.selectFromMeetingLocation(button: self.meetingLocationBtn, textField: self.gathering, destination: false )
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
                    
                    self.endLocation = self.meetingLocationArray.first(where: { $0.id ==  self.SelectdDestination  })?.location
                    print(self.endLocation)
                    
                } else {
                    self.selectedPickUp = Int ( action.identifier.rawValue ) ?? 0
                    self.pickuplocation = self.meetingLocationArray.first(where: { $0.id ==  self.selectedPickUp  })?.location
                    
                    print(self.pickuplocation)
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
    
    func openDriverMeetingPointsMap(isDistnation:Bool){
        let vc  =  DriverPointsGoogleMapVC()
        vc.meetingLocationArray  = self.meetingLocationArray
        vc.isDistnation = isDistnation
        vc.didSelectLocation = { location , isDistnation in
            if isDistnation{
                if self.gathering.text != location.name {
                    self.destination.text = location.name
                    self.SelectdDestination = location.id ?? 0
                    self.endLocation = location.location
                } else {
                    showInfoTopAlert(withMessage: "the pickup location & destination can not be the same.. ")
                }
            }else{
                
                if self.destination.text != location.name {
                    self.gathering.text = location.name
                    self.selectedPickUp = location.id ?? 0
                    self.pickuplocation = location.location
                } else {
                    showInfoTopAlert(withMessage: "the pickup location & destination can not be the same.. ")
                }
                
            }
            
        }
        self.push(vc)
    }
}
