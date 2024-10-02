//
//  driverHome+googleExtention].swift
//  Takhawi
//
//  Created by Reham Ayman on 10/02/2024.
//

import UIKit
import GoogleMaps
import MapKit



extension DriverHomeVC :  CLLocationManagerDelegate  , GMSMapViewDelegate  {
    
    //MARK: - GOOGLE MAPS METHODS
     func setUpGoogleMapView () {
            locationManager.requestLocation()
            locationManager.startUpdatingLocation()
            googleMaps.delegate = self
        
            googleMaps.isMyLocationEnabled = true 
            
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
       // self.locationManager.stopUpdatingLocation()
//        let lat = "\(locationManager.location?.coordinate.latitude ?? 0.0)"
//        let long = "\(locationManager.location?.coordinate.longitude ?? 0.0 )"
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
   
    
//MARK: - GET ALL PREV. VIP TRIPS
   func getPrevTrips() {
       
      guard let latitude = locationManager.location?.coordinate.latitude else { return}
      guard let longitude =  locationManager.location?.coordinate.longitude else { return}
        DriverRouter.getPrevVipTrips(lat: latitude , lng: longitude ).send { [weak self ] ( response : APIGenericResponse<[SocketVIP_Trip]> )  in
            guard let self = self else { return }
            if let result = response.result {
                self.offers += result
                self.collectionView.reloadData()
            }
           
            
        }
    }
    
    
//MARK: - IGNORE OFFER
    func rejectTrip () {
        
    }
    
    
// MARK: - CALCULATE THE DISTANCE AND THE TIME FROM GOOGLE 
    
    func getDestanceBetween ( lat1 : Double , lng1 : Double , lat2 : Double , lng2 : Double ) -> String {
        let locationA = CLLocation(latitude: lat1 , longitude: lng1 )
        let locationB = CLLocation(latitude: lat2 , longitude: lng2)
        let distanceInKM =  ( locationA.distance(from: locationB) / 100 ).rounded()
        let string = String (distanceInKM ) + " " + "km"
      return string
    }
    
    
    
    
//  func getTravilTime (  lat1 : Double , lng1 : Double , lat2 : Double , lng2 : Double   ) -> String   {
//        let request = MKDirections.Request()
//       
//        request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: lat1, longitude: lng1 ), addressDictionary: nil))
//        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: lat2 , longitude: lng2 ), addressDictionary: nil))
//        request.requestsAlternateRoutes = true
//        request.transportType = .automobile  // will be good for cars
//        let directions = MKDirections(request: request)
//      var returnedString : String =  self.calculateADefualtTime(lat1: lat1,
//                                                                lng1: lng1,
//                                                                lat2: lat2,
//                                                                lng2: lng2)
//      
//                directions.calculate {(response, error) -> Void in
//                    guard let response = response else {
//                        if let error = error {
//                            print("Error: \(error)")
//                            returnedString =   self.calculateADefualtTime(lat1: lat1,
//                                                                          lng1: lng1,
//                                                                          lat2: lat2,
//                                                                          lng2: lng2)
//                        }
//                        return
//                    }
//
//                 
//                    
//                   if response.routes.count > 0 {
//                        let route = response.routes[0]
//                        print("⏰⏰⏰⏰⏰⏰")
//                        print("\(route.expectedTravelTime / 60 )" + "mins".localize)
//                        print(route.expectedTravelTime) // it will be in seconds
//                       returnedString =   "\( (route.expectedTravelTime / 60 ).rounded() )" + "mins".localize
//                     
//                    
//                       
//                   } else {
//                    returnedString =   self.calculateADefualtTime(lat1: lat1,
//                                                                                lng1: lng1,
//                                                                                lat2: lat2,
//                                                                                lng2: lng2)
//                       
//                       
//                   }
//                    
//                }
//    }
//    
//    private func calculateADefualtTime (lat1 : Double , lng1 : Double , lat2 : Double , lng2 : Double ) -> String {
//        let coordinatesA = (latitude: lat1 , longitude: lng1 )
//        let coordinatesB = (latitude: lat2  , longitude: lng2)
//        let locationA = CLLocation(latitude: coordinatesA.latitude, longitude: coordinatesA.longitude)
//        let locationB = CLLocation(latitude: coordinatesB.latitude , longitude: coordinatesB.longitude)
//        let distanceInKM =  ( locationA.distance(from: locationB) / 100 ).rounded()
//       return "\(distanceInKM.rounded() + 2  )" + "mins".localize
//       
//    }
    
    
    
    
    
}

