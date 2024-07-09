//
//  driverOffers+extentions.swift
//  Takhawi
//
//  Created by Reham Ayman on 28/11/2023.
//

import UIKit
import CoreLocation


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
        if let features = item.features {
            cell.airCondIcon.image = features.contains("IR CONDITIONER") ?  UIImage(named: "") : UIImage(named: "")
        }
        cell.driverName.text = item.driver?.name
        cell.price.text = String ( item.price ?? 0.0 )
        cell.distance.text = self.getDestanceBetween()
        cell.driverRate.rating = 4 // item.driverRate
        if let driverImage = item.driver?.avatar {
            cell.driverPhoto.setImage(image: driverImage )
        }
       
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
    
    
}
