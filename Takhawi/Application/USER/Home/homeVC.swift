//
//  homeVCVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 23/09/2023.
//
//  Template by MGAbouarab®


import UIKit
import CoreLocation
import GoogleMaps

import AlertKit
import EMTNeumorphicView
import Lottie
import SocketIO



class homeVC: BaseVC, sendDataBackDelegate{
  
    
    
//MARK: - IBOutlets -
    
    
    @IBOutlet weak var sideMenuAvatar: UIImageView!
    @IBOutlet weak var startingCityText: UITextField!
    @IBOutlet weak var cityContainerView: UIView!
    @IBOutlet weak var sideMenuEmail: UILabel!
    @IBOutlet weak var sideMenuUserName: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var destTextfield: UITextField!
    @IBOutlet weak var CContainerSegment: UIView!
    @IBOutlet weak var secCalendar: UIButton!
    @IBOutlet weak var secMydestinationOutlet: UIButton!
    @IBOutlet weak var secMyLocationOutlet: UIButton!
    @IBOutlet weak var frchooseDestinationViewHeight: NSLayoutConstraint!
    @IBOutlet weak var joinatripButtonHeight: NSLayoutConstraint!
    @IBOutlet weak var secMakeAtripStack: UIStackView!
    @IBOutlet weak var visualView: UIVisualEffectView!
    @IBOutlet weak var sideMenuContainer: UIView!
    @IBOutlet weak var hotelIconOutlet: UIButton!
    @IBOutlet weak var joinTripDestButton: UIButton!
    @IBOutlet weak var containetStackView: UIStackView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var chooseFeatureCollection: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var userimageOutlet: UIImageView!
    @IBOutlet weak var menuOutlet: UIButton!
    @IBOutlet weak var googleMaps: GMSMapView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var segmentContainerView: EMTNeumorphicView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var calendarOutlet: UIButton!
    
    
    @IBOutlet weak var joinTripOutlet: UIButton!
   
    @IBOutlet weak var sideMenuWidth: NSLayoutConstraint!
    
    
    enum DispkayedTasks {
        case jointrip
        case maketrip
    }
    var displayedTask = DispkayedTasks.jointrip
    var destLat : Double = 0.0
    var destLong : Double = 0.0 
    var selectedDate : Date = Date()
    var selectedCityId : Int = 0
    var lottieAnimationView: LottieAnimationView!
    var currentUserLocation: CLLocationCoordinate2D?
   
    
    
//MARK: - Properties -
    
//    WIFI
//      MUSIC
//      FOOD
//      NO SMOKING
//      AIR CONDITIONER
//      DRINKS
//      PET
//      CHARGING
//      REAR SCREEN
//      MASSAGE SEAT
//      AVAILABILE TRAVEL BAG
//      HEATING
    
    
   
  
//
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
        dummyActivity(icon: "heat", name: "HEATING"  , id: 10 ) ,
        dummyActivity(icon: "Group 1000003071", name: "AVAILABILE TRAVEL BAG"  , id: 11 )
        
    ]
    var selectedFeatures : [String] = []
    
    let locationManager = CLLocationManager()
    let screen = UIScreen.main.bounds
    var menu = false
    var home = CGAffineTransform()
    var sideMenuItems  = [
            sideMenuDataModel(name: "Switch to Driver".localize, icon: "side2") ,
            sideMenuDataModel(name: "Personal Info".localize, icon: "side1") ,
            sideMenuDataModel(name: "Notification".localize, icon: "side3")  ,
            sideMenuDataModel(name: "Messages".localize, icon: "side4") ,
            sideMenuDataModel(name: "Favorite".localize, icon: "side5") ,
            sideMenuDataModel(name: "Wallet".localize, icon: "side6") ,
            sideMenuDataModel(name: "Trips".localize, icon: "side7") ,
            sideMenuDataModel(name: "Settings".localize, icon: "side8")
        ]
    
    
    var tripHaveDestination : Bool = false
    
  

    
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.searchView.addTapGesture {
            if self.segment.selectedSegmentIndex == 0 {
                self.getDestinationFromMaps(vip: false )
            }
            
           
        }
        NotificationCenter.default.addObserver(self, selector: #selector(handleCustomNotification(_:)), name: .updateHomeProfile, object: nil)
       
        self.configureInitialDesign()
        self.setUpGoogleMapView()
        self.setTodayDateINformate()
        self.initialSideMenu()
        self.getProfileDetails(withLoading: true )
        if let firstWord = UserDefaults.user?.user?.name?.split(separator: " ").first {
            print(firstWord)
            self.userName.text = String(firstWord)
        } else {
            self.userName.text = UserDefaults.user?.user?.name ?? "User"
            print("No words found") // Output: No words found
        }
        
        home = self.containerView.transform
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "sideMenuCell", bundle: nil), forCellReuseIdentifier: "sideMenuCell")
        self.hotelIconOutlet.isHidden = false 
        self.secCalendar.imagePadding(spacing: 8)
        self.secMyLocationOutlet.imagePadding(spacing: 8)
        self.secMydestinationOutlet.imagePadding(spacing: 8)
        self.secCalendar.setTitle( "\(Date().dateToString ?? "--") , 3:00 PM " , for: .normal)
        self.segmentContainerView.neumorphicLayer?.cornerType = .all
        self.segmentContainerView.neumorphicLayer?.depthType = .concave
        self.segmentContainerView.neumorphicLayer?.lightShadowOpacity = 0.4
        self.segmentContainerView.neumorphicLayer?.shadowColor = UIColor(named: "seg")?.cgColor
        //self.segmentContainerView.neumorphicLayer?.elementColor = UIColor.white.cgColor
        self.segmentContainerView.neumorphicLayer?.elementDepth = 4
        self.segmentContainerView.neumorphicLayer?.backgroundColor = UIColor.white.cgColor
        self.segment.backgroundColor = UIColor.clear
        self.CContainerSegment.layer.applySketchShadow(color: .black)
        destTextfield.placeholder = "Choose your destination".localize
        self.menuOutlet.setImage( UIImage(named: "menu 1")?.imageFlippedForRightToLeftLayoutDirection(), for: .normal)
      
        
    }
    
    
