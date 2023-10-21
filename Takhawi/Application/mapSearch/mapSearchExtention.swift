//
//  mapSearchExtention.swift
//  Takhawi
//
//  Created by Reham Ayman on 17/10/2023.
//

import Foundation
import GoogleMaps

extension mapSearchVC  : CLLocationManagerDelegate,UIGestureRecognizerDelegate , GMSMapViewDelegate {
    
    
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        
        
        print("call me here ......")
       
        self.lat = mapView.camera.target.latitude
        self.lng = mapView.camera.target.longitude
        let position = CLLocationCoordinate2DMake(self.lat, self.lng)
        marker.position = position
       
        print("geeetAdddress")
        getAddress(lat:self.lat  , Lng: self.lng)
        
        
        
       
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
                                    self.locationLabel.text = lines[0]
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
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("listen")
    
              //Finally stop updating location otherwise it will come again and again in this delegate

            centerMapOnLocation(location: locationManager.location!)
        
        
        
     //
      
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    
//        Alert.showAlertOnVC(target: self, title: "Make sure GPS is open".localized, message: "")
        
        print("Make sure GPS is open")
    }
    
    
    func centerMapOnLocation(location: CLLocation){
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 17.5)
        self.googleView.camera = camera
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.locationManager.stopUpdatingLocation()
        }
        
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
