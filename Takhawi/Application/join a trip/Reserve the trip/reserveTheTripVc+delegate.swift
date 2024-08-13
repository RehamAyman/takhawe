//
//  reserveTheTripVc+delegate.swift
//  Takhawi
//
//  Created by Reham Ayman on 27/11/2023.
//

import UIKit
import CoreLocation

extension ReserveTheTripVC : UITableViewDelegate , UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        
        self.tableviewHeight.constant = CGFloat(85 * self.DummyPaymentMethods.count) + 50
        return self.DummyPaymentMethods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reserveTheTripCell") as! reserveTheTripCell
        let  item = self.DummyPaymentMethods[indexPath.row]
        cell.hint.text = item.expireIn
        cell.iconimage.image = UIImage(named: item.icon)
        cell.title.text = item.number
        cell.selectionStyle = .none
       
            
       
        
        if item.type == "wallet" {
            cell.title.text = "My Wallet".localize
            cell.iconimage.image = UIImage(named: "empty-wallet")
            cell.hint.text = ""
            cell.hint.isHidden = true
            
        }
        if item.type == "cash" {
            cell.title.text = "Cash".localize
            cell.iconimage.image = UIImage(named: "money 1")
            cell.hint.text = ""
            cell.hint.isHidden = true
            
        }
        
        if item.selected == true {
          //  cell.title.text = "hello"
        }
        
     
        
        return cell
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? reserveTheTripCell else {
            return
        }
        let item = self.DummyPaymentMethods[indexPath.row]
        cell.checkMarkView.isHidden = false
        cell.checkMarkView.play()
        self.paymentMethod = item.id
    }
    
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? reserveTheTripCell else {
            return
        }
     cell.checkMarkView.isHidden = true
           
       }
        
    
//MARK: - GET VIP TRIP DETAILS
    
    func getVipDetails () {
        if let image =  self.offer?.driver?.avatar  {
            self.driverImage.setImage(image: image)
        }
        self.driverName.text = offer?.driver?.name ?? ""
        self.tripDate.text = offer?.createdAt?.convertFromIso()
        self.from.text = self.locationDetails?.currentAddress
        self.to.text = self.locationDetails?.destAddress
        self.destance.text = self.getDestanceBetween()
        self.seatPrice.text =  "\(self.offer?.price ?? 0.0 )" + "SAR".localize
        // backend didnot add it yet
        self.vatCost.text = " -- " + "SAR".localize
        self.codePrice.text = " -- " + "SAR".localize
    }
    
    

//MARK: - GET DESTANCE METHOD
    
    
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
