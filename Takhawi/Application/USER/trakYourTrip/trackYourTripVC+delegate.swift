//
//  trackYourTripVC+delegate.swift
//  Takhawi
//
//  Created by Reham Ayman on 10/12/2023.
//

import Foundation
import GoogleMaps
import MapKit


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
    
    func connectSocket () {
        print("🌏1------- connect socket connection ----- ")
        socketManager.connect()
        socketManager.listenToDRIVERLOCATION { driverLocation  in
            print("heey there ✅ success passed the offers ... ")
            self.updateMarkerPosition(lat: driverLocation.lat, lng: driverLocation.lng)
           // update the view in the maps with animation
  
        }
    }
    
    
    
    
//MARK: - GOOGLE MAPS METHODS
    
    func   setUpGoogleView ( lat1 : Double , lat2 : Double , lng1 : Double , lng2 : Double) {
        
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
        
        
        let newCameraPosition = GMSCameraPosition.camera(withLatitude: lat1 , longitude: lng1 , zoom: 14.0 )
        self.googleView.animate(to: newCameraPosition)
        
   
     

       let startCoordinate = CLLocationCoordinate2D(latitude: lat1 , longitude: lng1  )
        let endCoordinate = CLLocationCoordinate2D(latitude: lat2 , longitude: lng2 )
                addMarkers(from: startCoordinate, to: endCoordinate)
                drawAnimatedRoute(from: startCoordinate, to: endCoordinate)
        
        getGoogleRouteTimeAndDistance(from: startCoordinate, to: endCoordinate , mode: "driving") { time, distance in
            print("🕒 Travel Time: \(time)")
            print("📏 Distance: \(distance)")
            self.deliveryTime.text = time
            self.secDeliverTime.text = time
            self.distance.text = distance
            self.secDistance.text = distance
        }

      }
      
    
    
    
    func updateMarkerPosition(lat: CLLocationDegrees, lng: CLLocationDegrees) {
       
           let newPosition = CLLocationCoordinate2D(latitude: lat, longitude: lng)

           // Animate the marker movement to the new position
           CATransaction.begin()
           CATransaction.setAnimationDuration(2.0) // Duration of the animation
        self.TrackMarker.position = newPosition
           CATransaction.commit()

           // Optionally, update the camera to focus on the new position
           let cameraUpdate = GMSCameraUpdate.setTarget(newPosition, zoom: googleView.camera.zoom)
           googleView.animate(with: cameraUpdate)
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
          //mapIcon
          let trackMarker = GMSMarker(position: end)
          self.TrackMarker = trackMarker
          if let icon = UIImage(named: "mapIcon") {
            //  trackMarker.icon = icon
             // trackMarker.map = googleView
              self.TrackMarker.icon = icon
              self.TrackMarker.map = googleView
          }
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
    
    
  
    func getGoogleRouteTimeAndDistance(from start: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, mode: String = "driving", completion: @escaping (String, String) -> Void) {
        let apiKey = AppDelegate.GoogleAPI
        let urlString = "https://maps.googleapis.com/maps/api/directions/json?origin=\(start.latitude),\(start.longitude)&destination=\(destination.latitude),\(destination.longitude)&mode=\(mode)&key=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            print("❌ Invalid URL")
            completion("--", "--")
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("❌ Error: \(error.localizedDescription)")
                completion("Error", "Error")
                return
            }
            
            guard let data = data else {
                print("❌ No data received")
                completion("--", "--")
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let routes = json["routes"] as? [[String: Any]],
                   let firstRoute = routes.first,
                   let legs = firstRoute["legs"] as? [[String: Any]],
                   let firstLeg = legs.first,
                   let duration = firstLeg["duration"] as? [String: Any],
                   let distance = firstLeg["distance"] as? [String: Any],
                   let timeText = duration["text"] as? String,
                   let distanceText = distance["text"] as? String {
                    
                    DispatchQueue.main.async {
                        completion(timeText, distanceText)
                    }
                } else {
                    print("❌ Error parsing JSON")
                    completion("--", "--")
                }
            } catch {
                print("❌ JSON decoding error: \(error)")
                completion("--", "--")
            }
        }.resume()
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

