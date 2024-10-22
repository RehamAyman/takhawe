//
//  peoviderTripDetails+extention.swift
//  Takhawi
//
//  Created by Reham Ayman on 29/03/1446 AH.
//

import UIKit
import GoogleMaps

extension ProviderTripDetialsVC : UITableViewDelegate , UITableViewDataSource   {
    
    
    //MARK: - DESIGN THE MAIN VIEW ACCORDING TO BASIC VIEW
    func setUpMainBasicView () {
        self.vipContainerView.isHidden = true
        self.vipContainerView.isUserInteractionEnabled = false
        self.mainView.isHidden = false
        self.mainView.isUserInteractionEnabled = true
        
        switch self.tripStatus {
        case .cancelled :
            print("cancelled")
            self.handleDefualtView()
        case .comming : // comming step no. 1
            self.handleCommingView()
            
        case .onWay : // onway step no. 2
            self.handleONwayView()
            
        case .arrived : // onway step no. 3
            self.handleArrivedView()
            
        case .inProgress :
          //  self.handleDefualtView()
            self.handleInProgressView()
            
        case .completed :
            self.handleDefualtView()
            print("00")
        }
    }
    
    
    private func handleCommingView  () {
        self.submitOutlet.setTitle( "On Way".localize, for: .normal)
        UIView.animate(withDuration: 0.5 ) {
            self.mainViewHeight.constant = 200
            self.view.layoutIfNeeded()
        }
    }
    
