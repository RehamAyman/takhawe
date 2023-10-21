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
import EasyTipView



class homeVC: BaseVC{
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var tapView: UIView!
    @IBOutlet weak var containerView: UIView!
    
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
    var preferences = EasyTipView.Preferences()
    var tipView = EasyTipView(text: "")
   // Notification Messages
//MARK: - Properties -
    
    
    
    
    let locationManager = CLLocationManager()
    let screen = UIScreen.main.bounds
    var menu = false
    var home = CGAffineTransform()
    var sideMenuItems  =  publicSideMenu.items
    
//MARK: - Creation -
  
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.setUpGoogleMapView()
        self.setTodayDateINformate()
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
        self.joinTripOutlet.backgroundColor = UIColor.lightGray
        self.tipViewIntegration()
    }
    
    
    
    
    
//MARK: - Logic Methods -
 
    
//MARK: - Actions -
    @IBAction func sideMenuAction(_ sender: UIButton) {
        menu  == false ? self.showMenu() : self.hideMenu()
       
    }
    
    @IBAction func searchAction(_ sender: UIButton) {
        
        // present search view
        if segment.selectedSegmentIndex == 0 {
            let vc = homeSearchVC ()
            
            vc.modalTransitionStyle = .coverVertical
            vc.modalPresentationStyle = .overCurrentContext
            
            present(vc , animated: true )
            vc.onCommit  = {  [weak self] in
                let pushVc = mapSearchVC()
                self?.push(pushVc)
            }
        }
    }
    
    
    @IBAction func calendarAction(_ sender: UIButton) {

        
        
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
