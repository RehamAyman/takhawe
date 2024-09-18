//
//  trackYourTripVC.swift
//  Takhawi
//
//  Created by Reham Ayman on 10/12/2023.
//
//  Template by MGAbouarab®


import UIKit
import GoogleMaps
import CountdownLabel
import Cosmos

class trackYourTripVC: BaseVC {
    
//MARK: - IBOutlets -
    @IBOutlet weak var step1View: UIView!
    @IBOutlet weak var tripStartViewheight: NSLayoutConstraint!
    @IBOutlet weak var driverImage: UIImageView!
    @IBOutlet weak var secDriverImage: UIImageView!
    
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var deliveryTime: UILabel!
    @IBOutlet weak var tripPrice: UILabel!
    @IBOutlet weak var carModelName: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var driverName: UILabel!
    @IBOutlet weak var rate: CosmosView!
    
    @IBOutlet weak var tripStartView: UIView!
    @IBOutlet weak var topViewHeight: NSLayoutConstraint!
    @IBOutlet weak var step2View: UIView!
    @IBOutlet weak var hintLabel: UILabel!
    @IBOutlet weak var driverArriveIn: CountdownLabel!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var googleView: GMSMapView!
    @IBOutlet weak var secDriverName: UILabel!
    
    @IBOutlet weak var secDistance: UILabel!
    @IBOutlet weak var secDeliverTime: UILabel!
    @IBOutlet weak var secRate: CosmosView!
    //MARK: - Properties -
    var animatePolyline: AnimatePolyline?
    var count = 10
    var stopCompleteTheTrip : Bool = false
    var tripData : MainTripResult?
    var vipTrip : Bool = false 
    var comeFromSideMenu : Bool = false 
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.getTripDetails()
        self.setUpGoogleView()
        self.setUpMainView()
       
       
    }
    
    
//MARK: - Design Methods -
    private func configureInitialDesign() {
        self.title = "".localized
        self.bottomView.layer.addBasicShadow(cornerRadius: 20)
        self.tripStartView.layer.addBasicShadow(cornerRadius: 20)
        
      //  self.driverArriveIn.addTime(time: 10 )
      //  self.tripStartViewheight.constant = 0
       
      //  self.driverArriveIn.start()
        self.topViewHeight.constant = 21
      
// trip
       // DispatchQueue.main.asyncAfter(deadline: .now() + 10 ) {
//            UIView.animate(withDuration: 0.3 ) {
//                self.topViewHeight.constant = 45
//                self.step1View.isHidden = true
//                self.step2View.isHidden = false
//                self.view.layoutIfNeeded()
//            }
           
// trip start
//            DispatchQueue.main.asyncAfter(deadline: .now() + 10 ) {
//                self.bottomView.isHidden = true
//                self.topViewHeight.constant = 0
//                self.step2View.isHidden = true
//                self.tripStartView.isHidden = false
//                UIView.animate(withDuration: 0.3 ) {
//                    self.tripStartViewheight.constant = 200
//                    self.view.layoutIfNeeded()
//                }
//                
//                // trip end go to rate the driver
//                self.tripEnd()
//
//                
//            }
            
            
            
            
            

      //  }
        
        
        
        
        
    }
    
//MARK: - Logic Methods -
    private func changeTripViewDown () {
   
        self.bottomView.isHidden = true
        self.topViewHeight.constant = 0
        self.step2View.isHidden = true
        self.tripStartView.isHidden = false
        UIView.animate(withDuration: 0.5 ) {
            self.tripStartViewheight.constant = 200
            self.view.layoutIfNeeded()
        }
        
        
    }
    
    private func changeTripViewUp () {
      //  self.topViewHeight.constant = 45
        self.step1View.isHidden = true
        self.step2View.isHidden = false
        self.bottomView.isHidden = false
       
        //self.step2View.isHidden = true
        self.tripStartView.isHidden = true
        UIView.animate(withDuration: 0.5 ) {
            self.tripStartViewheight.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
//MARK: - Actions -
    @IBAction func flagAction(_ sender: UIButton) {
     
        self.stopCompleteTheTrip = true
        let vc = reportCancelVC()
        vc.report = true
        vc.id = self.tripData?.id ?? 0
        vc.type = self.tripData?.type ?? ""
        vc.passengerTripId = self.tripData?.passengerTripId ?? 0
        self.push(vc)
      
        
        
    }
    
    
    @IBAction func dowwnIcon(_ sender: UIButton) {
        self.changeTripViewDown()
    }
    
    @IBAction func upAction(_ sender: UIButton) {
        self.changeTripViewUp()
    }
    
    @IBAction func cancelTrip(_ sender: UIButton) {
        let vc = reportCancelVC()
        vc.report = false
        vc.id = self.tripData?.id ?? 0
        vc.type = self.tripData?.type ?? ""
        vc.passengerTripId = self.tripData?.passengerTripId ?? 0
        self.push(vc)
    }
    
    
    @IBAction func callDriver(_ sender: UIButton) {
        if let phoneURL = URL(string: "tel://\(+966444444444)") {
               if UIApplication.shared.canOpenURL(phoneURL) {
                   UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
               } else {
                   print("Phone call not supported on this device.")
               }
           } else {
               print("Invalid phone number.")
           }
  
    }
    @IBAction func messageDriver(_ sender: UIButton) {
    }
    
    
    
    
}


//MARK: - Networking -
extension trackYourTripVC {
    func getTripDetails () {
        if self.tripData?.type == "BASIC" {
            self.getBasicTripDetials(tripId: self.tripData?.id ?? 0 )
        } else {
            
        }
    }
     
    func getBasicTripDetials ( tripId : Int ) {
        
        activityIndicatorr.startAnimating()
        UserRouter.getOneTrip(id: tripId ).send { [weak self] (response : APIGenericResponse< OneBasicResult >)  in
            guard let self = self else { return }
            
            if let result = response.result {
               
            }
            
            
        }
    }
    
    func getVipTripDetails (tripId : Int ) {
       
    }
    
 
    
    
}

//MARK: - Routes -
extension trackYourTripVC {
    
}
