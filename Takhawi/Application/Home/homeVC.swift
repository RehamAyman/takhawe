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



class homeVC: BaseVC, sendDataBackDelegate{
  
    
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var visualView: UIVisualEffectView!
    @IBOutlet weak var sideMenuContainer: UIView!
    @IBOutlet weak var hotelIconOutlet: UIButton!
    @IBOutlet weak var joinTripDestButton: UIButton!
    @IBOutlet weak var searchViewContainerHeight: NSLayoutConstraint!
    @IBOutlet weak var containetStackView: UIStackView!
    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var collectionContainerView: UIView!
    @IBOutlet weak var chooseFeatureCollection: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewHeight: NSLayoutConstraint!
    @IBOutlet weak var userimageOutlet: UIImageView!
    @IBOutlet weak var menuOutlet: UIButton!
    @IBOutlet weak var googleMaps: GMSMapView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var segmentContainerView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var UserLocationOutlet: UIButton!
    @IBOutlet weak var calendarOutlet: UIButton!
    @IBOutlet weak var locationOutlet: UIButton!
    
    
    @IBOutlet weak var joinTripOutlet: UIButton!
   
    @IBOutlet weak var sideMenuWidth: NSLayoutConstraint!
    
    
    
    
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
        //
        
        
        
        
      
       
       
        

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

        calendarOutlet.imagePadding(spacing: 5)
        locationOutlet.imagePadding(spacing: 5)
        UserLocationOutlet.imagePadding(spacing: 5)
        joinTripDestButton.imagePadding(spacing: 5)

  
    }
    
    
    
    
    
//MARK: - Logic Methods -
 
    
//MARK: - Actions -
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
                self.segmentContainerView.isHidden = true
                self.present(vc1 , animated: true)
                vc1.cancel = {
                    self.bottomView.isHidden = false
                    self.segmentContainerView.isHidden = false
                }
                vc1.didfindAdrivier = {
                    let vc = driverOffersVC()
                    self.bottomView.isHidden = false
                    self.segmentContainerView.isHidden = false
                    self.push(vc)
                }
            }
            
            
            self.present(vc , animated: true)
            
        }
    }
    
    
    
    @IBAction func joinatripsegmentbutton(_ sender: UIButton) {
        let pushVc = mapSearchVC()
        pushVc.delegate = self 
        self.push(pushVc)
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
                self.searchViewContainerHeight.constant = 0
                self.joinTripDestButton.setTitle( string , for: .normal)
                self.containetStackView.addArrangedSubview(   self.joinTripDestButton )
            }
            
            
            
            present(vc , animated: true )
            vc.onCommit  = {  [weak self] in
               
                self?.push(pushVc)
            }
        }
    }
    
    
    @IBAction func calendarAction(_ sender: UIButton) {
        
        let vc = selectDateVC()
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .overCurrentContext
        vc.comeFromMakeAtrip = segment.selectedSegmentIndex == 0 ? false : true
        present(vc , animated: true )
        vc.change = {  [weak self] (value) in
            
            self?.calendarOutlet.setTitle( value , for: .normal)
            
            
        }
        vc.action = {
            let vc = selectTimeVC()
              vc.modalTransitionStyle = .coverVertical
              vc.modalPresentationStyle = .overCurrentContext
              self.present( vc , animated: true )
        }
        

        
        
    }
    
    
    @IBAction func changeMyLoacation(_ sender: UIButton) {
        
    }
    @IBAction func chooseYourDestination(_ sender: UIButton) {
    }
    
    @IBAction func hideSidemenuButton(_ sender: UIButton) {
        self.hideMenu()
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print("hey iam 0 ")
            self.segmentOneAction()
        }  else {
            print("heey iam 1 ")
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
