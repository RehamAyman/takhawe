//
//  DriverHomeVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 10/02/2024.
//

import UIKit
import CoreLocation
import GoogleMaps

class DriverHomeVC: BaseVC  {
    
    
//MARK: - VARS
    let locationManager = CLLocationManager()
    var switchButton = SwitchButton()
    
//MARK: - OUTLETS
    
    @IBOutlet weak var createAtrip: UIImageView!
    
    @IBOutlet weak var switchContainer: UIView!
    
    
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var buttomContainerView: UIView!
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var googleMaps: GMSMapView!
    @IBOutlet weak var driverImage: UIImageView!
    
    
    
//MARK: - MAIN VIEW CYCYLE
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

    
        self.requestLocationAccess()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        self.notificationView.layer.addBasicShadow(cornerRadius: 16)
        self.buttomContainerView.layer.addBasicShadow(cornerRadius: 20)
        self.setUpGoogleMapView()
       
        switchButton = SwitchButton(frame: self.switchContainer.frame)
        switchButton.status = false
        self.view.addSubview(switchButton)
        
        
        switchButton.translatesAutoresizingMaskIntoConstraints = false

        switchButton.leadingAnchor.constraint(equalTo: self.switchContainer.leadingAnchor).isActive = true
        switchButton.trailingAnchor.constraint(equalTo: self.switchContainer.trailingAnchor).isActive = true
        switchButton.topAnchor.constraint(equalTo: self.switchContainer.topAnchor).isActive = true
        switchButton.bottomAnchor.constraint(equalTo: self.switchContainer.bottomAnchor).isActive = true
      
        self.driverName.text = UserDefaults.user?.user?.name ?? ""
        
        self.switchButtonAction()
        self.createAtripAction()
        
  
    }
    
    
    
//MARK: - ACTIONS
    
    @IBAction func showDetails(_ sender: UIButton) {
        let vc = driverProfileVC()
        vc.isDriverAcc = true
        self.push(vc )
    }
    
//MARK: - FUNCTIONS
    private func checkDriverStatus () {
        
    }


}
