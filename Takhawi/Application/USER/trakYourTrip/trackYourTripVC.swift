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
    
    @IBOutlet weak var plateNumAr: UILabel!
    
    @IBOutlet weak var plateAlpha: UILabel!
    @IBOutlet weak var plateNumEN: UILabel!
    
    @IBOutlet weak var tripDateC: UILabel!
    @IBOutlet weak var plateAlphaEN: UILabel!
    
    
    
    //MARK: - Properties -
    
    var animatePolyline: AnimatePolyline?
    var count = 10
    var stopCompleteTheTrip : Bool = false
    var vipTrip : Bool = false
    var tripId : Int = 0
    var MainTrip : GeneralTripResult?
 
    var passengerTripId : Int = 0
 //   var basicResult : OneBasicResult?
 
    var basicPickLat : Double = 0
    var basicPickLng : Double = 0
    var basicDesLat : Double = 0
    var basicDesLng : Double = 0
    
    var TrackMarker: GMSMarker!
    
    let socketManager = MySocketManager()
    
    
// MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureInitialDesign()
        self.getTripDetails()
       // self.setUpGoogleView()
        let vc = sosCallsVC()
        vc.modalPresentationStyle = .fullScreen
     //   vc.modalTransitionStyle = .crossDissolve
        self.present(vc , animated: true )
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.connectSocket()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.socketManager.disconnect()
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
        vc.id = self.tripId
        vc.type = self.vipTrip ? "VIP" : "BASIC"
        vc.passengerTripId = self.passengerTripId
        self.push(vc)

        
    }
    @IBAction func sosCalls(_ sender: UIButton) {
        let vc = sosCallsVC()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        self.present(vc , animated: true )
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
        vc.id =  self.tripId
        vc.type =  self.vipTrip ? "VIP" : "BASIC"
        vc.passengerTripId = self.passengerTripId
        self.push(vc)
    }
    
    
    @IBAction func callDriver(_ sender: UIButton) {
        if let phoneURL = URL(string: "tel://\(self.MainTrip?.driver?.phone ?? "")") {
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
        
        
        // first open the chat on the server side 
        activityIndicatorr.startAnimating()
     
        
        self.openChat(driverId: self.MainTrip?.driver?.id ?? 0,
                      driverName: self.MainTrip?.driver?.name ?? "",
                      phone: self.MainTrip?.driver?.phone ?? ""   )


        
        
    }
    
    
    func openChat ( driverId : Int  , driverName : String , phone : String) {
        activityIndicatorr.startAnimating()
        UserRouter.openChat(tripId:  self.tripId , driverId: driverId, userId: UserDefaults.user?.user?.id ?? 0, ISdriver: false   ).send { [weak self ] ( response : APIGenericResponse<openChatResult>)  in
            guard let self = self else { return }
            if response.status == true  {
                self.goToChat(withId: response.result?.id ?? "", driverId: response.result?.driverId ?? 0, reciverName: driverName, phone: phone   )
            }
    } }
    
    
    
    private func goToChat (withId : String , driverId : Int , reciverName : String , phone : String ) {
        
        let myAvatarLink = Server.imageBase.rawValue +  (UserDefaults.user?.user?.avatar ?? "" )
        let vc = ChatViewController(conversationId:  withId 
                                    , titleName: reciverName ,
                                    socketManger:
                    ChatSocketConnection(ConnectionType: .chat, conversationId: withId ,
                                         sender: .init(type: .client, id: "\(UserDefaults.user?.user?.id ?? 0)",
                                                       senderName: UserDefaults.user?.user?.name ?? "" , avatar: myAvatarLink ),
                    receiver: .init(id: "\(driverId)", type: .provider)))
        vc.partnerImage = Server.imageBase.rawValue + ( self.MainTrip?.driver?.avatar ?? "" )
        vc.partnerPhoneNumber = phone
        self.push(vc)
        
    }
    
}


//MARK: - Networking -
extension trackYourTripVC {
    func getTripDetails () {
        activityIndicatorr.startAnimating()
        UserRouter.getOneGeneralTrip(id: tripId).send{ [weak self] (response : APIGenericResponse < GeneralTripResult >)  in
            guard let self = self else { return }
            if let result = response.result {
                self.MainTrip = result
                self.passengerTripId = result.passengerTripId ?? 0
                self.setUpGoogleView(lat1: result.pickup_location?.lat ?? 0  ,
                                     lat2: result.destinationL?.lat ?? 0  ,
                                     lng1: result.pickup_location?.lng ?? 0  ,
                                     lng2:  result.destinationL?.lng ?? 0 )
                self.driverName.text = result.driver?.name ?? ""
                
                self.rate.rating = result.driver?.driver_rate ?? 0
                self.secRate.rating = result.driver?.driver_rate ?? 0
                self.secDriverName.text =  result.driver?.name ?? ""
                self.driverImage.setImage(image: Server.imageBase.rawValue + (result.driver?.avatar ?? "") )
                self.secDriverImage.setImage(image: Server.imageBase.rawValue + (result.driver?.avatar ?? "") )
                let color = result.vehicle?.vehicle_Color?.name ?? ""
                let name = result.vehicle?.vehicle_Name?.name  ?? ""
                let className = result.vehicle?.vehicle_Class?.name ?? ""
                let type = result.vehicle?.vehicle_Type?.name ?? ""
               
                self.carModelName.text = name  + " " +  className + " " + type + " " +  color
                self.plateAlphaEN.text = result.vehicle?.plate_alphabet ?? ""
                self.plateNumEN.text = result.vehicle?.plate_number ?? ""
                self.plateAlpha.text = result.vehicle?.plate_alphabet ?? ""
                self.plateNumAr.text = result.vehicle?.plate_number ?? ""
                self.tripPrice.text = "\(result.price ?? 0)" + "SAR".localize
                
                
                self.tripDateC.text = "trip date : ".localize + (result.start_date?.convertFromIso() ?? "" )
                
            }
         }
        }
   
    
    
    
    
     
//   private func getBasicTripDetials ( tripId : Int ) {
//        activityIndicatorr.startAnimating()
//
//        UserRouter.getOneTrip(id: tripId ).send { [weak self] (response : APIGenericResponse < OneBasicResult >)  in
//            guard let self = self else { return }
//            if let result = response.result {
//                self.basicResult = result
//               
//                self.handleBasicView()
//            }
//        }
//    }
    
    
    
    
//   private func getVipTripDetails (tripId : Int ) {
//        activityIndicatorr.startAnimating()
//        UserRouter.getVip(id: tripId).send { [weak self ] (response :  APIGenericResponse < OneVipTripResult > )  in
//            guard let self = self else { return }
//            if let result = response.result {
//                self.vipResult = result
//                self.passengerTripId = result.passnger_id ?? 0
//                self.handlevipView()
//            }
//        }
//    }
//    

    
    
}

//MARK: - Routes -
extension trackYourTripVC {
    
}
