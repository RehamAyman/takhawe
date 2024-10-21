//
//  ProviderTripDetialsVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 29/03/1446 AH.
//
//  Template by MGAbouarab®


import UIKit
import GoogleMaps

class ProviderTripDetialsVC : BaseVC {
    
//MARK: - IBOutlets -
    @IBOutlet weak var vipSubmitOutlet: UIButton!
    
    @IBOutlet weak var cancelTrip: UIButton!
    @IBOutlet weak var vipHeight: NSLayoutConstraint!
    @IBOutlet weak var vipActionsStack: UIStackView!
    @IBOutlet weak var vipClientName: UILabel!
    @IBOutlet weak var clientImage: UIImageView!
    @IBOutlet weak var km: UILabel!
    @IBOutlet weak var vipTo: UILabel!
    @IBOutlet weak var vipFrom: UILabel!
    @IBOutlet weak var submitOutlet: UIButton!
    @IBOutlet weak var bottomStackHeight: NSLayoutConstraint!
    
    @IBOutlet weak var bottomStack: UIStackView!
    @IBOutlet weak var passengersTableView: UITableView!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var mainViewHeight: NSLayoutConstraint!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var googleMapsView: GMSMapView!
    @IBOutlet weak var reportAction: UIImageView!
    
    @IBOutlet weak var vipReport: UIImageView!
    @IBOutlet weak var vipContainerView: UIView!
    
//MARK: - Properties -
    var tripType : tripType = .basic
    let locationManager = CLLocationManager()
    var passedTrip : MainTripResult?
    var tripStatus : tripStatus = .comming
    var action: (() -> Void)?
  
    
    // trip status

// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.setUpGoogleMapView()
        if self.tripType == .basic {
            self.setUpMainBasicView()
        } else {
            self.setUpVipView()
           
        }
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.mainView.layer.addBasicShadow(cornerRadius: 20 )
        self.vipContainerView.layer.addBasicShadow(cornerRadius: 20 )
        self.from.text = self.passedTrip?.pickup_location?.description ?? ""
        self.to.text = self.passedTrip?.destination?.description ?? ""
        self.vipFrom.text = self.passedTrip?.pickup_location?.description ?? ""
        self.vipTo.text = self.passedTrip?.destination?.description ?? ""
        print("my current location send ......")
        print( locationManager.location?.coordinate.latitude ?? 0  )
        print(locationManager.location?.coordinate.longitude ?? 0 )
        print(self.passedTrip?.destination?.lat)
        self.km.text = getDestanceBetween(lat1: locationManager.location?.coordinate.latitude ?? 0 ,
                                          lng1: locationManager.location?.coordinate.longitude ?? 0,
                                          lat2: self.passedTrip?.destination?.lat ?? 0 ,
                                          lng2: self.passedTrip?.destination?.lng ?? 0 )
        
        
        if let image = self.passedTrip?.Passenger?.image {
            self.clientImage.setImage(image: image )
        }
        self.vipClientName.text = "Picking up".localize + " " + ( self.passedTrip?.Passenger?.name ?? "")
        
        passengersTableView.delegate = self
        passengersTableView.dataSource = self 
        passengersTableView.register(cellType: passengersCell.self)
        self.reportAction.addTapGesture {
            let vc = reportCancelVC()
            vc.report = true
            self.push(vc)
        }
        self.vipReport.addTapGesture {
            let vc = reportCancelVC()
            vc.report = true
            self.push(vc)
        }
        
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
    
    
    @IBAction func message(_ sender: UIButton) {
        self.OpenChat()
      
    }
    
    @IBAction func submitAction(_ sender: Any) {
        switch self.tripStatus {
        case.comming :
            self.updateTripStatus(status: .onWay)
        case .onWay :
            self.updateTripStatus(status: .arrived)
          
        case .arrived :// HANDLE START ACTION
            
            self.updateTripStatus(status: .inProgress)
            
        case .inProgress:
            print(" inprogress step action ")
            self.endBasicTrip()
          
        case .cancelled :
            print("cancelled")
        case .completed :
            print("completed already")
            
        }
    }
    
    
    @IBAction func callClient(_ sender: UIButton) {
        let phone = self.passedTrip?.Passenger?.image
        
        if let phoneURL = URL(string: "tel://\(+966444444444)") {
               if UIApplication.shared.canOpenURL(phoneURL) {
                   UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
               } else {
                   print("Phone call not supported on this device.")
               }
           } else {
               print("Invalid phone number.")
           }
    }
    
    
    @IBAction func vipSubmit(_ sender: UIButton) {
        switch self.tripStatus {
        case.comming :
            self.updateTripStatus(status: .onWay)
        case .onWay :
            self.updateTripStatus(status: .arrived)
          
        case .arrived :// HANDLE START ACTION
            
            self.updateTripStatus(status: .inProgress)
            
        case .inProgress:
            print(" inprogress step action ")
        case .cancelled :
            print("cancelled")
        case .completed :
            print("completed already")
            
        }
        
    }
    
    @IBAction func cancelTrip(_ sender: UIButton) {
        let vc = reportCancelVC()
        vc.report = false
        vc.type = self.tripType.rawValue
        self.push(vc)
    }
}


//MARK: - Networking -
extension ProviderTripDetialsVC {
 
    
    private func endBasicTrip () {
//        let vc = passengersRatingVC()
//        vc.modalPresentationStyle = .overFullScreen
//        self.present( vc  , animated: true )
//        
        
        activityIndicatorr.startAnimating()
        DriverRouter.endBasicTrip(id: self.passedTrip?.id ?? 0).send { [weak self ] ( response : APIGlobalResponse )  in
            guard let self = self else { return }
            if response.status == true {
                self.tripStatus = .completed
                // show passengers rating view list
                self.setUpMainBasicView()
            }
            
        }
    }
 
    
}

