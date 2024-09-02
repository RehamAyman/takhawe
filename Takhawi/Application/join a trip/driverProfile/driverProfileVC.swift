//
//  driverProfileVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 19/10/2023.
//
//  Template by MGAbouarab®


import UIKit
import GoogleMaps
import Cosmos

class driverProfileVC: BaseVC {
    @IBOutlet weak var driverRate: CosmosView!
    
    @IBOutlet weak var seatPrice: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var from: UILabel!
    @IBOutlet weak var weatherContainerProg: UIView!
    @IBOutlet weak var weatherIndicator: UIActivityIndicatorView!
    @IBOutlet weak var weatherIcon: UIImageView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var tripDate: UILabel!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var driverContainerView: UIView!
    @IBOutlet weak var mainStack: UIStackView!
    @IBOutlet weak var BottomcontainerStack: UIStackView!
    //MARK: - IBOutlets -
    @IBOutlet weak var tripCountLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var driverImage: UIImageView!
    
    @IBOutlet weak var googleView: GMSMapView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var sendOfferContainerView: UIView!
    //MARK: - Properties -
    var dummyActivty : [dummyActivity] = [
        dummyActivity(icon: "Group 1", name: "Basketball".localize, id: 0 ) ,
        dummyActivity(icon: "03-hat", name: "Riding Horse".localize, id: 1 ) ,
        dummyActivity(icon: "paint-palette 1", name: "Drawing".localize, id: 2 ) ,
        dummyActivity(icon: "music 1", name: "Listen to music".localize, id: 3 ) ,
        dummyActivity(icon: "airplane-around-earth 1", name: "Travelling".localize, id: 4 )
    ]

    var animatePolyline: AnimatePolyline?
    var isDriverAcc : Bool = false
    var tripDetails : BasicTripResult?
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
   
    var pickupLat : Double = 0.0
    var pickupLong : Double = 0.0
    var destLat : Double = 0.0
    var destLong : Double = 0.0
    
    var comeFromBasicTrip : Bool = false
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        weatherManager.delegate = self
        
        self.weatherIndicator.startAnimating()
        if comeFromBasicTrip {
            self.from.text = self.tripDetails?.startLocation ?? "--"
            self.to.text = self.tripDetails?.destinationlocationname ?? "--"
            self.seatPrice.text = "\(self.tripDetails?.basic_trip_price_per_seat ?? 0 )"
            self.getOneBasicTrip()
        }
    }

    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
         self.containerView.layer.addBasicShadow(cornerRadius: 35)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.collectionView.register(cellType: profileCell.self)
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        self.googleView.layer.addBasicShadow(cornerRadius: 30)
        self.setUpGoogleView()
        self.tripCountLabel.cornerRadius = 17
        self.tripCountLabel.layer.masksToBounds = true 
     
// force the bottom view  to be in the left according to client requirement
        self.BottomcontainerStack.semanticContentAttribute = .forceLeftToRight
// arrange views according to the account type
        if isDriverAcc {
            self.mainStack.removeArrangedSubview(self.BottomcontainerStack)
         
            self.BottomcontainerStack.removeFromSuperview()
           

        } else {
            self.mainStack.removeArrangedSubview(self.sendOfferContainerView)
            self.mainStack.removeArrangedSubview(self.driverContainerView)
            self.driverContainerView.removeFromSuperview()
            self.sendOfferContainerView.removeFromSuperview()
        }
        self.setMainDataInfo()
        
    }
    
    
    
//MARK: - Logic Methods -
    
  
//MARK: - Actions -
    
    
    
    @IBAction func reserveYourSeatAction(_ sender: UIButton) {
        let vc = ReserveTheTripVC()
        vc.viptrip = false
        vc.tripDetails = self.tripDetails
        self.push(vc)
    }
    
    
    
    @IBAction func fullGoogleView(_ sender: UIButton) {
        let vc = fullScreenGoogleViewVC()
        vc.tripDetails = self.tripDetails
        vc.modalPresentationStyle = .fullScreen
        self.present(vc , animated: true )
    }
    
    
    
    @IBAction func reviewsAction(_ sender: UIButton) {
    //    sender.animateButtonWhenPressed {
            self.push(reviewsViewVC())
    //    }
        
        
        
        
        
        
    }
    
}


//MARK: - Networking -
extension driverProfileVC {
    
    func getOneBasicTrip () {
        activityIndicatorr.startAnimating()
        UserRouter.getOneTrip(id: self.tripDetails?.id ?? 0 ).send { [weak self] (response : APIGenericResponse< OneBasicResult >)  in
            guard let self = self else { return }
              
            if let result = response.result {
                self.tripCountLabel.text =  "trips: ".localize + "\( result.completed_trips_count ?? 0)"
                
            }
           
          
        }
    }
    
}

//MARK: - Routes -
extension driverProfileVC {
    
}
