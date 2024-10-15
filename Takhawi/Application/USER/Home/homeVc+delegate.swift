//
//  homeVc+delegate.swift
//  Takhawi
//
//  Created by Reham Ayman on 26/09/2023.
//

import UIKit
import GoogleMaps
import Lottie



extension homeVC  :  CLLocationManagerDelegate  , GMSMapViewDelegate  , UITableViewDelegate , UITableViewDataSource {

    
    func continueToVipTripCycle () {
        let vc = makeAtripAlertPopUpVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        vc.action = {
            self.createVipTrip()
        }
        self.present(vc , animated: true)
    }
    
    
    func finishPassing(location: String, lat: Double, lng: Double ) {
        self.destLat = lat
        self.destLong = lng
        if self.segment.selectedSegmentIndex == 0 { // join a trip
            self.tripHaveDestination = true
            self.joinatripButtonHeight.constant = 40
            self.joinTripDestButton.isHidden = false
            self.frchooseDestinationViewHeight.constant = 0
            self.searchView.isHidden = true
            self.joinTripDestButton.setTitle(location, for: .normal)
        } else { // vip trip
            self.secMydestinationOutlet.setTitle(location, for: .normal)
        }
       
 
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
        cell.sideIcon.image = UIImage(named: item.icon)?.withRenderingMode(.alwaysTemplate)
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
        if indexPath.row == 0 {
          //  self.switchRole()
        } else {
            publicSideMenu.sideMenuView(index: indexPath, main: self)
        }
            
       
         
      
        
    }
    
    
    private func switchRole () {
        activityIndicatorr.startAnimating()
        UserRouter.switchRole.send { [weak self]  (response : APIGenericResponse<LoginModelData>  )  in
            guard let self = self else { return }
            
            
        }
    }
    
//MARK: - GOOGLE MAPS METHODS
 func setUpGoogleMapView () {
        locationManager.requestLocation()
        locationManager.startUpdatingLocation()
        googleMaps.delegate = self
        setupLottieView()
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
     
      googleMaps.settings.myLocationButton = false
      googleMaps.isMyLocationEnabled = false
    }

    
    func setupLottieView() {
           // Initialize Lottie animation view with your animation JSON file
           lottieAnimationView = LottieAnimationView(name: "z2vKVVJpIc")
           lottieAnimationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200) // Adjust size as needed
           lottieAnimationView.contentMode = .scaleAspectFit
           lottieAnimationView.loopMode = .loop
           lottieAnimationView.play()
        lottieAnimationView.isUserInteractionEnabled = false
           // Add the Lottie view to the view hierarchy
           lottieAnimationView.isHidden = true
           self.googleMaps.addSubview(lottieAnimationView)
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
   
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
           // Ensure the Lottie marker moves with the map
        print("iam moving ")
           if let coordinate = mapView.myLocation?.coordinate {
               print("here my location \(coordinate)")
               let point = mapView.projection.point(for: coordinate)
               lottieAnimationView.center = point
           } else if let currentLocation = self.currentUserLocation {
               print("here my second chance ")
               let point =  mapView.projection.point(for: currentLocation)
               lottieAnimationView.center = point
           }
       }
    
    

    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("listen")
   
        centerMapOnLocation(location: locationManager.location!)
        self.locationManager.stopUpdatingLocation()
          
        if let location = locations.last {
            print("last detect")
            currentUserLocation = location.coordinate
            let userLocation = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let point = googleMaps.projection.point(for: userLocation)
            lottieAnimationView.center = point
            lottieAnimationView.isHidden = false
            getAddress(lat: location.coordinate.latitude , Lng: location.coordinate.longitude)
            
        }
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
                                    
                                 self.secMyLocationOutlet.setTitle(lines[0], for: .normal)
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
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 13.0)
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
        self.containetStackView.isHidden = false
        self.containetStackView.isUserInteractionEnabled = true
        self.secMakeAtripStack.isHidden = true
        self.secMakeAtripStack.isUserInteractionEnabled = false
        

        
        self.joinTripOutlet.setTitle("Join the trip".localize , for: .normal)
        if self.tripHaveDestination {
            self.joinatripButtonHeight.constant = 40
            self.joinTripDestButton.isHidden = false
            self.frchooseDestinationViewHeight.constant = 0
        } else {
            self.frchooseDestinationViewHeight.constant = 45
            self.joinatripButtonHeight.constant = 0
            self.joinTripDestButton.isHidden = true
        }

        self.viewHeight.constant = 230
        
        UIView.animate(withDuration: 0.5 , animations: {
            self.view.layoutIfNeeded()
        })
    }
  
    func segmentTwoAction () {
        
        self.containetStackView.isHidden = true
        self.containetStackView.isUserInteractionEnabled = false
        self.secMakeAtripStack.isHidden = false
        self.secMakeAtripStack.isUserInteractionEnabled = true
        
        self.joinTripOutlet.setTitle( "Create Trip".localize, for: .normal)

        self.viewHeight.constant = 320
        
        UIView.animate(withDuration: 0.5 , animations: {
           
            self.view.layoutIfNeeded()
        })
      
       
      
    }
    
    
    func initialSegment () {
        
                                         
        self.joinTripOutlet.setTitle("Join the trip".localize , for: .normal)

             let titleTextAttributes1 = [NSAttributedString.Key.foregroundColor: UIColor(named: "MainColor")]
        segment.setTitleTextAttributes(titleTextAttributes1 as [NSAttributedString.Key : Any], for:.selected)
      
        
        let font = UIFont.boldSystemFont(ofSize: 12 )
        let attributes = [ NSAttributedString.Key.foregroundColor : UIColor.lightGray,
                           NSAttributedString.Key.font : font ]
        segment.setTitleTextAttributes(attributes, for:.normal)
        
        
        
        self.viewHeight.constant = 230
        self.joinTripDestButton.isHidden = true
        self.joinatripButtonHeight.constant = 0
        self.frchooseDestinationViewHeight.constant = 45
        self.containetStackView.isHidden = false
        self.secMakeAtripStack.isHidden = true
        segment.setTitle("Join a trip".localize, forSegmentAt: 0)
        segment.setTitle("Make a trip".localize, forSegmentAt: 1)
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
        self.sideMenuContainer.isHidden = false
        self.visualView.isHidden = false
        self.visualView.isUserInteractionEnabled = true
        self.sideMenuContainer.isHidden = false
        self.sideMenuContainer.isUserInteractionEnabled = true
        let x = UIScreen.main.bounds.width * 0.6
        let originalTransform = self.sideMenuContainer.transform
        let scaledTransform = originalTransform.scaledBy(x: 1, y: 1)
        let lang = LocalizationManager.shared.getLanguage()
        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: lang == .Arabic ? -x : x , y: 0)
            UIView.animate(withDuration: 0.5, animations: {
                self.sideMenuContainer.transform = scaledAndTranslatedTransform
                // stop google maps interaction
                self.googleMaps.isUserInteractionEnabled = false
                self.containerView.isUserInteractionEnabled = false
            })
        self.menu = true
    }
  
   
    
   //MARK: - GET YOUR DESTINATION FROM GOOGLE MAPS METHOD
    
    func getDestinationFromMaps ( vip : Bool) {
       
        
        
        let vc = homeSearchVC ()
        vc.currentLat = locationManager.location?.coordinate.latitude ?? 0.0
        vc.currentong = locationManager.location?.coordinate.longitude ?? 0.0
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .overCurrentContext
        let pushVc = mapSearchVC()
        pushVc.delegate = self
        vc.selectAndDismiss = { string , lat , long  in
            
            self.destLat =  lat  // 21.492500
            self.destLong =  long
            
            if vip {
                self.secMydestinationOutlet.setTitle(string, for: .normal)

              // 39.177570
            } else {
                self.tripHaveDestination = true
                self.joinTripDestButton.isHidden = false
                self.searchView.isHidden = true
                self.joinTripDestButton.setTitle( string , for: .normal)
                self.joinatripButtonHeight.constant = 40
                self.frchooseDestinationViewHeight.constant = 0
            }
  
        }
        
        
        
        present(vc , animated: true )
        vc.onCommit  = {  [weak self] in
           
            self?.push(pushVc)
        }
    }
    
