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
    
    
    
    @IBOutlet weak var buttomContainerView: UIView!
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var googleMaps: GMSMapView!
    @IBOutlet weak var driverImage: UIImageView!
    
    
    
//MARK: - MAIN VIEW CYCYLE
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        self.driverImage.layer.applySketchShadow(color: .black)
        self.requestLocationAccess()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        self.notificationView.layer.addBasicShadow(cornerRadius: 16)
        self.buttomContainerView.layer.addBasicShadow(cornerRadius: 20)
        self.setUpGoogleMapView()
        
        switchButton = SwitchButton(frame: CGRect(x: self.view.frame.width/1.6 , y: 58, width: 165, height: 75))
        switchButton.status = false
        self.view.addSubview(switchButton)
        self.switchButtonAction()
        
        
        
       
        
    }
    
    
    
//MARK: - ACTIONS
    
    @IBAction func showDetails(_ sender: UIButton) {
        let vc = driverProfileVC()
        vc.isDriverAcc = true
        self.push(vc )
    }
    
//MARK: - FUNCTIONS
    


}