//MARK: - Design Methods -
  
    
    
    
    private func configureInitialDesign() {
        self.title = "".localized
        self.bottomView.layer.applySketchShadow()
        self.searchView.layer.applySketchShadow()
        self.cityContainerView.layer.applySketchShadow()
        self.userimageOutlet.layer.applySketchShadow(color: .black)
        self.menuOutlet.layer.applySketchShadow()
        self.requestLocationAccess()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        self.initialSegment()
        self.sideMenuContainer.layer.addBasicShadow(cornerRadius: 25 )
        chooseFeatureCollection.delegate = self
        chooseFeatureCollection.dataSource = self
        self.chooseFeatureCollection.register(cellType: chooseFeatureCell.self)
        self.chooseFeatureCollection.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        calendarOutlet.imagePadding(spacing: 8)
        joinTripDestButton.imagePadding(spacing: 8)
        self.cityContainerView.addTapGesture {
            let vc = chooseCityVC()
            vc.action = { cityModel in
                self.startingCityText.text = cityModel.name ?? ""
                self.selectedCityId = cityModel.id ?? 0
            }
            self.present(vc, animated: true )
        }
       
        // force hotel button to be on the left acoording to client requirement 
        if LocalizationManager.shared.getLanguage() == .Arabic  {
            hotelIconOutlet.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        } else {
            hotelIconOutlet.centerXAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        }
    

  
    }
    
    
    
    
    
//MARK: - Logic Methods -
 
 
    