//MARK: - hide side menu with animation  function
    
    
    
    func initialSideMenu () {
       
        self.visualView.isHidden = true
        self.visualView.isUserInteractionEnabled = false
        self.sideMenuContainer.isHidden = true
        let x = UIScreen.main.bounds.width * 0.6
        let originalTransform = self.sideMenuContainer.transform
        let scaledTransform = originalTransform.scaledBy(x: 1, y: 1)
        let lang = LocalizationManager.shared.getLanguage()
        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: lang == .Arabic ? x :  -x, y: 0)
        self.sideMenuContainer.transform = scaledAndTranslatedTransform
        // stop google maps interaction
        self.googleMaps.isUserInteractionEnabled = true
        self.containerView.isUserInteractionEnabled = true
       

        
        
    }
    
    func hideMenu() {
        self.visualView.isHidden = true
        self.visualView.isUserInteractionEnabled = false
        let x = UIScreen.main.bounds.width * 0.6
               let originalTransform = self.sideMenuContainer.transform
               let scaledTransform = originalTransform.scaledBy(x: 1, y: 1)
               let lang = LocalizationManager.shared.getLanguage()
        let scaledAndTranslatedTransform = scaledTransform.translatedBy(x: lang == .Arabic ? x :  -x, y: 0)
                   UIView.animate(withDuration: 0.5, animations: {
                       self.sideMenuContainer.transform = scaledAndTranslatedTransform
                       // stop google maps interaction
                       self.googleMaps.isUserInteractionEnabled = true
                       self.containerView.isUserInteractionEnabled = true
                   })
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5  ) {
            self.sideMenuContainer.isHidden = true
        }
        
    
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
