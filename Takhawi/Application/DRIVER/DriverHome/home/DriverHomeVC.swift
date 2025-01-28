//
//  DriverHomeVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 10/02/2024.
//

import UIKit
import CoreLocation
import GoogleMaps



class DriverHomeVC: BaseVC, UIGestureRecognizerDelegate  {
    
    
//MARK: - VARS
    let locationManager = CLLocationManager()
    var switchButton = SwitchButton()
    let socketManager = MySocketManager()
    var offers : [SocketVIP_Trip] = []
    let reportMarker = GMSMarker()
    //MARK: - OUTLETS
    @IBOutlet weak var filterButton: UIImageView!
  
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
        self.getPrevTrips()
        self.filterButtonAction()
        
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
               longPressGesture.minimumPressDuration = 0.5 // Adjust the duration as needed
               longPressGesture.delegate = self
        googleMaps.addGestureRecognizer(longPressGesture)
        

    }
    

    
    
//MARK: - ACTIONS

    
//MARK: - FUNCTIONS
    private func checkDriverStatus () {
        
    }
       
    
    
}


struct DistanceMatrixResponse: Decodable {
    let rows: [Row]
    
    struct Row: Decodable {
        let elements: [Element]
        
        struct Element: Decodable {
            let distance: Distance
            let duration: Duration
            let status: String
            
            struct Distance: Decodable {
                let value: Int // Distance in meters
                let text: String // Human-readable distance (e.g., "10 km")
            }
            
            struct Duration: Decodable {
                let value: Int // Duration in seconds
                let text: String // Human-readable duration (e.g., "15 mins")
            }
        }
    }
}
