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
            
            cell.hint.isHidden = true
            
        }
        if item.type == "cash" {
            cell.title.text = "Cash".localize
            cell.iconimage.image = UIImage(named: "money 1")
           
            cell.hint.isHidden = true
        }
        
        
        if item.type == "ApplePay" {
            //Apple_Pay_Mark_RGB_041619 1
            cell.title.text = "Apple Pay"
            cell.iconimage.image = UIImage(named: "Apple_Pay_Mark_RGB_041619 1")
          
            cell.hint.isHidden = true
            
        } else  if item.type == "card" {
            cell.title.text = item.number
            cell.hint.text = item.expireIn
            cell.iconimage.image = UIImage(named: "Payment")
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
        self.selectedCard = item.cardID ?? 0
        print(self.paymentMethod)
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
      
        let percentage = 0.05 // 5% as a decimal
        if let  price = self.offer?.price {
            let result = Int(Double(price) * percentage)
            self.vatCost.text = "\(result)" + " " + "SAR".localize
        }
        
        
    }
    
    
    
    func getBasicTripDetails () {
        self.driverName.text = self.tripDetails?.driver_name
        self.tripDate.text = self.tripDetails?.start_date?.convertFromIso()
        self.from.text = self.tripDetails?.startLocation ?? "--"
        self.to.text = self.tripDetails?.destinationlocationname ?? "--"
        if let image =  self.tripDetails?.driver_avatar {
            self.driverImage.setImage(image: Server.imageBase.rawValue + image )
        }
      
        if let dist =  self.tripDetails?.distance {
           // let km = dist
            self.destance.text = "\(dist.rounded())" + "KM"
        }
        if let price = self.tripDetails?.basic_trip_price_per_seat  {
            self.seatPrice.text = "\(price )" + " " + "SAR".localize
            
        }
        
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
    
//MARK: - REPLACE CHCEK BUTTON WITH ANIMATION  METHOD
    
    func replaceCheckButton () {
        self.checkCodeOutlet.isHidden = true
        self.checkCodeOutlet.isEnabled = false
       
        logoAnimation.contentMode = .scaleAspectFit
        logoAnimation.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(logoAnimation)

        logoAnimation.centerXAnchor.constraint(equalTo: checkCodeOutlet.centerXAnchor).isActive = true
        logoAnimation.centerYAnchor.constraint(equalTo: checkCodeOutlet.centerYAnchor).isActive = true
        logoAnimation.heightAnchor.constraint(equalToConstant: 45).isActive = true
        logoAnimation.widthAnchor.constraint(equalToConstant: 45).isActive = true
        logoAnimation.loopMode = .playOnce
        logoAnimation.play()
    }
    
    func removeLottieCheckMark () {
        self.checkCodeOutlet.isHidden = false
        self.checkCodeOutlet.isEnabled = true
        if let superview = logoAnimation.superview {
            UIView.animate(withDuration: 0.3, animations: {
                self.logoAnimation.alpha = 0
            }, completion: { _ in
                self.logoAnimation.removeFromSuperview()
            })
        }
        
    }
    
    
    
    
    // confirmation +  success process 
    
    func GotoNextStep (tripId : Int  , appleCheckOutId : String) {
        if self.paymentMethod == .applePay {
            
         
            self.presentApplePayView(appleCheckOutId: appleCheckOutId, tripId: tripId)
            
            
            //paymentWebView
        } else {
            self.goToSuccessScreen(id: tripId)
        }
        
        
      
    }
    
    private func presentApplePayView ( appleCheckOutId : String , tripId : Int ) {
        print("apple checkout id is 🍎🍎🍎🍎")
        print(appleCheckOutId)
        let type : String =   viptrip ? "vip-trip" : "basic-trip"
        let vc = paymentWebView()
        vc.requestMethod = .get
        vc.webUrl =  Server.applePayBase.rawValue + "\(appleCheckOutId)&type=\(type)"
        vc.action = {
            self.goToSuccessScreen(id: tripId)
            print("🍎🍎🍎🍎 apple pay pass : done successfully ")
        }
        self.present(vc, animated: true )
    }
    
    private func goToSuccessScreen (id : Int) {
        let vc = successBookViewVC()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overCurrentContext
        if viptrip {
            vc.drivername = self.offer?.driver?.name ?? ""
        } else {
            vc.drivername = self.tripDetails?.driver_name ?? ""
        }
    vc.action = {
        let vc = trackYourTripVC()
        vc.vipTrip = self.viptrip
        vc.tripId =  id  //self.tripId
        vc.basicPickLat = self.tripDetails?.pickuplocation?.lat ?? 0
        vc.basicPickLng =  self.tripDetails?.pickuplocation?.lng ?? 0
        vc.basicDesLat = self.tripDetails?.destinationlocation?.lat ?? 0
        vc.basicDesLng = self.tripDetails?.destinationlocation?.lng ?? 0

        self.push(vc)
    }
        self.present( vc , animated: true )
    }
    
    
    
}
