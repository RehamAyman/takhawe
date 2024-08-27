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
      let camera = GMSCameraPosition.camera(withLatitude: self.tripDetails?.pickuplocation?.lat ?? 0.0    , longitude: self.tripDetails?.pickuplocation?.lng ?? 0.0   , zoom: 13.0)
      self.googleView.camera = camera
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

     let startCoordinate = CLLocationCoordinate2D(latitude: self.tripDetails?.pickuplocation?.lat ?? 0.0 , longitude: self.tripDetails?.pickuplocation?.lng ?? 0.0  )
      let endCoordinate = CLLocationCoordinate2D(latitude: self.tripDetails?.destinationlocation?.lat ?? 0.0 , longitude: self.tripDetails?.destinationlocation?.lng ?? 0.0)
              addMarkers(from: startCoordinate, to: endCoordinate)
              drawAnimatedRoute(from: startCoordinate, to: endCoordinate)
      
      

    }
    
    
    func addMarkers(from start: CLLocationCoordinate2D, to end: CLLocationCoordinate2D) {
        let startMarker = GMSMarker(position: start)
        startMarker.title = "Start"
        startMarker.map = googleView

        let endMarker = GMSMarker(position: end)
        endMarker.icon = GMSMarker.markerImage(with: UIColor(named: "MainColor"))
        startMarker.icon = GMSMarker.markerImage(with: UIColor(named: "MainColor"))
        endMarker.title = "End"
        endMarker.map = googleView
        
        
//        if let icon = UIImage(named: "Vector 1") {
//            startMarker.icon = icon
//            endMarker.icon = icon
//               }
        
    }
    
    
    func drawAnimatedRoute(from start: CLLocationCoordinate2D, to end: CLLocationCoordinate2D) {
        let urlString = "https://maps.googleapis.com/maps/api/directions/json?origin=\(start.latitude),\(start.longitude)&destination=\(end.latitude),\(end.longitude)&key=AIzaSyAfTSBkcXfJa5Zf0YHN3-m-gJFFhvzVu4U"
        guard let url = URL(string: urlString) else { return }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
           
            
            guard let data = data, error == nil else {
                print("Error fetching route: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                 
                   let routes = json["routes"] as? [[String: Any]],
                   let route = routes.first,
                   let overviewPolyline = route["overview_polyline"] as? [String: Any],
                   let points = overviewPolyline["points"] as? String {

                    print(json)
                    DispatchQueue.main.async {
                        self.animatePolyline(from: start, to: end, encodedPolyline: points)
                    }
                }
            } catch {
                
                
                print("Error parsing route: \(error.localizedDescription)")
            }
        }
        task.resume()
    }
    
  private func animatePolyline(from start: CLLocationCoordinate2D, to end: CLLocationCoordinate2D, encodedPolyline: String) {
        guard let path = GMSPath(fromEncodedPath: encodedPolyline) else { return }
        
        let polyline = GMSPolyline(path: path)
        polyline.strokeWidth = 7.0
      polyline.strokeColor = UIColor(named: "MainColor")  ?? UIColor.green
        polyline.map = googleView

        let numberOfPoints = path.count()
        var animatedPath = GMSMutablePath()
        animatedPath.add(start)
        
        let timer = Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
            let progress = CGFloat(animatedPath.count() - 1) / CGFloat(numberOfPoints)
            if progress < 1.0 {
                let segmentIndex = Int(progress * CGFloat(numberOfPoints - 1))
                let point = path.coordinate(at: UInt(segmentIndex))
                animatedPath.add(point)
                polyline.path = animatedPath
            } else {
                timer.invalidate()
            }
        }
      RunLoop.current.add(timer, forMode: .default)
    }
    

    
    func setMainDataInfo () {
        self.driverName.text = self.tripDetails?.driver_name ?? "--"
        //driver rate
        // trips
        self.tripDate.text = self.tripDetails?.start_date?.convertFromIso()
        
    }
    

    
    
}
