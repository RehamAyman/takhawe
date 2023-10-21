//
//  GoogleMapViewController.swift
//  Basement
//
//  Created by Ahmed Rmadan on 08/10/2023.
//

import UIKit
import GoogleMaps

protocol AddressDelegate {
    func handelLocation(lat: Double, long: Double, address: String)
}

class GoogleMapViewController: BaseVC {
    
    //MARK: - IBOutLets -
    @IBOutlet weak var mapView: GMSMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var subViewContainer: UIView!
    
    @IBOutlet weak var saveChangesButton: UIButton!
    
    
    //MARK: - Creation -
    static func create() -> GoogleMapViewController {
        let vc = GoogleMapViewController()
        return vc
    }
    
    
    
    //MARK: - Properties -
    var updateAddress:Bool = false
    var delegate:AddressDelegate?
    private var selectedLatitude:Double?
    private var selectedLongtitude:Double?
    private var marker = GMSMarker()
   // private var locator: Locator?
    private var myLoaction = false
    
    
    
    //MARK: - LifeCycle  -
    override func viewDidLoad() {
        super.viewDidLoad()
        handelInitialState()
        setUpDesign()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        tabBarController?.tabBar.isHidden = true
    }
    //MARK: - SetUp -
    private func setUpDesign(){
        self.subViewContainer.layer.cornerRadius = 10
        self.saveChangesButton.layer.cornerRadius = 10
       // self.addBackButtonWith(title: "Location".localized)
        
        
    }
    
    
    //MARK: - logic methods -
    private func handelInitialState() {
   //     self.locator = Locator(delegate: self)
        mapView.delegate = self
        mapView.isMyLocationEnabled = true
        mapView.settings.compassButton = true
        mapView.settings.myLocationButton = true
        self.mapView.padding = UIEdgeInsets(top: 0, left: 0, bottom: 140, right: 0)
    }
    
    
    private func animateMapTo(location: CLLocationCoordinate2D ) {
        CATransaction.begin()
        CATransaction.setValue(0.5, forKey: kCATransactionAnimationDuration)
        self.mapView.animate(with: GMSCameraUpdate.setTarget(location))
        self.marker.position = location
        CATransaction.commit()
    }
    
    
    private func reverseGeo(coordinate:CLLocationCoordinate2D) {
        let geoCoder = GMSGeocoder()
        geoCoder.reverseGeocodeCoordinate(coordinate) { response, error in
            if let places = response?.results(), let place = places.first {
                self.addressLabel.text = "\(place.subLocality ?? "" + (place.thoroughfare ?? ""))"
                self.selectedLatitude = coordinate.latitude
                self.selectedLongtitude = coordinate.longitude
                self.marker.map = self.mapView
                self.animateMapTo(location: coordinate)
            } else {
                print(error?.localizedDescription ?? "error")
            }
            
        }
    }
    
    
    
    @IBAction func saveChangesButton(_ sender: UIButton) {
        guard let lat = self.selectedLatitude, let long = self.selectedLongtitude, let address = self.addressLabel.text else {
           // self.showErrorAlert(error: "Please select the address".localized)
            return
        }
//        self.pop { [weak self] in
//            guard let self = self else {return}
//            print(self.updateAddress)
//            self.delegate?.handelLocation(lat: lat, long: long, address: address)
//        }
    }
    
    

}


//MARK: - Extensions -
extension GoogleMapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        self.reverseGeo(coordinate: coordinate)
    }
}


extension GoogleMapViewController {
    
    func updateUserLocation(lat: Double, long: Double) {
        self.reverseGeo(coordinate: CLLocationCoordinate2D(latitude: lat, longitude: long))
        self.mapView.camera = GMSCameraPosition(latitude: lat, longitude: long, zoom: 18)
        //self.locator = nil
    }

    func showLocationAlert(message: String) {
        print(message)
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        guard let coordinate = mapView.myLocation?.coordinate else { return false}
        mapView.camera = GMSCameraPosition(latitude:  coordinate.latitude, longitude: coordinate.longitude, zoom: 18)
        myLoaction = true
        return true
    }
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        if myLoaction {
            reverseGeo(coordinate: CLLocationCoordinate2D(latitude: position.target.latitude, longitude: position.target.longitude))
           
            myLoaction = false
        }
    }
}
