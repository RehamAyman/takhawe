//
//  peoviderTripDetails+extention.swift
//  Takhawi
//
//  Created by Reham Ayman on 29/03/1446 AH.
//

import Foundation
import GoogleMaps

extension ProviderTripDetialsVC  :  GMSMapViewDelegate {
    
    
    
    
    //MARK: - GOOGLE VIEW METHODS
    
    func setUpGoogleMapView () {
        
           googleMapsView.delegate = self
           googleMapsView.isMyLocationEnabled = true
        self.setUpMapsTheme()
        let lat = self.passedTrip?.pickup_location?.lat ?? 0
        let lng = self.passedTrip?.pickup_location?.lng ?? 0
        let endLat = self.passedTrip?.destination?.lat ?? 0
        let endLng = self.passedTrip?.destination?.lng ?? 0
        
        self.centerMapOnLocation(lat: lat , lng: lng)
        let start = CLLocationCoordinate2D(latitude: lat , longitude: lng)
        let end =  CLLocationCoordinate2D(latitude: endLat , longitude: endLng)
        self.addMarkers(from: start , to: end )
        self.drawAnimatedRoute(from: start , to: end)
        
        
       }
    
    
    private func centerMapOnLocation( lat : Double , lng : Double ){
        let camera = GMSCameraPosition.camera(withLatitude: lat , longitude: lng , zoom: 14.0)
        self.googleMapsView.camera = camera
        self.googleMapsView.animate(toZoom: 16)
        
        
   }
    
    private func setUpMapsTheme () {
        
        do {
            if let styleURL = Bundle.main.url(forResource: "googleMapsStyle", withExtension: "json") {
                googleMapsView.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
            } else {
                NSLog("Unable to find style.json")
            }
        } catch {
            NSLog("One or more of the map styles failed to load. \(error)")
        }
    }
    
//
    
    func addMarkers(from start: CLLocationCoordinate2D, to end: CLLocationCoordinate2D) {
        let startMarker = GMSMarker(position: start)
        startMarker.title = "Start"
        startMarker.map = googleMapsView

        let endMarker = GMSMarker(position: end)
        endMarker.icon = GMSMarker.markerImage(with: UIColor(named: "MainColor"))
        startMarker.icon = GMSMarker.markerImage(with: UIColor(named: "MainColor"))
        endMarker.title = "End"
        endMarker.map = googleMapsView
        
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
        polyline.map = googleMapsView

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
