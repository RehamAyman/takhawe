//
//  trackYourTripVC+delegate.swift
//  Takhawi
//
//  Created by Reham Ayman on 10/12/2023.
//

import Foundation
import GoogleMaps


extension trackYourTripVC {
    
    
    func tripEnd () {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10 ) {
            print("................... here we go to track the driver ")
            let vc = rateTheDriverVC()
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
            if self.stopCompleteTheTrip == false {
                self.present( vc , animated: true)
                
            }
        }
    }
        
        
        func   setUpGoogleView () {
            let camera = GMSCameraPosition.camera(withLatitude: 10.8116326 , longitude: 106.6727548, zoom: 17.5)
            self.googleView.camera = camera
            
            Utilities.findRouteOnMap(
                pickup: CLLocationCoordinate2D(latitude: 10.8116326, longitude: 106.6727548),
                destination: CLLocationCoordinate2D(latitude: 10.7721148, longitude: 106.6960897)) { [weak self] route in
                    guard let route = route else { return }
                    self?.makeAnimatePolyline(route: route)
                }
            
            do {
                // Set the map style by passing the URL of the local file.
                if let styleURL = Bundle.main.url(forResource: "googleMapsStyle", withExtension: "json") {
                    googleView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
                    
                } else {
                    NSLog("Unable to find style.json")
                }
            } catch {
                NSLog("One or more of the map styles failed to load. \(error)")
            }
            
        }
        
        private func makeAnimatePolyline(route: [CLLocationCoordinate2D]) {
            self.animatePolyline = AnimatePolyline(mapView: self.googleView)
            self.animatePolyline?.route = route
            self.animatePolyline?.startAnimation()
            
            googleView.animate(with: GMSCameraUpdate.fit(GMSCoordinateBounds(path: route.path), withPadding: 50.0))
        }
        
        
        
    }

