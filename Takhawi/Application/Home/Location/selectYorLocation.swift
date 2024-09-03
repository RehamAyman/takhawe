//
//  selectYorLocation.swift
//  Takhawi
//
//  Created by Reham Ayman on 27/09/2023.
//


import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation
import MapKit


protocol sendDataBackDelegate {
    func finishPassing(location: String , lat:Double , lng:Double)
}

class SelectLocationViewController: UIViewController ,CLLocationManagerDelegate,UIGestureRecognizerDelegate , GMSMapViewDelegate{
    @IBOutlet weak var confirmationBtn: UIButton!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var googleMap: GMSMapView!
    @IBOutlet var titleLable: UILabel!
    
   // let googleKey = defaults.string(forKey: "AIzaSyBrEyBXL7xP6XwzTnybqmYciGjjxsYF5xI")
    let locationManager = CLLocationManager()
    var matchingItems: [MKMapItem] = [MKMapItem]()
    var delegate: sendDataBackDelegate?
    let Storeannotation = ImageAnnotation()
    let userAnnotaion = ImageAnnotation()
    var lat:Double?
    var lng:Double?
    var marker = GMSMarker()
    var titleView = ""
    var isRecive = ""
    
  
    override func viewDidLoad() {
        requestLocationAccess()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        setMapview()
    }
    
    
    
    
    func setMapview() {
        locationManager.requestLocation()
        locationManager.startUpdatingLocation()
        googleMap.delegate = self
        self.locationLabel.isUserInteractionEnabled = true
        let imageView = UIImageView(image: #imageLiteral(resourceName: "locaa"))
        imageView.center = self.view.center
        self.googleMap?.addSubview(imageView)
        self.googleMap.settings.myLocationButton = true
        googleMap.isMyLocationEnabled = false 
      

        self.locationLabel.text = "Your Location".localized
        self.confirmationBtn.setTitle("Confirmation".localized, for: .normal)
        
        
    }
    
    
    
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    func makeButtonSelected(btn:UIButton){
        btn.backgroundColor = AppColors.shared.mainColor
        btn.setTitleColor(#colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1), for: .normal)
    }
    
    func makeButtonUnSelected(btn:UIButton){
        btn.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.968627451, blue: 0.968627451, alpha: 1)
        btn.setTitleColor( AppColors.shared.mainColor , for: .normal)
        
    }
    
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        
        self.lat = mapView.camera.target.latitude
        self.lng = mapView.camera.target.longitude
        let position = CLLocationCoordinate2DMake(self.lat!, self.lng!)
        marker.position = position
        print("geeetAdddress")
        getAddress(lat:self.lat! , Lng: self.lng!)
    }
    
    
    
    func getAddress(lat: Double , Lng: Double){
        
        
       
        getAddressFromLocation(lat: "\(lat)" , long: "\(Lng)") { address , error  in
            
            if error == nil {
                print("error == nil ")
            }
            
            self.locationLabel.text = address
            
            
        }
      
        }
   
    
    
    @IBAction func chooseLocationBtnPressed(_ sender: Any) {
        if self.locationLabel.text?.isEmpty == false  {
            if (self.locationLabel.text == "موقعك" || self.locationLabel.text == "Your Location") {
                Alertt.showAlertOnVC(target: self, title: "You must choose a Location".localized, message: "Mark the location on the map".localized)            }else{
                delegate?.finishPassing(location: locationLabel.text! , lat: self.lat! , lng: self.lng!)
                self.dismiss(animated: true)
                
                self.navigationController?.popViewController(animated: true)
            }
            
        }
        else{
            Alertt.showAlertOnVC(target: self, title: "You must choose a Location".localized, message: "Mark the location on the map".localized)
        }
    }
    
    func requestLocationAccess() {
        let status = CLLocationManager.authorizationStatus()
        
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            return
            
        case .denied, .restricted:
            print("location access denied")
            
        default:
            locationManager.requestWhenInUseAuthorization()
        }
    }
    let regionRadius: CLLocationDistance = 100
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("listen")
        centerMapOnLocation(location: locationManager.location!)
        self.locationManager.stopUpdatingLocation()
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
        Alertt.showAlertOnVC(target: self, title: "Make sure GPS is open".localized, message: "")
    }
    
    func centerMapOnLocation(location: CLLocation){
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 17.0)
        self.googleMap.camera = camera
        
    }
    
    
    
    
    
    func getCoordinateBounds(latitude:CLLocationDegrees ,
                             longitude:CLLocationDegrees,
                             distance:Double = 0.23)->GMSCoordinateBounds{
        let center = CLLocationCoordinate2D(latitude: latitude,
                                            longitude: longitude)
        let northEast = CLLocationCoordinate2D(latitude: latitude + distance, longitude: longitude + distance)
        let southWest = CLLocationCoordinate2D(latitude: latitude - distance, longitude: longitude - distance)
        
        
        return GMSCoordinateBounds(coordinate: northEast,
                                   coordinate: southWest)
        
    }
    
    
}


class ImageAnnotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var annotationImage: UIImage?
    var isClicked: Bool = false
    var viewTag: Int?
    
    override init() {
        self.coordinate = CLLocationCoordinate2D()
        self.title = nil
        self.annotationImage = nil
        self.viewTag = nil
    }
}
