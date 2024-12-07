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
    
    @IBOutlet weak var paymentMethodContainer: UIView!
    @IBOutlet weak var paymentMethod: UILabel!
    @IBOutlet weak var shareStack: UIStackView!
    @IBOutlet weak var titleName: UILabel!
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
    
    @IBOutlet weak var offerPrice: UITextField!
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
    var driverBasic : Bool = false
    var basicPassenger : Passengers?
    var tripDetails : BasicTripResult?
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    var driverBasicDetails : MainTripResult?
    var driverVip : SocketVIP_Trip?
    var pickupLat : Double = 0.0
    var pickupLong : Double = 0.0
    var destLat : Double = 0.0
    var destLong : Double = 0.0
    var comeFromBasicTrip : Bool = false
    var comeFromSharedUrl : Bool = false
  
   
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        weatherManager.delegate = self
        self.weatherIndicator.startAnimating()

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
        if comeFromBasicTrip {
            self.from.text = self.tripDetails?.startLocation ?? "--"
            self.to.text = self.tripDetails?.destinationlocationname ?? "--"
            self.seatPrice.text = "\(self.tripDetails?.basic_trip_price_per_seat ?? 0 )"
            self.getOneBasicTrip()
        } else if comeFromSharedUrl {
            print(" == = == = = = =come from shared url === == == = = ===")
        }
        
        if isDriverAcc {
            self.mainStack.removeArrangedSubview(self.BottomcontainerStack)
            self.BottomcontainerStack.removeFromSuperview()
            self.from.text = self.driverVip?.pickup_description ?? "--"
            self.to.text = self.driverVip?.destination_description ?? "--"
            self.tripDate.text = self.driverVip?.start_date?.convertFromIso() ?? ""
            self.driverRate.rating = self.driverVip?.passenger_rate ?? 0
            self.driverName.text = self.driverVip?.passenger_name ?? ""
    // missed the count of driver trips from back end
            self.tripCountLabel.text = "trips: ".localize +  "0"
            self.titleName.text = "User Profile".localize
            if let image = self.driverVip?.passenger_avatar {
                self.driverImage.setImage(image: Server.imageBase.rawValue + image)
            }
        } else if driverBasic {
            self.paymentMethodContainer.isHidden = false
            self.paymentMethodContainer.layer.addBasicShadow(cornerRadius: 20)
            self.paymentMethod.text = "Payment Method: ".localize + "\(self.basicPassenger?.payment_method ?? "--")"
            self.from.text = self.driverBasicDetails?.pickup_location?.description ?? ""
            self.to.text = self.driverBasicDetails?.destination?.description ?? ""
            self.tripDate.text = self.driverBasicDetails?.start_date?.convertFromIso()
            self.mainStack.removeArrangedSubview(self.BottomcontainerStack)
            self.BottomcontainerStack.removeFromSuperview()
            self.driverRate.rating = self.basicPassenger?.passnger?.passenger_rate ?? 0
            self.titleName.text = "User Profile".localize
            self.driverContainerView.removeFromSuperview()
            self.sendOfferContainerView.removeFromSuperview()
            
            self.driverName.text = self.basicPassenger?.passnger?.name ?? ""
            if let image = self.basicPassenger?.passnger?.avatar  {
                self.driverImage.setImage(image: Server.imageBase.rawValue + image)
            }
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
    
    
    
    @IBAction func shareTrip(_ sender: UIButton) {
//
//        let urlString = "takhawe"
//       shareLink(from: self, urlString: urlString)
    }
    
    
    
    
    
    @IBAction func reserveYourSeatAction(_ sender: UIButton) {
        let vc = ReserveTheTripVC()
        vc.viptrip = false
        vc.tripDetails = self.tripDetails
        self.push(vc)
        
    }
    
    @IBAction func driverSendOffer(_ sender: UIButton) {
        if isDriverAcc {
            self.sendOffer()
        }
    }
    
    
    @IBAction func fullGoogleView(_ sender: UIButton) {
        let vc = fullScreenGoogleViewVC()
        if isDriverAcc {
            vc.destLat = driverVip?.distination_location_lat ?? 0
            vc.destLng = driverVip?.distination_location_lng ?? 0
            vc.picklng = driverVip?.pickup_location_lng ?? 0
            vc.Picklat = driverVip?.pickup_location_lat ?? 0
        } else if self.driverBasic {
            vc.destLat = self.driverBasicDetails?.destination?.lat ?? 0
            vc.destLng = self.driverBasicDetails?.destination?.lng ?? 0
            vc.picklng = self.driverBasicDetails?.pickup_location?.lng ?? 0
            vc.Picklat = self.driverBasicDetails?.pickup_location?.lat ?? 0
        } else {
            vc.destLat = tripDetails?.destinationlocation?.lat ?? 0
            vc.destLng = tripDetails?.destinationlocation?.lng ?? 0
            vc.picklng = tripDetails?.pickuplocation?.lng ?? 0
            vc.Picklat = tripDetails?.pickuplocation?.lat ?? 0
        }
       
        vc.modalPresentationStyle = .fullScreen
        self.present(vc , animated: true )
    }
    
    
    
    @IBAction func reviewsAction(_ sender: UIButton) {
  
            self.push(reviewsViewVC())

    }
    
    
    
    
}


//MARK: - Networking -
extension driverProfileVC {
    
    func getOneBasicTrip () {
        
        activityIndicatorr.startAnimating()
        UserRouter.getOneTrip(id: self.tripDetails?.id ?? 0 ).send { [weak self] (response : APIGenericResponse< AdditionalOneBasicResult >)  in
            guard let self = self else { return }
              
            if let result = response.result {
                self.tripCountLabel.text =  "trips: ".localize + "\(result.completed_trips_count ?? 0)"
                self.driverImage.setImage(image: Server.imageBase.rawValue + (result.driver?.avatar ?? "" ) )
                
            }
        }
    }
    
    func sendOffer () {
        if self.offerPrice.text == "" {
            showPopTopAlert(title: "Error", withMessage: "please add price first!", success: false)
        } else {
            activityIndicatorr.startAnimating()
            let price = Int(self.offerPrice.text ?? "0") ?? 0
            DriverRouter.makeOffer(id: self.driverVip?.trip_id ?? 0 , price: price   , features: []).send { [weak self ] ( response : APIGlobalResponse)  in
                guard let self = self else { return }
                if response.status == true {
                    showInfoTopAlert(withMessage: response.message )
                    self.pop(animated: true )
                }
            }
        }
    }
    
}

//MARK: - Routes -
extension driverProfileVC {
    
}
