//
//  driverHome+googleExtention].swift
//  Takhawi
//
//  Created by Reham Ayman on 10/02/2024.
//

import UIKit
import GoogleMaps



extension DriverHomeVC :  CLLocationManagerDelegate  , GMSMapViewDelegate  {
    
    //MARK: - GOOGLE MAPS METHODS
     func setUpGoogleMapView () {
            locationManager.requestLocation()
            locationManager.startUpdatingLocation()
            googleMaps.delegate = self
            googleMaps.isMyLocationEnabled = false 
            
            do {
                        // Set the map style by passing the URL of the local file.
                        if let styleURL = Bundle.main.url(forResource: "googleMapsStyle", withExtension: "json") {
                            googleMaps.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)

                        } else {
                            NSLog("Unable to find style.json")
                        }
                    } catch {
                        NSLog("One or more of the map styles failed to load. \(error)")
                    }
        }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("listen")
       
        centerMapOnLocation(location: locationManager.location!)
        self.locationManager.stopUpdatingLocation()
        let lat = "\(locationManager.location?.coordinate.latitude ?? 0.0)"
        let long = "\(locationManager.location?.coordinate.longitude ?? 0.0 )"
        guard let latitude = locationManager.location?.coordinate.latitude else { return}
        guard let longitude =  locationManager.location?.coordinate.longitude else { return}
        getAddress(lat: latitude , Lng: longitude)
        // pass to the socket my location
        
        socketManager.sendMyLocation(lat: latitude , lng: longitude)
      
    }
    
    
   
    
    
    func getAddress(lat: Double , Lng: Double){
        
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(CLLocationCoordinate2D(latitude: lat, longitude: Lng )) { response, error in
          //
        if error != nil {
                        print("reverse geodcode fail: \(error!.localizedDescription)")
                    } else {
                        if let places = response?.results() {
                            if let place = places.first {


                                if let lines = place.lines {
                                    print("GEOCODE: Formatted Address: \(lines)")
                             //    self.secMyLocationOutlet.setTitle(lines[0], for: .normal)
                                }

                            } else {
                                print("GEOCODE: nil first in places")
                            }
                        } else {
                            print("GEOCODE: nil in places")
                        }
                    }
        }
     
    }
    
    
    
    
    
    func centerMapOnLocation(location: CLLocation){
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 13.0)
      
        self.googleMaps.camera = camera
        self.googleMaps.animate(toZoom: 16)
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Alertt.showAlertOnVC(target: self, title: "Make sure GPS is open".localized, message: "")
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
   
    
}

