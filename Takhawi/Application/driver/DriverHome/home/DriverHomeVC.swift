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
    let socketManager = MySocketManager()
    
//MARK: - OUTLETS
    
    @IBOutlet weak var createAtrip: UIImageView!
    
    @IBOutlet weak var switchContainer: UIView!
    
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var driverName: UILabel!

    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var googleMaps: GMSMapView!
    @IBOutlet weak var driverImage: UIImageView!
    
    
    
//MARK: - MAIN VIEW CYCYLE
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpVipListenerSocket()
        self.setupMainView()
        
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
