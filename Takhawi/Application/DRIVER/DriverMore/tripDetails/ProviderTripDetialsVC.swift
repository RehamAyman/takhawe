//
//  ProviderTripDetialsVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 29/03/1446 AH.
//
//  Template by MGAbouarab®


import UIKit
import GoogleMaps

class ProviderTripDetialsVC: BaseVC {
    
//MARK: - IBOutlets -
    
    @IBOutlet weak var googleMapsView: GMSMapView!
    
//MARK: - Properties -
    var tripType : tripType = .basic
    let locationManager = CLLocationManager()
    var passedTrip : MainTripResult?
    

// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.setUpGoogleMapView()
        self.getTripDetails()
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
    }
    
//MARK: - Logic Methods -
    
    
//MARK: - Actions -
    
}


//MARK: - Networking -
extension ProviderTripDetialsVC {
    
    func getTripDetails () {
        switch self.tripType {
        case .basic:
            self.getBasicTripDetails()
        case.vip:
            self.getVipTripDetails()
        }
    }
    
    
    
    func getBasicTripDetails () {
        
    }
    
    func getVipTripDetails () {
        
    }
    
}

//MARK: - Routes -
extension ProviderTripDetialsVC {
    
}
