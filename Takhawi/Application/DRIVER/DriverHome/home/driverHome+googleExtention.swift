//
//  driverHome+googleExtention].swift
//  Takhawi
//
//  Created by Reham Ayman on 10/02/2024.
//

import UIKit
import GoogleMaps
import MapKit
import CoreLocation



extension DriverHomeVC :  CLLocationManagerDelegate  , GMSMapViewDelegate  {
    
    //MARK: - GOOGLE MAPS METHODS
     func setUpGoogleMapView () {
         // Setup location manager
                          
            locationManager.delegate = self
            locationManager.requestLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = 10 // meters
            locationManager.requestWhenInUseAuthorization()
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
       self.locationManager.stopUpdatingLocation()
//        let lat = "\(locationManager.location?.coordinate.latitude ?? 0.0)"
//        let long = "\(locationManager.location?.coordinate.longitude ?? 0.0 )"
        guard let latitude = locationManager.location?.coordinate.latitude else { return}
        guard let longitude =  locationManager.location?.coordinate.longitude else { return}
        print(latitude)
        print(longitude)
        
        
        
        
        getAddress(lat: latitude , Lng: longitude)
        // pass to the socket my location
        
        socketManager.sendMyLocation(lat: latitude , lng: longitude)
        
        self.getAllReports(lat: latitude, lng: longitude)
 
        
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
    
    
    
    
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
          print("Tapped at location: \(coordinate.latitude), \(coordinate.longitude)")
          
          // Clear existing markers
         
          
          // Add a marker at the tapped location
         
          reportMarker.position = coordinate
          reportMarker.title = "Pinned Location"
          reportMarker.snippet = "Lat: \(coordinate.latitude), Lng: \(coordinate.longitude)"
          reportMarker.map = mapView
          self.showAccedintView(lat: coordinate.latitude , lng: coordinate.longitude)
      }
    
    
    
    private func showAccedintView (lat : Double , lng : Double ) {
        let vc = accedintViewVC()
        vc.modalPresentationStyle = .overFullScreen
        vc.passedLat = lat
        vc.passedLng = lng
        
        
        vc.action = { lat , lng , en , ar in
            self.drawItemInMaps(lat: lat , lng: lng , en: en , ar : ar )
           
        }
        self.present(vc , animated: true )
    }
    
    
    

    
    private func drawItemInMaps ( lat : Double , lng : Double , en   : String  , ar : String  ) {
        let coordinates = CLLocationCoordinate2D(latitude: lat , longitude: lng  )
        let endMarker = GMSMarker(position: coordinates )
        endMarker.icon = UIImage(named: self.selectImage(type: en == "" ? ar : en))
        endMarker.title =  en == "" ? ar : en
        endMarker.map = googleMaps
        
    }
    
    private func selectImage ( type : String ) -> String  {
        switch type {
        case "Radar" , "رادار"   :
            return "radar"
          
        case  "Animals" , "حيوانات" :
            return "camel 1"
            
        case "Accident" , "حادثة" :
            return "car 2"
            
        case  "Changing directions" ,  "تغيير مسار"  :
            return "Group 18"
            
            
        case   "Alert" ,  "تنبيه" :
            return "alert-triangle-svgrepo-com 1"
            
        case  "Hole" , "حفرة" :
            return "road (1) 1"
           
        case   "Speed" ,  "تخفيف سرعه" :
            return "download-speed 1"
            
        case   "Works" , "اشغالات" :
            return "road-work (1) 1"
            
            
            
            
        default:
            print("def")
            return "road-work (1) 1"
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
    
    
    
    func getAllReports ( lat : Double , lng : Double   ) {
//        let endMarker = GMSMarker(position: end)
//        endMarker.icon = GMSMarker.markerImage(with: UIColor(named: "MainColor"))
//        startMarker.icon = GMSMarker.markerImage(with: UIColor(named: "MainColor"))
//        endMarker.title = "End"
//        endMarker.map = GoogleView
        
        
        DriverRouter.getAllReports(lat: lat , lng: lng  ).send { [weak self ] (response  : APIGenericResponse<[AccedintReportsResult]>) in
            guard let self = self else { return }
            googleMaps.clear()
            if let result = response.result {
                for i in result {
                 
                    self.drawItemInMaps(lat:  i.location?.lat ?? 0 ,
                                        lng: i.location?.lng ?? 0,
                                        en: i.type ?? ""  ,
                                        ar: i.type ?? "" )
                    
                }
            }
                   
                    
        }
        
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