//MARK: - Actions -
    
    @IBAction func secMyLoactionAction(_ sender: UIButton) {
      print("current location action")
        
    }
    

    
    @IBAction func secMyDestinationAction(_ sender: UIButton) {
      
        self.getDestinationFromMaps(vip: true )
        
    }
    
    
    
    @IBAction func secCalendarAction(_ sender: UIButton) {
  
        let vc = selectDateVC()
        vc.comeFromMakeAtrip =  true
        self.presentWithEffect(vc:  vc )
        vc.makeAtripCalendar = {  [weak self] (value , date ) in
            self?.secCalendar.setTitle( value , for: .normal)
            self?.selectedDate = date
            self?.removePresentEffect()
        }
        vc.dismissAction = {
            self.removePresentEffect()
        }
        
       
    }
    
    @IBAction func sideMenuAction(_ sender: UIButton) {
        menu  == false ? self.showMenu() : self.hideMenu()
       
    }
    
    
    @IBAction func hotelsAction(_ sender: UIButton) {
        // first : check my role if user or driver
            let vc = hotelsVC()
            self.push(vc)
     
    }
    
    
    @IBAction func joinAction(_ sender: UIButton) {
        if segment.selectedSegmentIndex == 0 {
            //check if i have a destination to go  then  move to trip list :D
            if tripHaveDestination && self.selectedCityId != 0  {
                print("selectedCityId : \(self.selectedCityId)")
                print("destination : \(self.destLat ) , \(self.destLong)")
                print("date : \(self.selectedDate.ISO8601Format())")
                
                let vc = tripListVC()
                vc.tripLat = self.destLat
                vc.tripLong = self.destLong
                vc.tripDate = self.selectedDate.ISO8601Format()
                vc.cityId = self.selectedCityId
                self.push(vc)
                
            } else {
                AlertKitAPI.present(
                    title: "complete your data first!".localize ,
                    icon: .error,
                    style: .iOS17AppleMusic,
                    haptic: .success
                )
            }
            
        } else {
           // check if the user select an destination or not then move to make a trip popup :)
            if self.secMydestinationOutlet.titleLabel?.text == "Destination!".localized {
                showInfoTopAlert(withMessage:  "you should select a destination first!.".localize )
            } else {
                print(self.selectedFeatures)
                
                self.continueToVipTripCycle()
   
            }
        }
    }
    
    
    
    @IBAction func joinatripsegmentbutton(_ sender: UIButton) {
        let vc = homeSearchVC ()
        vc.currentLat = locationManager.location?.coordinate.latitude ?? 0.0
        vc.currentong = locationManager.location?.coordinate.longitude ?? 0.0
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .overCurrentContext
        vc.selectAndDismiss = { string , lat , long  in
            self.destLat = lat
            self.destLong = long
            self.joinTripDestButton.setTitle( string , for: .normal)
            
        }
        let pushVc = mapSearchVC()
        pushVc.delegate = self
        present( vc , animated: true )
        vc.onCommit  = {  [weak self] in
            self?.push(pushVc)
        }
            
      //  pushVc.delegate = self
        
       // self.push(pushVc)
    }
    
    
    
    
    
    
    @IBAction func calendarAction(_ sender: UIButton) {
      
        let vc = selectDateVC()
        vc.comeFromMakeAtrip = segment.selectedSegmentIndex == 0 ? false : true
        self.presentWithEffect(vc:  vc )
        vc.change = {  [weak self] (value , date ) in
            self?.calendarOutlet.setTitle( value , for: .normal)
            self?.selectedDate = date.tomorrow
            print(value)
            self?.removePresentEffect()
            print("hello i select join a trip date btw ")
        }
        vc.dismissAction = {
            self.removePresentEffect()
        }
        

        
        
    }
    
    
  
    @IBAction func hideSidemenuButton(_ sender: UIButton) {
        print("clicked ")
        self.hideMenu()
    }
    
    
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print("hey iam 0 ")
            self.displayedTask = .jointrip
            self.segmentOneAction()
        }  else {
            print("heey iam 1 ")
            self.displayedTask = .maketrip
            self.segmentTwoAction()
        }
    }
    
    
    
}


//MARK: - Networking -
extension homeVC {
    
    func createVipTrip () {
        activityIndicatorr.startAnimating()
        let currentLat = self.locationManager.location?.coordinate.latitude ?? 0.0
        let currentLng = self.locationManager.location?.coordinate.longitude ?? 0.0
        UserRouter.createVipTrip(destinationLong: self.destLong, destinationLat: self.destLat, currentLat: currentLat , currentLong: currentLng , features: self.selectedFeatures , date: self.selectedDate.ISO8601Format(), pickup_description: self.secMyLocationOutlet.titleLabel?.text ?? "", destination_description: self.secMydestinationOutlet.titleLabel?.text ?? "").send { [weak self] (response: APIGenericResponse<vipData>) in
            guard let self = self else { return }
            if response.status == true {
                
                let vc1 = findingAdriverVC()
                vc1.modalTransitionStyle = .coverVertical
                vc1.modalPresentationStyle = .overCurrentContext
                vc1.tripId = response.result?.vIP_Trip?.trip_id ?? 0
                self.bottomView.isHidden = true
                self.CContainerSegment.isHidden = true
                
                self.hotelIconOutlet.isHidden = true
                self.present(vc1 , animated: true)
                vc1.cancel = {
                    self.hotelIconOutlet.isHidden = false
                    self.bottomView.isHidden = false
                    self.CContainerSegment.isHidden = false
                }
                vc1.didfindAdrivier = { offers in
                    self.hotelIconOutlet.isHidden = false
                    let vc = driverOffersVC()
                    vc.tripId = response.result?.vIP_Trip?.trip_id ?? 0
                    vc.offers = offers
                    vc.locationDetails = offerLocation(CurrentLat: currentLat  , currentLng: currentLng, desLat: self.destLat, destLng: self.destLong, currentAddress: self.secMyLocationOutlet.titleLabel?.text ?? ""  , destAddress: self.secMydestinationOutlet.titleLabel?.text ?? ""  )
                    self.bottomView.isHidden = false
                    self.CContainerSegment.isHidden = false
                    self.push(vc)
                }
            }
        }
    }
    
}




extension UIStackView {
    
    func removeFully(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
    func removeFullyAllArrangedSubviews() {
        arrangedSubviews.forEach { (view) in
            removeFully(view: view)
        }
    }
    
}
