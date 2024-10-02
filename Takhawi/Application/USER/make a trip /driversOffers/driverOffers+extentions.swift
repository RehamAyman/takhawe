//
//  driverOffers+extentions.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/11/2023.
//

import UIKit
import CoreLocation
import MapKit


extension driverOffersVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.offers.count == 0 {
            self.noOffersView.isHidden = false
            UIView.animate(withDuration: 0.5) {
                self.animationView.play()
                self.noOffersViewHeight.constant = 300
            } 
        } else {
            self.noOffersView.isHidden = true
            self.noOffersViewHeight.constant = 0
        }
        return self.offers.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "driversOffersCell", for: indexPath) as! driversOffersCell
        let item = self.offers[indexPath.row]
        
        
        
        for i in cell.featureIcons {
            i.image = i.image?.withRenderingMode(.alwaysTemplate)
            i.tintColor = UIColor.systemGray5
        }
        
        
        
        if let features = item.features {
           
            cell.airCondIcon.tintColor = features.contains("AIR CONDITIONER") ?  UIColor(named: "MainColor") : UIColor.systemGray5
            cell.wifiIcon.tintColor = features.contains(Features.wifi.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            cell.musicIcon.tintColor = features.contains(Features.music.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            cell.foodicon.tintColor = features.contains(Features.food.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            cell.smokingIcon.tintColor = features.contains(Features.noSmoking.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
            cell.babyIcon.tintColor = features.contains(Features.pet.rawValue) ?  UIColor(named: "MainColor") : UIColor.systemGray5
           
        }
        cell.driverName.text = item.driver?.name
        cell.price.text = String ( item.price ?? 0.0 )
        cell.distance.text = self.getDestanceBetween()
        cell.time.text = self.time
        cell.driverRate.rating = item.driver?.driver_rate ?? 0 // item.driverRate
        if let driverImage = item.driver?.avatar {
            let url = Server.imageBase.rawValue + driverImage
                cell.driverPhoto.setImage(image: url )
        }
       
        let color =  item.driver?.vehicles?.vehicle_Color?.name ?? ""
        let Vclass =  item.driver?.vehicles?.vehicle_Class?.name ?? ""
        let name = item.driver?.vehicles?.vehicle_Name?.name ?? ""
        let type = item.driver?.vehicles?.vehicle_Type?.name ?? ""
       
        
        cell.carName.text = color + " " + Vclass + " " + name  + " " + type    //"red nissan sedan ARC 1233"
        cell.action = {
            let vc =  ReserveTheTripVC()
            vc.viptrip = true
            vc.offer = item
          
            vc.locationDetails = self.locationDetails
            self.push(vc)
        }
        
        cell.cancel = {
            self.offers.remove(at: indexPath.row)
            UIView.animate(withDuration: 0.5) {
                tableView.reloadData()
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    private func getDestanceBetween () -> String {
        let coordinatesA = (latitude: self.locationDetails?.CurrentLat ?? 0.0 , longitude: self.locationDetails?.currentLng ?? 0.0)
        let coordinatesB = (latitude: self.locationDetails?.desLat ?? 0.0  , longitude: self.locationDetails?.destLng ?? 0.0 )

        let locationA = CLLocation(latitude: coordinatesA.latitude, longitude: coordinatesA.longitude)
        let locationB = CLLocation(latitude: coordinatesB.latitude , longitude: coordinatesB.longitude)
        let distanceInKM =  ( locationA.distance(from: locationB) / 100 ).rounded()
        let string = String (distanceInKM ) + " " + "km"
      return string
    }
    
  func getTravilTime ()  {
        let request = MKDirections.Request()
        let latA = self.locationDetails?.CurrentLat ?? 0.0
        let lngA = self.locationDetails?.currentLng ?? 0.0
        let latB = self.locationDetails?.desLat ?? 0.0
        let lngB = self.locationDetails?.destLng ?? 0.0
        
        request.source = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: latA, longitude: lngA ), addressDictionary: nil))
        request.destination = MKMapItem(placemark: MKPlacemark(coordinate: CLLocationCoordinate2D(latitude: latB , longitude: lngB ), addressDictionary: nil))
        request.requestsAlternateRoutes = true
        request.transportType = .automobile  // will be good for cars
        let directions = MKDirections(request: request)
    
                directions.calculate {(response, error) -> Void in

                    guard let response = response else {
                        if let error = error {
                            print("Error: \(error)")
                            
                            self.calculateADefualtTime()
                            
                        }
                        return
                    }

                  // Lets Get the first suggested route and its travel time
                    
                   if response.routes.count > 0 {
                        let route = response.routes[0]
                        print("⏰⏰⏰⏰⏰⏰")
                        print("\(route.expectedTravelTime / 60 )" + "mins".localize)
                        print(route.expectedTravelTime) // it will be in seconds
                       self.time =  "\( (route.expectedTravelTime / 60 ).rounded() )" + "mins".localize
                       self.tableview.reloadData()
                   } else {
                       self.calculateADefualtTime()
                   }
                }
    }
    
    private func calculateADefualtTime () {
        let coordinatesA = (latitude: self.locationDetails?.CurrentLat ?? 0.0 , longitude: self.locationDetails?.currentLng ?? 0.0)
        let coordinatesB = (latitude: self.locationDetails?.desLat ?? 0.0  , longitude: self.locationDetails?.destLng ?? 0.0 )

        let locationA = CLLocation(latitude: coordinatesA.latitude, longitude: coordinatesA.longitude)
        let locationB = CLLocation(latitude: coordinatesB.latitude , longitude: coordinatesB.longitude)
        let distanceInKM =  ( locationA.distance(from: locationB) / 100 ).rounded()
        self.time = "\(distanceInKM.rounded() + 2  )" + "mins".localize
        self.tableview.reloadData()
    }
    
    
}
