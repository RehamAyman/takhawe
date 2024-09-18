//
//  trackYourTripVC+delegate.swift
//  Takhawi
//
//  Created by Reham Ayman on 10/12/2023.
//

import Foundation
import GoogleMaps


extension trackYourTripVC {
    
//MARK: - END TRIP FUNC
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
    
//MARK: - SETUP MAIN VIEW FUNCTIONS
    
    func setUpMainView () {
        self.driverName.text = self.tripData?.driver?.name ?? ""
        self.secDriverName.text =  self.tripData?.driver?.name ?? ""
        self.rate.rating = self.tripData?.driver?.driver_rate ?? 0.0
        self.secRate.rating = self.tripData?.driver?.driver_rate ?? 0.0
        if let image = self.tripData?.driver?.avatar {
            self.driverImage.setImage(image: Server.imageBase.rawValue + image )
            self.secDriverImage.setImage(image: Server.imageBase.rawValue + image )
        }
    }
    
    
    
    
//MARK: - GOOGLE MAPS METHODS
    
    func   setUpGoogleView () {
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
        
        let lat = self.tripData?.pickup_location?.lat ?? 0.0
        let lng = self.tripData?.pickup_location?.lng ?? 0.0
        let newCameraPosition = GMSCameraPosition.camera(withLatitude: lat , longitude: lng , zoom: 14.0 )
        self.googleView.animate(to: newCameraPosition)
        
        print("\(self.tripData?.pickup_location?.lng ?? 0.0 )")
        print("\(self.tripData?.pickup_location?.lat ?? 0.0 )")
     

       let startCoordinate = CLLocationCoordinate2D(latitude: self.tripData?.pickup_location?.lat ?? 0.0 , longitude: self.tripData?.pickup_location?.lng ?? 0.0  )
        let endCoordinate = CLLocationCoordinate2D(latitude: self.tripData?.destination?.lat ?? 0.0 , longitude: self.tripData?.destination?.lng ?? 0.0)
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
    
    
    
   
    
    

    
    
    }