    //MARK: - HANDLE ONWAY ACTION
    private func handleONwayView () {
        self.submitOutlet.setTitle( "I Arrived".localize, for: .normal)
        UIView.animate(withDuration: 0.5 ) {
            self.mainViewHeight.constant = 200
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    
    
    //MARK: - HANDLE I ARRIVED  ACTION
    private func handleArrivedView () {
        self.submitOutlet.setTitle( "Start Trip".localize, for: .normal)
        self.passengersTableView.isHidden = false
        //  self.passengersTableView.reloadData()
        UIView.animate(withDuration: 0.5 ) {
            self.mainViewHeight.constant = 350
            self.view.layoutIfNeeded()
        }
    }
    
    
    
    //MARK: - HANDLE I Inprogress  ACTION
    
    private func handleInProgressView () {
        //self.bottomStack.isHidden = true
       self.bottomStackHeight.constant = 50
      //  self.bottomStack.isUserInteractionEnabled = false
        self.cancelTrip.isHidden =  true
        self.submitOutlet.setTitle( "End Trip".localize, for: .normal)
        
        self.passengersTableView.isUserInteractionEnabled = false
        self.passengersTableView.isHidden = false
        // show button to end the trip
        UIView.animate(withDuration: 0.5 ) {
            self.mainViewHeight.constant = 270
            self.view.layoutIfNeeded()
        }
        
    }
//    
    
    
    private func handleDefualtView () {
        self.bottomStack.isHidden = true
        self.bottomStackHeight.constant = 0
        self.bottomStack.isUserInteractionEnabled = false
        self.passengersTableView.isUserInteractionEnabled = false
        self.passengersTableView.isHidden = false
        // show button to end the trip
        UIView.animate(withDuration: 0.5 ) {
            self.mainViewHeight.constant = 270
            self.view.layoutIfNeeded()
        }
        
    }
    
    
    //MARK: - HANDLE  UPDATE TRIP STATUS ACTION
    
    func updateTripStatus (status  : tripStatus  ) {
        activityIndicatorr.startAnimating()
        DriverRouter.updateTripStatus(id: self.passedTrip?.id ?? 0  , type: status.rawValue).send { [weak self] ( response : APIGlobalResponse )  in
            guard let self = self else { return }
            if response.status == true {
                // update the status type method
                self.tripStatus = status
                if self.passedTrip?.type == "BASIC" {
                    self.setUpMainBasicView()
                } else {
                    self.setUpVipView()
                }
               
                self.action?()
            }
            
        }
    }
    
    
    func markPassengerAttend (id : Int) {
        activityIndicatorr.startAnimating()
        DriverRouter.markPassenger(id: id).send { [weak self ] ( response : APIGlobalResponse)  in
            guard let self = self else { return }
            if response.status == true {
                
                self.passengersTableView.reloadData()
            }
            
        }
    }
    
    
    
    
    
    //MARK: - DESIGN THE MAIN VIEW ACCORDING TO VIP MODE
    func setUpVipView () {
        self.mainView.isHidden = true
        self.mainView.isUserInteractionEnabled = false
        self.vipContainerView.isHidden = false
        self.vipContainerView.isUserInteractionEnabled = true
        switch self.tripStatus {
        case .cancelled :
            self.handleDefualtVipMode()
          
        case .comming : // comming step no. 1
            
            self.handleCommingVip()
            
        case .onWay : // onway step no. 2
            
            self.handleOnwayVip()
            
        case .arrived : // onway step no. 3
            self.handleArriavVip()
            
        case .inProgress :
            self.handleOnProgressVip()
            
        case .completed :
            self.handleDefualtVipMode()
            print("00")
        }
        
    }
    
    
    func handleCommingVip () {
        self.vipSubmitOutlet.setTitle( "On Way".localize, for: .normal)
        
    }
    
    func handleOnwayVip () {
        self.vipSubmitOutlet.setTitle( "I Arrived".localize, for: .normal)
    }
    
    func handleArriavVip () {
        self.vipSubmitOutlet.setTitle( "Start Trip".localize, for: .normal)
    }
    
    func handleDefualtVipMode () {
        self.vipActionsStack.isHidden = true
        self.vipActionsStack.isUserInteractionEnabled = false
        
        UIView.animate(withDuration: 0.5 ) {
            self.vipHeight.constant = 250
            self.view.layoutIfNeeded()
        }
    }
    
    func handleOnProgressVip () {
        self.vipSubmitOutlet.setTitle( "End Trip".localize , for: .normal)
        
//        self.vipActionsStack.isHidden = true
//        self.vipActionsStack.isUserInteractionEnabled = false
//        
//        UIView.animate(withDuration: 0.5 ) {
//            self.vipHeight.constant = 250
//            self.view.layoutIfNeeded()
//        }
    }
    
    
    //MARK: - PASSENGERS TABLE VIEW METHODSS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.passedTrip?.Passengers?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "passengersCell" , for: indexPath) as! passengersCell
        cell.selectionStyle = .none
        if  var items = self.passedTrip?.Passengers?[indexPath.row] {
            
            if let imageUrl = items.passnger?.avatar {
                let image = Server.imageBase.rawValue +  imageUrl
                cell.passengerImage.setImage(image: image)
            }
            
            cell.passengerName.text = items.passnger?.name ?? ""
            cell.rate.rating = items.passnger?.passenger_rate ?? 0
            
            cell.arraivedOutlet.backgroundColor = items.status == "ARRIVED" ? UIColor.systemGray4 : UIColor(named: "MainColor")
            cell.arraivedOutlet.addTapGesture {
                items.status = "ARRIVED"
                cell.backgroundColor = UIColor.systemGray4
                self.markPassengerAttend(id: items.id ?? 0)
                self.passengersTableView.reloadData()
                
            }
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
        
    }
    
    func OpenChat (  ) {
        activityIndicatorr.startAnimating()
        UserRouter.openChat(tripId: self.passedTrip?.id ?? 0 , driverId: UserDefaults.user?.user?.id ?? 0  , userId: passedTrip?.Passenger?.id ?? 0, ISdriver: true  ).send { [weak self ] ( response : APIGenericResponse<openChatResult>)  in
            guard let self = self else { return }
            if response.status == true  {
                
                let myAvatarLink = Server.imageBase.rawValue + ( UserDefaults.user?.user?.avatar ?? "" )
                let vc = ChatViewController(conversationId:  response.result?.id ?? ""  ,
                                            titleName: self.passedTrip?.Passenger?.name ?? ""  ,
                                            socketManger:
                                                ChatSocketConnection(ConnectionType: .chat,
                                                                     conversationId: response.result?.id ?? ""  ,
                                                                     sender: .init(type: .provider, id: "\(UserDefaults.user?.user?.id ?? 0)",
                                                                                   senderName: UserDefaults.user?.user?.name ?? "" ,
                                                                                   avatar: myAvatarLink ),
                                                                     receiver: .init(id: "\(response.result?.userId ?? 0 )" ,
                                                                                     type: .client)))
                vc.partnerImage = Server.imageBase.rawValue + (  self.passedTrip?.Passenger?.image ?? ""  )
                //   vc.partnerPhoneNumber = phone
                
                self.push(vc )
            }
        }
        
    }
}
    
    
    
    
//MARK: - opening chat with the client
    

    
    
//MARK: - GOOGLE VIEW METHODS
    
extension ProviderTripDetialsVC : GMSMapViewDelegate {
    
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
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("listen")
       
       
     //   self.locationManager.stopUpdatingLocation()
//        let lat = "\(locationManager.location?.coordinate.latitude ?? 0.0)"
//        let long = "\(locationManager.location?.coordinate.longitude ?? 0.0 )"
        guard let latitude = locationManager.location?.coordinate.latitude else { return}
        guard let longitude =  locationManager.location?.coordinate.longitude else { return}
       
        self.km.text = self.getDestanceBetween(lat1: latitude, lng1: longitude, lat2: self.passedTrip?.pickup_location?.lat ?? 0 , lng2: self.passedTrip?.pickup_location?.lng ?? 0 )
        
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
    
    
    
     func getDestanceBetween ( lat1 : Double , lng1 : Double , lat2 : Double , lng2 : Double ) -> String {
        let coordinatesA = (latitude: lat1 , longitude: lng1)
        let coordinatesB = (latitude: lat2  , longitude: lng2 )
        let locationA = CLLocation(latitude: coordinatesA.latitude, longitude: coordinatesA.longitude)
        let locationB = CLLocation(latitude: coordinatesB.latitude , longitude: coordinatesB.longitude)
         
         
         
        let distanceInKM =  ( locationA.distance(from: locationB) / 100 ).rounded()
        let string = String (distanceInKM ) + " " + "km"
      return string
    }
    
    
   
}
    

