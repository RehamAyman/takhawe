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



class homeVC: BaseVC, sendDataBackDelegate{
  
    
    
//MARK: - IBOutlets -
    
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
//    @IBOutlet weak var tapView: UIView!
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
    
    
//MARK: - Properties -
    
    var dummyActivty : [dummyActivity] = [
        dummyActivity(icon: "Food", name: "Basketball") ,
        dummyActivity(icon: "smoke", name: "Riding Horse") ,
        dummyActivity(icon: "Vector 3", name: "Drawing") ,
        dummyActivity(icon: "music 1", name: "Listen to music") ,
        dummyActivity(icon: "AC", name: "Travelling")
    ]
    
    
    let locationManager = CLLocationManager()
    let screen = UIScreen.main.bounds
    var menu = false
    var home = CGAffineTransform()
    var sideMenuItems  =  publicSideMenu.items
    var tripHaveDestination : Bool = false 
    
//MARK: - Creation -
  
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.setUpGoogleMapView()
        self.setTodayDateINformate()
        self.initialSideMenu()
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
        

    }
    
    
//MARK: - Design Methods -
  
    
    
    
    private func configureInitialDesign() {
        self.title = "".localized
        self.bottomView.layer.applySketchShadow()
        self.searchView.layer.applySketchShadow()
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
        
    

  
    }
    
    
    
    
    
//MARK: - Logic Methods -
 
    
//MARK: - Actions -
    
    @IBAction func secMyLoactionAction(_ sender: UIButton) {
    }
    
    @IBAction func secMyDestinationAction(_ sender: UIButton) {
   
        
        
    }
    @IBAction func secCalendarAction(_ sender: UIButton) {
        let vc = selectDateVC()
        vc.comeFromMakeAtrip =  true
        self.presentWithEffect(vc:  vc )
        vc.makeAtripCalendar = {  [weak self] (value) in
            self?.secCalendar.setTitle( value , for: .normal)
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
        sender.animateButtonWhenPressed {
            let vc = hotelsVC()
            self.push(vc)
        }
    }
    
    
    @IBAction func joinAction(_ sender: UIButton) {
        if segment.selectedSegmentIndex == 0 {
            //check if i have a destination to go  then  move to trip list :D
            if tripHaveDestination {
                let vc = tripListVC()
                self.push(vc)
            } else {
                AlertKitAPI.present(
                    title: "Sorry, but you need to select a destination first!" ,
                    icon: .error,
                    style: .iOS17AppleMusic,
                    haptic: .success
                )
            }
            
        } else {
           // check if the user select an destination or not then move to make a trip popup :)
            
            
            
            let vc = makeAtripAlertPopUpVC()
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            vc.action = {
                let vc1 = findingAdriverVC()
                vc1.modalTransitionStyle = .coverVertical
                vc1.modalPresentationStyle = .overCurrentContext
                self.bottomView.isHidden = true
                self.CContainerSegment.isHidden = true
                
                self.hotelIconOutlet.isHidden = true
                self.present(vc1 , animated: true)
                vc1.cancel = {
                    self.hotelIconOutlet.isHidden = false
                    self.bottomView.isHidden = false
                    self.CContainerSegment.isHidden = false
                }
                vc1.didfindAdrivier = {
                    self.hotelIconOutlet.isHidden = false
                    let vc = driverOffersVC()
                    self.bottomView.isHidden = false
                    self.CContainerSegment.isHidden = false
                    self.push(vc)
                }
            }
            
            
            self.present(vc , animated: true)
            
        }
    }
    
    
    
    @IBAction func joinatripsegmentbutton(_ sender: UIButton) {
        let vc = homeSearchVC ()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .overCurrentContext
        vc.selectAndDismiss = { string in
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
    
    @IBAction func searchAction(_ sender: UIButton) {
        
        // present search view
        if segment.selectedSegmentIndex == 0 {
            let vc = homeSearchVC ()
            
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .overCurrentContext
            let pushVc = mapSearchVC()
            pushVc.delegate = self
            vc.selectAndDismiss = { string in
                self.tripHaveDestination = true
                self.joinTripDestButton.isHidden = false
                self.searchView.isHidden = true
                self.joinTripDestButton.setTitle( string , for: .normal)
              
                
                self.joinatripButtonHeight.constant = 40
                
                self.frchooseDestinationViewHeight.constant = 0
                
              
            }
            
            
            
            present(vc , animated: true )
            vc.onCommit  = {  [weak self] in
               
                self?.push(pushVc)
            }
        }
    }
    
    
    @IBAction func calendarAction(_ sender: UIButton) {
        
        let vc = selectDateVC()
        vc.comeFromMakeAtrip = segment.selectedSegmentIndex == 0 ? false : true
        self.presentWithEffect(vc:  vc )
        vc.change = {  [weak self] (value) in
            self?.calendarOutlet.setTitle( value , for: .normal)
            self?.removePresentEffect()
        }
        vc.dismissAction = {
            self.removePresentEffect()
        }
        

        
        
    }
    
    
  
    @IBAction func hideSidemenuButton(_ sender: UIButton) {
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
    
}

//MARK: - Routes -
extension homeVC {
    
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
