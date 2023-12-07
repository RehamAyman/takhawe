//
//  homeVc+delegate.swift
//  Takhawi
//
//  Created by Reham Ayman on 26/09/2023.
//

import UIKit
import GoogleMaps



extension homeVC  :  CLLocationManagerDelegate  , GMSMapViewDelegate  , UITableViewDelegate , UITableViewDataSource {
    
    
    
    func finishPassing(location: String, lat: Double, lng: Double) {
        
        self.tripHaveDestination = true 
        self.joinTripDestButton.isHidden = false
        self.searchView.isHidden = true
        self.searchViewContainerHeight.constant = 0
        self.joinTripDestButton.setTitle(location, for: .normal)
        self.containetStackView.addArrangedSubview(   self.joinTripDestButton )
        
        
    }
    
//MARK: - TABLE VIEW METHODS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sideMenuItems.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sideMenuItems[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "sideMenuCell", for: indexPath) as! sideMenuCell
        cell.contentView.backgroundColor = UIColor.clear
        cell.backgroundColor = UIColor.clear
        cell.sideIcon.image = UIImage(named: item.icon)
        cell.title.text = item.name
        cell.selectionStyle = .none
        
     
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 91
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        //
        self.hideMenu()
        publicSideMenu.sideMenuView(index: indexPath, main: self)
        
    }
    
    
    
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
   
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("listen")
       
        centerMapOnLocation(location: locationManager.location!)
        self.locationManager.stopUpdatingLocation()
        let lat = "\(locationManager.location?.coordinate.latitude ?? 0.0)"
        let long = "\(locationManager.location?.coordinate.longitude ?? 0.0 )"
        guard let latitude = locationManager.location?.coordinate.latitude else { return}
        guard let longitude =  locationManager.location?.coordinate.longitude else { return}
        getAddress(lat: latitude , Lng: longitude)
      
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
                                    self.UserLocationOutlet.setTitle(lines[0], for: .normal)
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
    
    
    
    
    
    
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        Alertt.showAlertOnVC(target: self, title: "Make sure GPS is open".localized, message: "")
    }
    
    func centerMapOnLocation(location: CLLocation){
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 12.0)
      
        self.googleMaps.camera = camera
        self.googleMaps.animate(toZoom: 16)
        
        
        
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
    
   
    
    
//MARK: - SEGMENT VIEW ANIMATED METHODS
    
    func segmentOneAction () {
    
        self.locationOutlet.isHidden = true
        self.UserLocationOutlet.isHidden = true
        self.chooseFeatureCollection.isHidden = true
   
        
        UIView.animate(withDuration: 0.8 , animations: {
            
            if self.tripHaveDestination {
              
                self.containetStackView.addArrangedSubview(self.joinTripDestButton)
                self.joinTripDestButton.isHidden = false
            } else {
                self.searchView.isHidden = false
                self.searchViewContainerHeight.constant = 40
            }
            
            
            
            self.viewHeight.constant = 185
            self.joinTripOutlet.setTitle("Join the trip" , for: .normal)
          
            self.containetStackView.removeArrangedSubview(self.collectionContainerView)
          
            
            
            
          
             self.view.layoutIfNeeded()
        })
    }
  
    func segmentTwoAction () {

        self.viewHeight.constant = 290
        self.joinTripDestButton.isHidden = true
        
       
        UIView.animate(withDuration: 0.8 , animations: {
            self.joinTripOutlet.setTitle( "Create Trip", for: .normal)
            self.searchView.isHidden = true
            
            self.searchViewContainerHeight.constant = 0
            self.containetStackView.removeArrangedSubview( self.joinTripDestButton)
            
            self.locationOutlet.isHidden = false
            self.UserLocationOutlet.isHidden = false
            self.chooseFeatureCollection.isHidden = false
            self.containetStackView.addArrangedSubview(self.collectionContainerView)
            
            
            
            
            
            
            self.view.layoutIfNeeded()
        })
      
       
      
    }
    
    
    func initialSegment () {
        let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.gray]
             segment.setTitleTextAttributes(titleTextAttributes, for:.normal)

             let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor(named: "MainColor")]
        segment.setTitleTextAttributes(titleTextAttributes1 as [NSAttributedString.Key : Any], for:.selected)
        segmentContainerView.layer.applySketchShadow(color: .black)
        
      //  self.containetStackView.removeFromSuperview(self.joinTripDestButton)
        self.viewHeight.constant = 185
        self.locationOutlet.isHidden = true
        self.UserLocationOutlet.isHidden = true
        self.chooseFeatureCollection.isHidden = true
        self.containetStackView.removeArrangedSubview(self.collectionContainerView)
        self.joinTripDestButton.isHidden = true
        self.containetStackView.removeArrangedSubview( self.joinTripDestButton)
        
        self.view.layoutIfNeeded()
    }
    
    
    func setTodayDateINformate () {
        let now = Date()
        let stringData = now.dateToString
        self.calendarOutlet.setTitle( stringData, for: .normal)
//        self.calendarOutlet.titleLabel?.font =  UIFont(name: "URW DIN Arabic" , size: 13)
        
        
    }
    
    
    
   
//MARK: - show side menu with animation function
    
    
    
    func showMenu() {
     
        self.containerView.layer.cornerRadius = 40
        self.googleMaps.layer.cornerRadius = self.containerView.layer.cornerRadius
        let x = UIScreen.main.bounds.width * 0.6
        let originalTransform = self.containerView.transform
        let scaledTransform = originalTransform.scaledBy(x: 1, y: 1)
            let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: x, y: 0)
            UIView.animate(withDuration: 0.7, animations: {
                self.containerView.transform = scaledAndTranslatedTransform
                
                
                // stop google maps interaction
                self.googleMaps.isUserInteractionEnabled = false
                self.containerView.isUserInteractionEnabled = false
            })
        
        
        self.menu = true
        
    }

   
    
//MARK: - hide side menu with animation  function
    
    
    
    
    func hideMenu() {
        
            UIView.animate(withDuration: 0.7, animations: {
                self.containerView.transform = self.home
                self.containerView.layer.cornerRadius = 0
               self.googleMaps.layer.cornerRadius = 0
                
                // make maps view able to interact
                self.googleMaps.isUserInteractionEnabled = true
                self.containerView.isUserInteractionEnabled = true
                
            })
        self.menu =  false
    }
    
    
    
    
//MARK: - swipe functions
    
    
    func detectSwipe () {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
          swipeRight.direction = .right
          self.view.addGestureRecognizer(swipeRight)

          let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
          swipeDown.direction = .down
          self.view.addGestureRecognizer(swipeDown)
        
    }

    
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .right:
                print("Swiped right")
            case .down:
                print("Swiped down")
            case .left:
                print("Swiped left")
            case .up:
                print("Swiped up")
            default:
                break
            }
        }
    }
    
    
//MARK: -  if the user touch the mapview also hide
    

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if menu  { // opening right now
            self.hideMenu()
        } else {
        }
         }

    
   
    
}
