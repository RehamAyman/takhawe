//
//  driverProfile+collection.swift
//  Takhawi
//
//  Created by Reham Ayman on 19/10/2023.
//

import UIKit
import GoogleMaps




extension driverProfileVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dummyActivty.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "profileCell", for: indexPath) as! profileCell
        let item = self.dummyActivty[indexPath.row]
        cell.name.text = item.name
        cell.icon.image =  UIImage(named: item.icon)
        if let mainColor = UIColor(named: "MainColor") {
            
            cell.icon.tintColor = UIColor.systemGray5
           
        }
       
        return cell
    }
    
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let label = UILabel(frame: CGRect.zero)
        label.text = self.dummyActivty[indexPath.item].name
        label.sizeToFit()
        return CGSize(width: label.frame.width  , height: 55)
    }
    

    
    // google maps functions
    
    

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


    
    func setMainDataInfo () {
        self.driverName.text = self.tripDetails?.driver_name ?? "--"
        //driver rate
        // trips
        self.tripDate.text = self.tripDetails?.start_date?.convertFromIso()
        
    }
}
